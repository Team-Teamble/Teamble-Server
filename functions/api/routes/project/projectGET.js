const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { projectDB, projectPeriodDB, projectPositionDB, projectGoalDB, projectTagDB, projectFieldDB, memberDB, userDB } = require('../../../db');
const dayjs = require('dayjs');

module.exports = async (req, res) => {
  const { projectId } = req.params;

  if (!projectId) {
    return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
  }

  let client;

  try {
    client = await db.connect(req);

    const projectPeriod = await projectPeriodDB.getPeriodByProjectId(client, projectId);

    const position = await projectPositionDB.getPositionByProjectId(client, projectId);

    const goal = await projectGoalDB.getGoalByProjectId(client, projectId);

    const tag = await projectTagDB.getTagByProjectId(client, projectId);

    const field = await projectFieldDB.getFieldByProjectId(client, projectId);

    const member = await memberDB.getMemberByProjectId(client, projectId);

    const user = await userDB.getUserDataByProjectId(client, projectId);

    const data = _.merge(projectPeriod, { position }, { goal }, { tag }, { field }, { member }, { user });

    res.status(statusCode.OK).send(
      util.success(statusCode.OK, responseMessage.GET_PROJECT_SUCCESS, {
        project: data,
      }),
    );
  } catch (error) {
    console.log(error);
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
