import { Response, Router } from 'express';
import { User } from '../entity/user';
import { Repository2 } from '../repository';
import { asyncRoute } from '../lib/endpoint';
import connect from '../repository/db';
import util from '../lib/util';
import statusCode from '../constants/statusCode';
import responseMessage from '../constants/responseMessage';
import mysql from 'mysql2/promise';
import upload from '../lib/imageUpload';

function setEndpoint(router: Router, db: Repository2) {
  router.post(
    '/user',
    asyncRoute(async (req, res) => {
      let client!: mysql.PoolConnection;
      try {
        client = await connect(req);

        if (userFormatGuard(req.body, res)) {
          const newUser = await db.createUser(req.body, client);
          res.status(statusCode.CREATED).send(util.success(statusCode.CREATED, responseMessage.CREATE_USER, newUser));
        }
      } catch (error) {
        console.log(error);
      } finally {
        client.release();
      }
    }),
  );

  router.put(
    '/user/photo/:userId',
    upload.single('photo'),
    asyncRoute(async (req, res) => {
      const { userId } = req.params;

      if (!userId || !req.file) {
        res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
      }

      const location = (req as any).file.location;

      let client!: mysql.PoolConnection;

      try {
        client = await connect(req);

        const updatedUser = await db.updateUserPhoto(userId, location, client);
        res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.UPDATE_USER_PHOTO_SUCCESS, updatedUser));
      } catch (error) {
        console.log(error);
      } finally {
        client.release();
      }
    }),
  );
}

function userFormatGuard(obj: unknown, res: Response): obj is Pick<User, 'email' | 'name' | 'phone'> {
  if (typeof obj !== 'object' || obj === null) {
    res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.OUT_OF_VALUE));
    return false;
  }

  const toCheck: Array<keyof Pick<User, 'email' | 'name' | 'phone'>> = ['email', 'name', 'phone'];

  for (const key of toCheck) {
    if ((obj as User)[key] === undefined) {
      res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
      return false;
    }
  }

  return true;
}

export default setEndpoint;
