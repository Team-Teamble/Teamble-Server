const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { positionId, tagId, fieldId, count, page } = req.body;

  // 모든 필터값이 있는지 확인
  if (!positionId || !tagId || !fieldId || !count || !page) {
    return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
  }

  let client;

  try {
    client = await db.connect(req);

    const memberCard = await userDB.getMemberByFilter(client, positionId, tagId, fieldId, count, page);

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.GET_MEMBER_SEARCH_SUCCESS, { memberCard }));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);
    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${
      req.originalUrl
    } [CONTENT] positionId: ${positionId}, tagId: ${tagId},  fieldId: ${fieldId},  count: ${count},  page: ${page} / ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
