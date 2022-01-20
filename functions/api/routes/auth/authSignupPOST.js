const _ = require('lodash');
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const db = require('../../../db/db');
const { userDB, projectDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

const jwtHandlers = require('../../../lib/jwtHandlers');

module.exports = async (req, res) => {
  const { name, email, password } = req.body;

  if (!name || !email || !password) {
    return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.BLANK_BOX));
  }

  let client;

  try {
    client = await db.connect();

    // 1. Firebase Authentication을 통해 유저 생성
    const userFirebase = await admin
      .auth()
      .createUser({ email, password, name })
      .then((user) => user)
      .catch((e) => {
        console.log(e);
        return { err: true, error: e };
      });

    // 에러 검증
    if (userFirebase.err) {
      if (userFirebase.error.code === 'auth/email-already-exists') {
        return res.status(statusCode.BAD_REQUEST).json(util.fail(statusCode.BAD_REQUEST, responseMessage.ALREADY_EMAIL));
      } else if (userFirebase.error.code === 'auth/invalid-email') {
        return res.status(statusCode.BAD_REQUEST).json(util.fail(statusCode.BAD_REQUEST, responseMessage.BLANK_BOX));
      } else if (userFirebase.error.code === 'auth/invalid-password') {
        return res.status(statusCode.NOT_FOUND).json(util.fail(statusCode.BAD_REQUEST, responseMessage.BLANK_BOX));
      } else {
        return res.status(statusCode.INTERNAL_SERVER_ERROR).json(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
      }
    }

    // 2. RDS DB에 유저 생성
    const idFirebase = userFirebase.uid;

    let user = await userDB.addUser(client, email, name, idFirebase);

    // 3. 유저의 projectId 가져오기
    const projectId = await projectDB.getProjectIdByUserId(client, user.id);

    // 4. JWT 발급
    const { accesstoken } = jwtHandlers.sign(user);

    // 5. user 객체에 projectId 를 병합
    user = _.merge(user, { projectId });

    // 6. user + JWT를 response로 전송
    res.status(statusCode.OK).send(
      util.success(statusCode.OK, responseMessage.CREATE_USER, {
        user,
        accesstoken,
      }),
    );
  } catch (error) {
    console.log(error);
    functions.logger.error(`[EMAIL SIGNUP ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] email:${email} ${error}`);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} [CONTENT] email: ${email} ${error}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
