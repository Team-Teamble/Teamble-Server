import { nanoid } from 'nanoid';
import { UserCreateDto } from '../interfaces/user/UserCreateDto';
import dotenv from 'dotenv';
import { getConnection } from '../config/db';

dotenv.config();

const createUser = async (user: UserCreateDto): Promise<any> => {
  try {
    const id = nanoid();
    getConnection((conn: any) => {
      conn.query('INSERT INTO `user` (id, email, name, phone) VALUES (?, ?, ?, ?);', [id, user.email, user.name, user.phone]);
      // any 안쓰는 방법 찾기
      // conn.query('SELECT * FROM `user` WHERE id =?', id);
      conn.release();
    });
  } catch (error) {
    console.log(error);
    throw error;
  }
};

export default { createUser };
