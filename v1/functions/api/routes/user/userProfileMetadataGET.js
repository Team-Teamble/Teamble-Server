const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { positionDB, typeDB, fieldDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  let client;

  try {
    client = await db.connect(req);

    const position = await positionDB.getPositionWithoutAll(client);

    const type = await typeDB.getType(client);

    const field = await fieldDB.getFieldWithoutAll(client);

    const data = {
      user: {
        position,
        type,
        field,
      },
    };

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.GET_USER_PROFILE_METADATA_SUCCESS, data));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} [CONTENT] ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
