const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectDB, typeDB, tagDB, userPositionDB, positionDB, fieldDB, userFieldDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { userId } = req.params;
  const { positionId, phone, university, major, area, intro, typeId, fieldId, description } = req.body;

  if (!userId) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));

  // 모든 값이 들어왔는지 확인
  if (!positionId || !phone || !university || !major || !area || !intro || !typeId || !fieldId || !description)
    return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.UPDATE_USER_BLANK_BOX));

  let client;

  try {
    client = await db.connect(req);

    // 1. user 테이블 업데이트 하기 (phone, university, major, area, intro, typeId, description)
    let user = await userDB.updateUserProfile(client, userId, phone, university, major, area, intro, typeId, description);
    if (!user) return res.status(statusCode.NOT_FOUND).send(util.fail(statusCode.NOT_FOUND, responseMessage.NO_USER));

    // 2. 유저의 프로젝트 id 가져오기
    const projectId = await projectDB.getProjectIdByUserId(client, userId);

    // 3. 업데이트된 데이터들 가져온 후 response 먼저 보내주기
    const type = await typeDB.getTypeByTypeId(client, typeId);
    const tag = await tagDB.getTagByTypeId(client, typeId);
    const position = await positionDB.getPositionByPositionId(client, positionId);
    const field = await fieldDB.getFieldByFieldId(client, fieldId);

    // 유저 객체에 필요한 데이터 모두 병합
    user = _.merge(user, { projectId, type, tag, position, field });

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.UPDATE_USER_PROFILE_SUCCESS, { user }));

    // 4. 유저 포지션 업데이트
    // 기존의 유저 포지션 id 배열 가져오가
    const existingPositionId = await positionDB.getPositionIdByUserId(client, userId);

    // 기존의 id와 비교하여 업데이트할 id만 추출하기
    const insertingPositionId = _.differenceBy(positionId, existingPositionId);
    const deletingPositionId = _.differenceBy(existingPositionId, positionId);

    // 유저 포지션 id 업데이트 하기
    userPositionDB.updateUserPosition(client, userId, insertingPositionId, deletingPositionId);

    // 5. 유저 필드 업데이트
    // 기존의 유저 필드 id 배열 가져오가
    const existingFieldId = await fieldDB.getFieldIdByUserId(client, userId);

    // 기존의 id와 비교하여 업데이트할 id만 추출하기
    const insertingFieldId = _.differenceBy(fieldId, existingFieldId);
    const deletingFieldId = _.differenceBy(existingFieldId, fieldId);

    // 유저 필드 id 업데이트 하기
    userFieldDB.updateUserField(client, userId, insertingFieldId, deletingFieldId);
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${
      req.originalUrl
    } [CONTENT] userId: ${userId}, positionId: ${positionId},  phone: ${phone},  university: ${university},  major: ${major},  area: ${area},  intro: ${intro},  typeId: ${typeId},  fieldId: ${fieldId}, description: ${description} / ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
