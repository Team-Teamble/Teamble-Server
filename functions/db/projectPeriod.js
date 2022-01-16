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

const getPeriodByProjectId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT pj.id, pj.title, pj.intro, pj.photo, pj.start_date, pj.end_date, pj.area, pj.description, pj.created_at, pj.updated_at, pj.is_closed, pj.is_deleted, json_build_object('id', pp.period_id, 'name', p.name) AS period
    FROM "project" pj
    INNER JOIN "project_period" pp
      ON pj.id = pp.project_id
    INNER JOIN "period" p
      ON pp.period_id = p.id
    WHERE pj.id = $1
    `,
    [projectId],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

module.exports = { addPeriodProject, getPeriodByProjectId };
