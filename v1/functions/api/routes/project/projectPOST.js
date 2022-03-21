const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectDB, tagDB, fieldDB, projectPeriodDB, periodDB, projectPositionDB, goalDB, projectGoalDB, projectTagDB, projectFieldDB, memberDB } = require('../../../db');
const dayjs = require('dayjs');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { userId, title, intro, periodId, position, goalId, tagId, fieldId, area, startDate, endDate, description, memberId } = req.body;

  if (!userId || !title || !intro || !periodId || !position || !goalId || !tagId || !fieldId || !area || !startDate || !endDate || !description) {
    return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.PROJECT_BLANK_BOX));
  }

  let client;

  try {
    client = await db.connect(req);

    let user = await userDB.getUserByUserId(client, userId);

    // 유저가 없을 시의 에러 처리입니다.
    if (!user) return res.status(statusCode.UNAUTHORIZED).send(util.fail(statusCode.UNAUTHORIZED, responseMessage.NO_USER));

    // 1.1 프로젝트 Table에 정보 저장하기
    await projectDB.addProject(client, userId, title, intro, dayjs(startDate), dayjs(endDate), area, description);

    // 1.2 해당 유저가 가진 프로젝트 id 불러오기
    const projectId = await projectDB.getProjectIdByUserId(client, userId);

    const project = await projectDB.getProjectByProjectId(client, projectId);

    // 2.1 project period 정보 추가
    await projectPeriodDB.addPeriodProject(client, projectId, periodId);

    // 2.2 기간 정보 불러오기
    const period = await periodDB.getPeriodByPeriodId(client, periodId);

    // 3.1 project position 정보 추가
    await projectPositionDB.addPositionProject(client, projectId, position);

    // 3.2 포지션, 포지션 수 mapping해서 불러오기
    // 해당 프로젝트 포지션 배열
    const positions = await projectPositionDB.getPositionByPositionId(client, projectId);

    console.log('positions: ');

    // 해당 프로젝트 포지션 수 배열
    const positionNums = await projectPositionDB.getPositionNumByPositionId(client, projectId);

    console.log('positionsss: ');

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

    // 4.1 project_goal 테이블에 정보 추가
    await projectGoalDB.addGoalProject(client, projectId, goalId);

    // 4.2 목표 정보 불러오기
    const goal = await goalDB.getGoalByGoalId(client, goalId);

    // 5.1 선호 협업성향 테이블에 정보 추가
    await projectTagDB.addTagProject(client, projectId, tagId);

    // 5.2 선호 협업성향 불러오기
    const tags = await tagDB.getTagByTagId(client, tagId);

    // 6.1 분야 테이블에 정보 추가
    await projectFieldDB.addFieldProject(client, projectId, fieldId);

    // 6.2 분야 불러오기
    const fields = await fieldDB.getFieldByFieldId(client, fieldId);

    let members;

    if (!memberId) {
      members = [];
    } else {
      // 7.1 팀 구성원 member 테이블에 정보 추가
      await memberDB.addMember(client, projectId, memberId);

      // 7.2 팀 구성원 불러오기
      members = await memberDB.getUserByMemberId(client, memberId);
    }

    const data = _.merge(project, { period }, { position: positionResult }, { goal }, { tag: tags }, { field: fields }, { member: members });

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.CREATE_PROJECT_SUCCESS, { project: data }));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${
      req.originalUrl
    } [CONTENT] userId: ${userId}, title: ${title},  intro: ${intro},  periodId: ${periodId},  position: ${position},  goalId: ${goalId},  tagId: ${tagId},  fieldId: ${fieldId},  area: ${area}, startDate: ${startDate}, endDate: ${endDate}, description: ${description}, memberId: ${memberId} / ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
