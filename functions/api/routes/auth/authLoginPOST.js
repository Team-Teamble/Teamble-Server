const _ = require('lodash');
const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const { signInWithEmailAndPassword } = require('firebase/auth');
const db = require('../../../db/db');
const { userDB, projectDB, typeDB, tagDB, positionDB, fieldDB } = require('../../../db');
const slackAPI = require('../../../middlewares/slackAPI');

const { firebaseAuth } = require('../../../config/firebaseClient');

const jwtHandlers = require('../../../lib/jwtHandlers');

module.exports = async (req, res) => {
  const { email, password } = req.body;

  // email or password 빈칸인 경우
  if (!email || !password) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.BLANK_BOX));

  let client;

  try {
    client = await db.connect(req);

    // Firebase Authentication을 통해 유저 인증
    const userFirebase = await signInWithEmailAndPassword(firebaseAuth, email, password)
      .then((user) => user)
      .catch((e) => {
        console.log(e);
        return { err: true, error: e };
      });

    if (userFirebase.err) {
      // 제공된 식별자에 해당하는 기존 사용자 레코드가 없다.
      if (userFirebase.error.code === 'auth/user-not-found') {
        return res.status(statusCode.BAD_REQUEST).json(util.fail(statusCode.BAD_REQUEST, responseMessage.BLANK_BOX));

        //email 사용자 속성에 제공된 값이 잘못되었다.
      } else if (userFirebase.error.code === 'auth/invalid-email') {
        return res.status(statusCode.BAD_REQUEST).json(util.fail(statusCode.BAD_REQUEST, responseMessage.BLANK_BOX));

        // 해당 식별자의 비밀번호가 맞지 않는다.
      } else if (userFirebase.error.code === 'auth/wrong-password') {
        return res.status(statusCode.BAD_REQUEST).json(util.fail(statusCode.BAD_REQUEST, responseMessage.MISS_MATCH_PW));
      } else {
        return res.status(statusCode.BAD_REQUEST).json(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
      }
    }

    // const idFirebase = userFirebase.user.uid; 랑 같음
    const {
      user: { uid: idFirebase },
    } = userFirebase;

    // 1-1. 유저 정보 가져오기
    let user = await userDB.getUserByIdFirebase(client, idFirebase);

    const { accesstoken } = jwtHandlers.sign(user);

    if (!user) return res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NO_USER));

    // 1-2. 프로젝트 id 가져오기
    const projectId = await projectDB.getProjectIdByUserId(client, user.id);

    // 2-1. 유저의 타입 id 가져오기 (intger | null)
    const typeId = await userDB.getTypeIdByUserId(client, user.id);

    // 2-2. 해당 typeId의 데이터 가져오기
    const type = await typeDB.getTypeByTypeId(client, typeId);

    // 2-3. 해당 타입의 태그들 가져오기
    const tag = await tagDB.getTagByTypeId(client, typeId);

    // 3-1. 유저 포지션 id 배열 가져오가
    const positionId = await positionDB.getPositionIdByUserId(client, user.id);

    // 3-2. 해당 유저의 포지션들 가져오기
    const position = await positionDB.getPositionByPositionId(client, positionId);

    // 4-1. 유저 필드 id 배열 가져오가
    const fieldId = await fieldDB.getFieldIdByUserId(client, user.id);

    // 4-2. 해당 유저의 필드들 가져오기
    const field = await fieldDB.getFieldByFieldId(client, fieldId);

    user = _.merge(user, { projectId, type, tag, position, field });

    res.status(statusCode.OK).send(
      util.success(statusCode.OK, responseMessage.LOGIN_SUCCESS, {
        user,
        accesstoken,
      }),
    );
  } catch (error) {
    functions.logger.error(`[EMAIL LOGIN ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`, `[CONTENT] email:${email} ${error}`);

    const slackMessage = `[ERROR] [${req.method.toUpperCase()}] ${req.originalUrl} ${req.user ? `uid:${req.user.userId}` : 'req.user 없음'} ${JSON.stringify(error)}`;
    slackAPI.sendMessageToSlack(slackMessage, slackAPI.DEV_WEB_HOOK_ERROR_MONITORING);

    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  } finally {
    client.release();
  }
};
