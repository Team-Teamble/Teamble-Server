const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectDB, typeDB, tagDB, positionDB, fieldDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { userId } = req.params;

  if (!userId) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));

  let client;

  try {
    client = await db.connect(req);

    // 1-1. 유저 정보 가져오기
    let user = await userDB.getUserByUserId(client, userId);

    if (!user) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NO_USER));

    // 1-2. 프로젝트 id 가져오기
    const projectId = await projectDB.getProjectIdByUserId(client, user.id);

    // 2-1. 유저의 타입 id 가져오기 (intger | null)
    const typeId = await userDB.getTypeIdByUserId(client, user.id);

    // 2-2. 해당 typeId의 데이터 가져오기
    const type = await typeDB.getTypeByTypeId(client, typeId);

    // 2-3. 해당 타입의 태그들 가져오기
    const tag = await tagDB.getTagByTypeId(client, typeId);

    // 3-1. 유저 포지션 id 배열 가져오가
    const positionId = await positionDB.getPositionIdByUserId(client, userId);

    // 3-2. 해당 유저의 포지션들 가져오기
    const position = await positionDB.getPositionByPositionId(client, positionId);

    // 4-1. 유저 필드 id 배열 가져오가
    const fieldId = await fieldDB.getFieldIdByUserId(client, userId);

    // 4-2. 해당 유저의 필드들 가져오기
    const field = await fieldDB.getFieldByFieldId(client, fieldId);

    // 5. user 객체에 모든 데이터를 병합
    user = _.merge(user, { projectId, type, tag, position, field });

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.GET_USER_PROFILE_SUCCESS, { user }));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} userId: ${userId} ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
