const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, userPokeDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { userId } = req.params;

  if (!userId) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));

  let client;

  try {
    client = await db.connect(req);

    // 1. 콕 찌르기 당한 유저의 알림 확인 여부 업데이트
    const user = await userDB.updatePokedUser(client, userId);
    if (!user) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NO_USER));

    // 2. 콕 찌른 유저들의 id 배열 가져오기
    const memberId = await userPokeDB.getPokingUserIdByUserId(client, userId);

    // 3. 콕 찌른 유저들의 정보 가져오기
    const memberCard = await userDB.getPokingUserByMemberId(client, memberId);

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.READ_POKE_USER_SUCCESS, { user, memberCard }));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} [CONTENT] userId: ${userId} / ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
