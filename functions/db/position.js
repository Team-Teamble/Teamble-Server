const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// position 테이블 모든 정보 가져오기
const getPosition = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "position" p
    ORDER BY id ASC
    `
  );
  /**
  포지션 정보가 존재하는 경우 기간 객체 저장
  포지션 정보가 존재하지 않는 경우 [] 저장
  */
  const position = rows ? rows : [];
  return convertSnakeToCamel.keysToCamel(position);
};
module.exports = { getPosition };
