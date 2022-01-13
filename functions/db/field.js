const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// field 테이블 모든 정보 가져오기
const getField = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "field" f
    ORDER BY id ASC
    `
  );
  /**
  분야 정보가 존재하는 경우 기간 객체 저장
  분야 정보가 존재하지 않는 경우 [] 저장
  */
  const field = rows ? rows : [];
  return convertSnakeToCamel.keysToCamel(field);
};
module.exports = { getField };
