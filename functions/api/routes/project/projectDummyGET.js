const functions = require("firebase-functions");
const util = require("../../../lib/util");
const statusCode = require("../../../constants/statusCode");
const responseMessage = require("../../../constants/responseMessage");
const db = require("../../../db/db");
const { periodDB, postionDB, goalDB, typeDB, fieldDB } = require("../../../db");

module.exports = async (req, res) => {
  let client;

  try {
    client = await db.connect(req);

    const period = await periodDB.getPeriod(client);

    const position = await postionDB.getPosition(client);

    const goal = await goalDB.getGoal(client);

    const type = await typeDB.getType(client);

    const field = await fieldDB.getField(client);

    const data = {
      project: {
        period,
        position,
        goal,
        type,
        field,
      },
    };

    res
      .status(statusCode.OK)
      .send(
        util.success(
          statusCode.OK,
          responseMessage.READ_ALL_USERS_SUCCESS,
          data
        )
      );
  } catch (error) {
    functions.logger.error(
      `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`,
      `[CONTENT] ${error}`
    );
    console.log(error);

    res
      .status(statusCode.INTERNAL_SERVER_ERROR)
      .send(
        util.fail(
          statusCode.INTERNAL_SERVER_ERROR,
          responseMessage.INTERNAL_SERVER_ERROR
        )
      );
  } finally {
    client.release();
  }
};