const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectDB, typeDB, tagDB, positionDB, fieldDB } = require('../../../db');
const { TOKEN_INVALID, TOKEN_EXPIRED } = require('../../../constants/jwt');
const slackAPI = require('../../../middlewares/slackAPI');

const jwtHandlers = require('../../../lib/jwtHandlers');

module.exports = async (req, res) => {
  let client;

  // request headers에 X-Authorization-Token라는 이름으로 담긴 값(jwt)을 가져옵니다.
  const accesstoken = req.headers['x-authorization-token'];

  // accesstoken이 없을 시의 에러 처리입니다.
  if (!accesstoken) return res.status(statusCode.UNAUTHORIZED).send(util.fail(statusCode.UNAUTHORIZED, responseMessage.TOKEN_EMPTY));

  try {
    client = await db.connect(req);

    // 1-1. 유저 정보 가져오기
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

    // 1-2. 프로젝트 id 가져오기
    const projectId = await projectDB.getProjectIdByUserId(client, user.id);

    // 2-1. 유저의 타입 id 가져오기 (intger | null)
    const typeId = await userDB.getTypeIdByUserId(client, user.id);

    // 2-2. 해당 typeId의 데이터 가져오기
    const type = await typeDB.getTypeByTypeId(client, typeId);

    // 2-3. 해당 타입의 태그들 가져오기
    const tag = await tagDB.getTagByTypeId(client, typeId);

    // 3-1. 유저 포지션 id 배열 가져오가
    const positionId = await positionDB.getPositionIdByUserId(client, user.id);

    // 3-2. 해당 유저의 포지션들 가져오기
    const position = await positionDB.getPositionByPositionId(client, positionId);

    // 4-1. 유저 필드 id 배열 가져오가
    const fieldId = await fieldDB.getFieldIdByUserId(client, user.id);

    // 4-2. 해당 유저의 필드들 가져오기
    const field = await fieldDB.getFieldByFieldId(client, fieldId);

    user = _.merge(user, { projectId, type, tag, position, field });

    res.status(statusCode.OK).send(
      util.success(statusCode.OK, responseMessage.LOGIN_SUCCESS, {
        user,
      }),
    );
  } catch (error) {
    functions.logger.error(`[LOGIN ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} ${req.user ? `uid:${req.user.userId}` : 'req.user 없음'} ${JSON.stringify(error)}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
