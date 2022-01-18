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

module.exports = { addProjectPoke };
