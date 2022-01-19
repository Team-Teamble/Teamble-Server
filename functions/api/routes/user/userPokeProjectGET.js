const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectDB, projectPokeDB } = require('../../../db');

module.exports = async (req, res) => {
  const { userId } = req.params;

  if (!userId) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));

  let client;

  try {
    client = await db.connect(req);

    // 1-1. userId로 user가 진행중인 projectId 불러오기
    const projectId = await projectDB.getProjectIdByUserId(client, userId);
    if (!projectId) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NO_USER));

    // 1-2. 유저의 is_checked = true로 변경
    let user = await userDB.updatePokedUser(client, userId);

    const memberId = await projectPokeDB.getPokingUserByProjectId(client, projectId);

    const memberCard = await userDB.getMemberByMemberId(client, memberId);

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.READ_VOLUNTEER_TEAM_SUCCESS, { user, memberCard }));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
