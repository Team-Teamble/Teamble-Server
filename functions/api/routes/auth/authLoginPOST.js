const functions = require('firebase-functions');
const util = require('../../../lib/util');
const statusCode = require('../../../constants/statusCode');
const responseMessage = require('../../../constants/responseMessage');
const { signInWithEmailAndPassword } = require('firebase/auth');
const db = require('../../../db/db');
const { userDB, typeDB, projectDB } = require('../../../db');

const { firebaseAuth } = require('../../../config/firebaseClient');

const jwtHandlers = require('../../../lib/jwtHandlers');
const { user } = require('firebase-functions/v1/auth');

module.exports = async (req, res) => {
  const { email, password } = req.body;

  // email or password 빈칸인 경우
  if (!email || !password)
    return res
      .status(statusCode.BAD_REQUEST)
      .send(util.fail(statusCode.BAD_REQUEST, responseMessage.BLANK_BOX));

  let client;

  try {
    client = await db.connect(req);

    // Firebase Authentication을 통해 유저 인증
    const userFirebase = await signInWithEmailAndPassword(
      firebaseAuth,
      email,
      password
    )
      .then((user) => user)
      .catch((e) => {
        console.log(e);
        return { err: true, error: e };
      });

    if (userFirebase.err) {
      // 제공된 식별자에 해당하는 기존 사용자 레코드가 없다.
      if (userFirebase.error.code === 'auth/user-not-found') {
        return res
          .status(statusCode.BAD_REQUEST)
          .json(util.fail(statusCode.BAD_REQUEST, responseMessage.BLANK_BOX));

        // email 사용자 속성에 제공된 값이 잘못되었다.
        //   } else if (userFirebase.error.code === "auth/invalid-email") {
        //     return res
        //       .status(statusCode.BAD_REQUEST)
        //       .json(util.fail(statusCode.BAD_REQUEST, responseMessage.BLANK_BOX));

        // 해당 식별자의 비밀번호가 맞지 않는다.
      } else if (userFirebase.error.code === 'auth/wrong-password') {
        return res
          .status(statusCode.BAD_REQUEST)
          .json(
            util.fail(statusCode.BAD_REQUEST, responseMessage.MISS_MATCH_PW)
          );
      } else {
        return res
          .status(statusCode.BAD_REQUEST)
          .json(
            util.fail(
              statusCode.INTERNAL_SERVER_ERROR,
              responseMessage.INTERNAL_SERVER_ERROR
            )
          );
      }
    }

    // const idFirebase = userFirebase.user.uid; 랑 같음
    const {
      user: { uid: idFirebase },
    } = userFirebase;

    const user = await userDB.getUserByIdFirebase(client, idFirebase);

    const { accesstoken } = jwtHandlers.sign(user);

    if (!user)
      return res
        .status(statusCode.BAD_REQUEST)
        .send(util.fail(statusCode.BAD_REQUEST, responseMessage.NO_USER));

    const userId = await userDB.getUserIdByIdFirebase(client, idFirebase);

    const projectId = await projectDB.getProjectIdByUserId(client, userId.id);
    console.log(projectId);

    const typeId = await userDB.getTypeIdByUserId(client, userId.id);

    const type = await typeDB.getTypeByTypeId(client, typeId.typeId);

    const data = {
      user: {
        ...user,
        projectId,
        type,
      },
    };

    res.status(statusCode.OK).send(
      util.success(statusCode.OK, responseMessage.LOGIN_SUCCESS, {
        data,
        accesstoken,
      })
    );
  } catch (error) {
    functions.logger.error(
      `[EMAIL LOGIN ERROR] [${req.method.toUpperCase()}] ${req.originalUrl}`,
      `[CONTENT] email:${email} ${error}`
    );

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
