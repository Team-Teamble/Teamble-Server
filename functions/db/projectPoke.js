const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// 팀 지원하기
const addProjectPoke = async (client, projectId, userId) => {
  const { rows } = await client.query(
    `
    INSERT INTO project_poke
    (project_id, user_id)
    VALUES($1, $2)
    RETURNING *
    `,
    [projectId, userId],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

// projectId로 memberId 배열 추출
const getPokingUserByProjectId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT ARRAY_AGG(user_id) AS member_id
    FROM (
      SELECT pp.user_id
      FROM "project_poke" pp
      WHERE pp.project_id = $1 
      AND pp.is_deleted = false
      ORDER BY pp.id DESC
    ) m
    `,
    [projectId],
  );
  const memberId = rows[0].member_id ? rows[0].member_id : [];

  return convertSnakeToCamel.keysToCamel(memberId);
};

const deletePokingUserByUserId = async (client, userId) => {
  const { rows } = await client.query(
    `
    UPDATE "project_poke" pp
    SET is_deleted = true
    WHERE user_id = $1
    RETURNING *
    `,
    [userId],
  );

  return convertSnakeToCamel.keysToCamel(rows[0]);
};

module.exports = { addProjectPoke, getPokingUserByProjectId, deletePokingUserByUserId };
