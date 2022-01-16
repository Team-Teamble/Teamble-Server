const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const addMember = async (client, projectId, memberId) => {
  await memberId.map((id) => {
    return client.query(
      `
      INSERT INTO member
      (project_id, user_id)
      VALUES($1, $2)
      RETURNING *
      `,
      [projectId, id],
    );
  });
};

// 협업 성향 태그 배열로 객체 가져오기
const getUserByMemberId = async (client, memberId) => {
  const { rows } = await client.query(
    `
    SELECT u.id, u.name, u.photo
    FROM "user" u
    WHERE u.id = ANY($1)
    ORDER BY id ASC;
    `,
    [memberId],
  );

  const member = rows ? rows : [];

  return convertSnakeToCamel.keysToCamel(member);
};

module.exports = { getUserByMemberId, addMember };
