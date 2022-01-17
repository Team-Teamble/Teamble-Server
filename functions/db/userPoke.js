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
    WHERE u.id = $1;
    `,
    [userPokedId],
  );
};

const getPokingUserIdByUserId = async (client, userId) => {
  const { rows } = await client.query(
    `
    SELECT ARRAY_AGG(user_poking_id) AS member_id
    FROM(
        SELECT up.user_poking_id
        FROM "user_poke" up
        WHERE up.user_poked_id = $1
        AND is_deleted = false
        ORDER BY up.id DESC
    ) m;
    `,
    [userId],
  );

  const memberId = rows[0].member_id ? rows[0].member_id : [];

  return convertSnakeToCamel.keysToCamel(memberId);
};

module.exports = { pokeUserByUserId, getPokingUserIdByUserId };
