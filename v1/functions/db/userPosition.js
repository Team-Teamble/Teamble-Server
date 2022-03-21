const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// 유저의 포지션 id를 업데이트
const updateUserPosition = async (client, userId, insertingPositionId, deletingPositionId) => {
  // 삭제해야할 positionId에 해당하는 row를 삭제
  await deletingPositionId.map((id) => {
    client.query(
      `
        DELETE FROM "user_position"
        WHERE user_id = $1
          AND position_id = $2
        RETURNING *;
      `,
      [userId, id],
    );
  });

  // 추가해야할 positionId에 해당하는 row를 추가
  await insertingPositionId.map((id) => {
    client.query(
      `
        INSERT INTO "user_position"
        (user_id, position_id)
        VALUES ($1, $2)
        RETURNING *;
      `,
      [userId, id],
    );
  });
};

module.exports = { updateUserPosition };
