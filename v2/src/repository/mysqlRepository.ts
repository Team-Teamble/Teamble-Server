import dotenv from 'dotenv';
import { nanoid } from 'nanoid';
import { Repository2 } from '.';
import { Project } from '../entity/project';
import { User } from '../entity/user';
import mysql from 'mysql2/promise';

dotenv.config();

export class MysqlRepository implements Repository2 {
  async createUser(user: Pick<User, 'email' | 'name' | 'phone'>, client: mysql.PoolConnection): Promise<User> {
    const id = nanoid();

    await client.query('INSERT INTO `user` (id, email, name, phone) VALUES (?, ?, ?, ?);', [id, user.email, user.name, user.phone]);
    const [row]: any = await client.query('SELECT * FROM `user` WHERE id=?', [id]);

    return row[0];
  }

  async updateUserPhoto(userId: string, location: string, client: mysql.PoolConnection): Promise<User> {
    await client.query('UPDATE `user` SET photo=? WHERE id=?;', [location, userId]);
    const [row]: any = await client.query('SELECT * FROM `user` WHERE id=?;', [userId]);

    return row[0];
  }
}
