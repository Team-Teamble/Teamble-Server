const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectDB, tagDB, fieldDB, projectPeriodDB, periodDB, projectPositionDB, goalDB, projectGoalDB, projectTagDB, projectFieldDB, memberDB } = require('../../../db');
const dayjs = require('dayjs');

module.exports = async (req, res) => {
  const { periodId, positionId, goalId, tagId, fieldId, count, page } = req.body;

  if (!periodId || !positionId || !goalId || !tagId || !fieldId || !count || !page) {
    return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
  }

  let client;

  try {
    client = await db.connect(req);

    const data = await projectDB.getProjectByFilter(client, periodId, positionId, goalId, tagId, fieldId, count, page);

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.GET_PROJECT_SEARCH_SUCCESS, { project: data }));
  } catch (error) {
    console.log(error);
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};