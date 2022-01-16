const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { positionDB, tagDB, fieldDB } = require('../../../db');

module.exports = async (req, res) => {
  let client;

  try {
    client = await db.connect(req);

    const position = await positionDB.getPosition(client);

    const tag = await tagDB.getTag(client);

    const field = await fieldDB.getField(client);

    const data = {
      member: {
        position,
        tag,
        field,
      },
    };

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.GET_MEMBER_SEARCH_METADATA_SUCCESS, data));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
