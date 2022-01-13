const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectDB, typeDB } = require('../../../db');

module.exports = async (req, res) => {
  const { userId } = req.params;

  if (!userId)
    return res
      .status(statusCode.BAD_REQUEST)
      .send(util.fail(statusCode.BAD_REQUEST, responseMessage.OUT_OF_VALUE));

  let client;

  try {
    client = await db.connect(req);

    // 1.
    let user = await userDB.getUserByUserId(client, userId);
    if (!user)
      return res
        .status(statusCode.BAD_REQUEST)
        .send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));

    const projectId = await projectDB.getProjectIdByUserId(client, user.id);

    // 5. user 객체에 projectId 를 병합
    user = _.merge(user, { projectId });

    const type = await typeDB.getTypeByTypeId(client);
    // const emptyObject = {}

    //   user.project = projectId || null;
    // if (!projectId)

    // if(user.type_id) {
    //   user.type = /
    // }

    res
      .status(statusCode.OK)
      .send(
        util.success(
          statusCode.OK,
          responseMessage.GET_USER_PROFILE_SUCCESS,
          user
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
