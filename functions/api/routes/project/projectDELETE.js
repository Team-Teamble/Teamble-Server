const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { projectDB, projectPeriodDB, projectPositionDB, projectGoalDB, projectTagDB, projectFieldDB, memberDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { projectId } = req.params;

  if (!projectId) {
    return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
  }

  let client;

  try {
    client = await db.connect(req);

    // 프로젝트 is_closed = true로 변경
    await projectDB.isClosedProject(client, projectId);

    const period = await projectPeriodDB.getPeriodByProjectId(client, projectId);

    const position = await projectPositionDB.getPositionByProjectId(client, projectId);

    const goal = await projectGoalDB.getGoalByProjectId(client, projectId);

    const tag = await projectTagDB.getTagByProjectId(client, projectId);

    const field = await projectFieldDB.getFieldByProjectId(client, projectId);

    const member = await memberDB.getMemberByProjectId(client, projectId);

    const data = _.merge(period, { position }, { goal }, { tag }, { field }, { member });

    res.status(statusCode.OK).send(
      util.success(statusCode.OK, responseMessage.DELETE_PROJECT_SUCCESS, {
        project: data,
      }),
    );
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} [CONTENT] projectId: ${projectId} / ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
