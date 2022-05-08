// import { Response, Router } from 'express';
// import { User } from '../interfaces/user/User';
// import { Repository } from '../legacy/repository';
// import { asyncRoute } from '../lib/endpoint';
// import util from '../lib/util';
// import statusCode from '../constants/statusCode';
// import responseMessage from '../constants/responseMessage';

// function setEndpoint(router: Router, db: Repository) {
//   router.post(
//     '/user',
//     asyncRoute(async (req, res) => {
//       if (userFormatGuard(req.body, res)) {
//         const newUser = await db.createUser(req.body);

//         res.status(statusCode.CREATED).send(util.success(statusCode.CREATED, responseMessage.CREATE_USER, newUser));
//       }
//     }),
//   );

//   router.get(
//     '/user',
//     asyncRoute(async (req, res) => {
//       const users = await db.getUsers();

//       res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.GET_MEMBER_SEARCH_SUCCESS, users));
//     }),
//   );

//   router.get(
//     '/user/:userId',
//     asyncRoute(async (req, res) => {
//       const userId = req.params.userId;
//       const user = await db.getUserById(userId);

//       if (user === null) {
//         res.status(statusCode.NOT_FOUND).send(util.fail(statusCode.NOT_FOUND, responseMessage.NO_USER));
//         return;
//       }

//       res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.GET_USER_PROFILE_SUCCESS, user));
//     }),
//   );
// }

// function userFormatGuard(obj: unknown, res: Response): obj is Pick<User, 'email' | 'name' | 'phone'> {
//   if (typeof obj !== 'object' || obj === null) {
//     res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.OUT_OF_VALUE));
//     return false;
//   }

//   const toCheck: Array<keyof Pick<User, 'email' | 'name' | 'phone'>> = ['email', 'name', 'phone'];

//   for (const key of toCheck) {
//     if ((obj as User)[key] === undefined) {
//       res.status(statusCode.BAD_REQUEST).send(util.fail(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
//       return false;
//     }
//   }

//   return true;
// }

// export default setEndpoint;
