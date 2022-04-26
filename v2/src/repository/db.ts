import { Request } from 'express';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
dotenv.config();

const dbConfig = require('../config/dbConfig');

console.log(`[🔥DB] ${process.env.NODE_ENV}`);

// connection pool 생성
const pool = mysql.createPool({
  ...dbConfig,
  connectionLimit: 10,
  waitForConnections: true, // 사용가능한 pool이 없을 경우 대기
  acquireTimeout: 60 * 1000,
});

const connect = async (req: Request) => {
  const client = pool.getConnection();

  return client;
};

export default connect;
