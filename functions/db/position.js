const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// 해당 유저의 포지션 id 조회
const getPositionIdByUserId = async (client, userId) => {
  const { rows } = await client.query(
    `
    SELECT up.position_id
    FROM "user_position" up
    WHERE up.user_id = $1
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

module.exports = { getPositionIdByUserId, getPositionByPositionId };
