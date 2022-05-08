/**
 *  @route POST /user
 *  @desc Create User
 *  @access Public
 */
import { Request, Response } from 'express';
import { UserCreateDto } from '../interfaces/user/UserCreateDto';
import UserService from '../services/UserService';
import statusCode from '../constants/statusCode';
import responseMessage from '../constants/responseMessage';
import util from '../lib/util';

const createUser = async (req: Request, res: Response) => {
  const userCreateDto: UserCreateDto = req.body;

  try {
    const data = await UserService.createUser(userCreateDto);
    res.status(statusCode.CREATED).send(util.success(statusCode.CREATED, responseMessage.CREATE_USER, data));
  } catch (error) {
    console.log(error);
    // 서버 내부에서 오류 발생
    res.status(statusCode.INTERNAL_SERVER_ERROR).send(util.fail(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
  }
};

export default {
  createUser,
};
