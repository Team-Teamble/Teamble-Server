const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// positionNum 테이블 모든 정보 가져오기
const getPositionNum = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "position_num" p
    ORDER BY id ASC
    `,
  );
  /**
  포지션 수 정보가 존재하는 경우 포지션 수 객체의 배열 저장
  포지션 수 정보가 존재하지 않는 경우 [] 저장
  */
  const positionNum = rows ? rows : [];
  return convertSnakeToCamel.keysToCamel(positionNum);
};

module.exports = { getPositionNum };
