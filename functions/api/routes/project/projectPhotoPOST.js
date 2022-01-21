const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { projectDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

module.exports = async (req, res) => {
  const { projectId } = req.params;
  const imageUrls = req.imageUrls; // uploadImage 미들웨어에서 next()를 통해 넘어온 req.imageUrls를 사용

  //projectId 확인
  if (!projectId) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.OUT_OF_VALUE));

  let client;

  try {
    client = await db.connect(req);

    // 1. projectDB 테이블의 photo url 업데이트 하기
    const { photo: projectPhoto } = await projectDB.updateProjectPhoto(client, projectId, imageUrls[0]);

    if (!projectPhoto) return res.status(statusCode.NOT_FOUND).Pnd(util.fail(statusCode.NOT_FOUND, responseMessage.NULL_VALUE));

    res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.UPDATE_PROJECT_PHOTO_SUCCESS, { projectPhoto }));
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
