const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// 해당 유저의 필드 id 조회
const getFieldIdByUserId = async (client, userId) => {
  const { rows } = await client.query(
    `
    SELECT uf.field_id
    FROM "user_field" uf
    WHERE uf.user_id = $1;
    `,
    [userId],
  );

  /** 
  필드 id가 존재하는 경우 필드 id의 배열 저장
  필드 id가 존재하지 않는 경우 null 저장
  */
  const fieldId = rows[0] ? rows.map((row) => row.field_id) : null;

  return convertSnakeToCamel.keysToCamel(fieldId);
};

// 필드 정보 가져오기
const getFieldByFieldId = async (client, fieldId) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "field" f
    WHERE f.id = ANY($1)
    ORDER BY id ASC;
    `,
    [fieldId],
  );

  // 해당하는 필드가 없는 경우 빈 배열 반환
  return convertSnakeToCamel.keysToCamel(rows);
};

// field 테이블 모든 정보 가져오기
const getField = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "field" f
    ORDER BY id ASC;
    `,
  );
  /**
  분야 정보가 존재하는 경우 기간 객체 저장
  분야 정보가 존재하지 않는 경우 [] 저장
  */
  const field = rows ? rows : [];
  return convertSnakeToCamel.keysToCamel(field);
};

// field 테이블의 '전체' row를 제외한 모든 정보 가져오기
const getFieldWithoutAll = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "field" f
    WHERE f.id > 1
    ORDER BY id ASC;
    `,
  );
  /**
  분야 정보가 존재하는 경우 기간 객체 저장
  분야 정보가 존재하지 않는 경우 [] 저장
  */
  const fieldWithoutAll = rows ? rows : [];

  return convertSnakeToCamel.keysToCamel(fieldWithoutAll);
};

module.exports = { getFieldIdByUserId, getFieldByFieldId, getField, getFieldWithoutAll };
