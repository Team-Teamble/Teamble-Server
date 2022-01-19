const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectDB, tagDB, fieldDB, projectPeriodDB, periodDB, projectPositionDB, goalDB, projectGoalDB, projectTagDB, projectFieldDB, memberDB } = require('../../../db');
const { TOKEN_INVALID, TOKEN_EXPIRED } = require('../../../constants/jwt');
const jwtHandlers = require('../../../lib/jwtHandlers');
const dayjs = require('dayjs');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { title, intro, periodId, position, goalId, tagId, fieldId, area, startDate, endDate, description, memberId } = req.body;

  if (!title || !intro || !periodId || !position || !goalId || !tagId || !fieldId || !area || !startDate || !endDate || !description || !memberId) {
    return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.PROJECT_BLANK_BOX));
  }

  let client;

  // request headers에 X-Authorization-Token라는 이름으로 담긴 값(jwt)을 가져옵니다.
  const accesstoken = req.headers['x-authorization-token'];

  // accesstoken이 없을 시의 에러 처리입니다.
  if (!accesstoken) return res.status(statusCode.UNAUTHORIZED).send(util.fail(statusCode.UNAUTHORIZED, responseMessage.TOKEN_EMPTY));

  try {
    client = await db.connect(req);

    // 1-1 유저 정보 가져오기
    // jwt를 해독하고 인증 절차를 거칩니다.
    const decodedToken = jwtHandlers.verify(accesstoken);
    // jwt가 만료되었거나 잘못되었을 시의 에러 처리입니다.
    if (decodedToken === TOKEN_EXPIRED) return res.status(statusCode.UNAUTHORIZED).send(util.fail(statusCode.UNAUTHORIZED, responseMessage.TOKEN_INVALID));
    if (decodedToken === TOKEN_INVALID) return res.status(statusCode.UNAUTHORIZED).send(util.fail(statusCode.UNAUTHORIZED, responseMessage.TOKEN_INVALID));

    // 해독된 jwt에 담긴 id 값이 우리가 DB에서 찾고자 하는 user의 id입니다.
    const userId = decodedToken.id;
    // 유저id가 없을 시의 에러 처리입니다.
    if (!userId) return res.status(statusCode.UNAUTHORIZED).send(util.fail(statusCode.UNAUTHORIZED, responseMessage.TOKEN_INVALID));

    // 위의 id 값으로 유저를 조회합니다.
    let user = await userDB.getUserByUserId(client, userId);

    // 유저가 없을 시의 에러 처리입니다.
    if (!user) return res.status(statusCode.UNAUTHORIZED).send(util.fail(statusCode.UNAUTHORIZED, responseMessage.NO_USER));

    // 2.2 프로젝트 Table에 정보 저장하기
    const project = await projectDB.addProject(client, userId, title, intro, dayjs(startDate), dayjs(endDate), area, description);

    // 2.2 해당 유저가 가진 프로젝트 id 불러오기
    const projectId = await projectDB.getProjectIdByUserId(client, userId);

    // 3.1 project period 정보 추가
    await projectPeriodDB.addPeriodProject(client, projectId, periodId);

    // 3.2 기간 정보 불러오기
    const period = await periodDB.getPeriodByPeriodId(client, periodId);

    // 4.1 project position 정보 추가
    await projectPositionDB.addPositionProject(client, projectId, position);

    // 4.2 포지션, 포지션 수 mapping해서 불러오기
    // 해당 프로젝트 포지션 배열
    const positions = await projectPositionDB.getPositionByPositionId(client, projectId);

    // 해당 프로젝트 포지션 수 배열
    const positionNums = await projectPositionDB.getPositionNumByPositionId(client, projectId);

    let positionResult = [];

    positions.map((position, pindex) => {
      positionNums.map((positionNum, nindex) => {
        if (pindex === nindex) {
          positionResult.push({
            id: position.id,
            name: position.name,
            positionNum: positionNum,
          });
        }
      });
    });

    // 5.1 project_goal 테이블에 정보 추가
    await projectGoalDB.addGoalProject(client, projectId, goalId);

    // 5.2 목표 정보 불러오기
    const goal = await goalDB.getGoalByGoalId(client, goalId);

    // 6.1 선호 협업성향 테이블에 정보 추가
    await projectTagDB.addTagProject(client, projectId, tagId);

    // 6.2 선호 협업성향 불러오기
    const tags = await tagDB.getTagByTagId(client, tagId);

    // 7.1 분야 테이블에 정보 추가
    await projectFieldDB.addFieldProject(client, projectId, fieldId);

    // 7.2 분야 불러오기
    const fields = await fieldDB.getFieldByFieldId(client, fieldId);

    // 8.1 팀 구성원 member 테이블에 정보 추가
    await memberDB.addMember(client, projectId, memberId);

    // 8.2 팀 구성원 불러오기
    const members = await memberDB.getUserByMemberId(client, memberId);

    const data = {
      project,
      period,
      position: positionResult,
      goal,
      tag: tags,
      field: fields,
      member: members,
    };

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.CREATE_PROJECT_SUCCESS, data));
  } catch (error) {
    console.log(error);
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} ${req.user ? `uid:${req.user.userId}` : 'req.user 없음'} ${JSON.stringify(error)}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
