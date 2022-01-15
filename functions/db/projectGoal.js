const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const addGoalProject = async (client, projectId, goalId) => {
  const { rows } = await client.query(
    `
    INSERT INTO project_goal
    (project_id, goal_id)
    VALUES($1, $2)
    RETURNING *
    `,
    [projectId, goalId],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

module.exports = { addGoalProject };
