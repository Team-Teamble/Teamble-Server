const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userPokeDB, userDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { userId, pokingUserId } = req.params;

  if (!userId || !pokingUserId) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));

  let client;

  try {
    client = await db.connect(req);

    // 1. 나를 찔러본 사람 삭제
    await userPokeDB.deletePokingUser(client, userId, pokingUserId);

    // 2. 삭제 후 나를 찔러 본 사람들의 id 배열 가져오기
    const memberId = await userPokeDB.getPokingUserIdByUserId(client, userId);

    // 3. 콕 찌른 유저들의 정보 가져오기
    const memberCard = await userDB.getPokingUserByMemberId(client, memberId);

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.DELETE_POKE_USER_SUCCESS, { memberCard }));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} [CONTENT] userId: ${userId}, pokingUserId: ${pokingUserId} / ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
