const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const getTypeByTypeId = async (client, typeId) => {
  const { rows } = await client.query(
    `
      SELECT *
      FROM "type" t
      WHERE t.id = $1
    `,
    [typeId],
  );

  /**
  타입이 존재하는 경우 타입 객체 저장
  타입이 존재하지 않는 경우 null 저장
  */
  const type = rows[0] ? rows[0] : null;

  return convertSnakeToCamel.keysToCamel(type);
};

// type 테이블 모든 정보 가져오기
const getType = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "type" t
    ORDER BY id ASC
    `,
  );
  /**
  협업 성향 정보가 존재하는 경우 협업 성향 정보 객체의 배열 저장
  협업 성향 정보가 존재하지 않는 경우 [] 저장
  */
  const type = rows ? rows : [];
  return convertSnakeToCamel.keysToCamel(type);
};

module.exports = { getTypeByTypeId, getType };
