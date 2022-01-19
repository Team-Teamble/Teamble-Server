const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectPokeDB } = require('../../../db');

module.exports = async (req, res) => {
  const { projectId, pokingUserId } = req.params;

  if (!projectId || !pokingUserId) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));

  let client;

  try {
    client = await db.connect(req);

    // 1. pokingUserId로 project_poke의 해당 user의 is_deleted = true로 업데이트
    await projectPokeDB.deletePokingUserByUserId(client, pokingUserId);

    // 2. projectId로 해당 project에 지원한 userId 배열 반환
    const memberId = await projectPokeDB.getPokingUserByProjectId(client, projectId);

    // 3. memberId 배열로 해당 id를 가진 user정보 반환
    const memberCard = await userDB.getMemberByMemberId(client, memberId);

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.DELETE_VOLUNTEER_TEAM_SUCCESS, { memberCard }));
  } catch (error) {
    functions.logger.error(`[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] ${error}`);
    console.log(error);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
