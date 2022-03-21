const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// 유저의 필드 id를 업데이트
const updateUserField = async (client, userId, insertingFieldId, deletingFieldId) => {
  // 삭제해야할 fieldId에 해당하는 row를 삭제
  await deletingFieldId.map((id) => {
    client.query(
      `
        DELETE FROM "user_field"
        WHERE user_id = $1
          AND field_id = $2
        RETURNING *;
      `,
      [userId, id],
    );
  });

  // 추가해야할 fieldId에 해당하는 row를 추가
  await insertingFieldId.map((id) => {
    client.query(
      `
        INSERT INTO "user_field"
        (user_id, field_id)
        VALUES ($1, $2)
        RETURNING *;
      `,
      [userId, id],
    );
  });
};

module.exports = { updateUserField };
