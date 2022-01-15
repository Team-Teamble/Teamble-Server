const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// period 테이블 모든 정보 가져오기
const getPeriod = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "period" p
    ORDER BY id ASC
    `,
  );
  /**
  기간 정보가 존재하는 경우 기간 객체의 배열 저장
  기간 정보가 존재하지 않는 경우 [] 저장
  */
  const period = rows ? rows : [];
  return convertSnakeToCamel.keysToCamel(period);
};
module.exports = { getPeriod };
