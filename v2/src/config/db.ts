import mysql from 'mysql2';
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

function getConnection(callback: any) {
  pool.getConnection(function (err, conn) {
    if (!err) {
      callback(conn);
    }
  });
}

export { getConnection };
