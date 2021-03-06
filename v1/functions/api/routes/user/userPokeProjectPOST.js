const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, typeDB, tagDB, positionDB, fieldDB, projectPokeDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { projectId, userId } = req.body;

  if (!projectId || !userId) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));

  let client;

  try {
    client = await db.connect(req);

    // 팀 지원하기
    await projectPokeDB.addProjectPoke(client, projectId, userId);

    // 1-1. projectId로 찜 당한 user 불러오기
    const fokedUser = await userDB.getUserDataByProjectId(client, projectId);
    if (!fokedUser) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NO_USER));

    let user = await userDB.getUserByUserId(client, userId);

    // 1-2. 찜 당한 유저 is_checked = false
    await userDB.updatePokedUserIsChecked(client, fokedUser.id);

    // 2-1. 찜 한 유저의 타입 id 가져오기 (intger | null)
    const typeId = await userDB.getTypeIdByUserId(client, userId);

    // 2-2. 해당 typeId의 데이터 가져오기
    const type = await typeDB.getTypeByTypeId(client, typeId);

    // 2-3. 해당 타입의 태그들 가져오기
    const tag = await tagDB.getTagByTypeId(client, typeId);

    // 3-1. 유저 포지션 id 배열 가져오기
    const positionId = await positionDB.getPositionIdByUserId(client, userId);

    // 3-2. 해당 유저의 포지션들 가져오기
    const position = await positionDB.getPositionByPositionId(client, positionId);

    // 4-1. 유저 필드 id 배열 가져오기
    const fieldId = await fieldDB.getFieldIdByUserId(client, userId);

    // 4-2. 해당 유저의 필드들 가져오기
    const field = await fieldDB.getFieldByFieldId(client, fieldId);

    // 5. user 객체에 모든 데이터를 병합
    user = _.merge(user, { projectId, type, tag, position, field });

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.VOLUNTEER_TEAM_SUCCESS, { user: user }));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} [CONTENT] projectId: ${projectId}, userId: ${userId} / ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
