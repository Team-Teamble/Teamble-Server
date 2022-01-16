const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const addPeriodProject = async (client, projectId, periodId) => {
  const { rows } = await client.query(
    `
    INSERT INTO project_period
    (project_id, period_id)
    VALUES($1, $2)
    RETURNING *
    `,
    [projectId, periodId],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

module.exports = { addPeriodProject };
