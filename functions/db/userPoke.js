const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// 유저 콕 찌르기
const pokeUserByUserId = async (client, userPokingId, userPokedId) => {
  // 1. 유저 콕 찌르기
  await client.query(
    `
    INSERT INTO "user_poke"
    (user_poking_id, user_poked_id)
    VALUES
    ($1, $2)
    RETURNING user_poking_id, user_poked_id;
    `,
    [userPokingId, userPokedId],
  );

  // 2. 콕 찌르기 당한 유저의 알림 확인 여부(is_checked) false로 바꿔주기
  await client.query(
    `
    UPDATE "user" u
    SET is_checked = false, updated_at = now()
    WHERE u.id = $1
    RETURNING photo;
    `,
    [userPokedId],
  );
};

module.exports = { pokeUserByUserId };
