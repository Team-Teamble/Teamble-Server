const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// 해당 유저의 포지션 id 조회
const getPositionIdByUserId = async (client, userId) => {
  const { rows } = await client.query(
    `
    SELECT up.position_id
    FROM "user_position" up
    WHERE up.user_id = $1;
    `,
    [userId],
  );

  /** 
  포지션 id가 존재하는 경우 포지션 id의 배열 저장
  포지션 id가 존재하지 않는 경우 null 저장
  */
  const positionId = rows[0] ? rows.map((row) => row.position_id) : null;

  return convertSnakeToCamel.keysToCamel(positionId);
};

// 포지션 정보 가져오기
const getPositionByPositionId = async (client, positionId) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "position" p 
    WHERE p.id = ANY($1)
    ORDER BY id ASC;
    `,
    [positionId],
  );

  // 해당하는 포지션이 없는 경우 빈 배열 반환
  return convertSnakeToCamel.keysToCamel(rows);
};

// position 테이블 모든 정보 가져오기
const getPosition = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "position" p
    ORDER BY id ASC;
    `,
  );

  /**
  포지션 정보가 존재하는 경우 포지션 객체의 배열 저장
  포지션 정보가 존재하지 않는 경우 [] 저장
  */
  const position = rows ? rows : [];

  return convertSnakeToCamel.keysToCamel(position);
};

// position 테이블의 '전체' row를 제외한 모든 정보 가져오기
const getPositionWithoutAll = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "position" p
    WHERE p.id > 1
    ORDER BY id ASC;
    `,
  );

  /**
  포지션 정보가 존재하는 경우 포지션 객체의 배열 저장
  포지션 정보가 존재하지 않는 경우 [] 저장
  */
  const positionWithoutAll = rows ? rows : [];

  return convertSnakeToCamel.keysToCamel(positionWithoutAll);
};

module.exports = { getPositionIdByUserId, getPositionByPositionId, getPosition, getPositionWithoutAll };
