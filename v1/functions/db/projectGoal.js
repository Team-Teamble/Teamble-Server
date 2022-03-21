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

const getGoalByProjectId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT pg.goal_id AS id, g.name AS name 
    FROM "project" pj
    INNER JOIN "project_goal" pg
      ON pj.id = pg.project_id
    INNER JOIN "goal" g
      ON pg.goal_id = g.id
    WHERE pj.id = $1
    `,
    [projectId],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

module.exports = { addGoalProject, getGoalByProjectId };
