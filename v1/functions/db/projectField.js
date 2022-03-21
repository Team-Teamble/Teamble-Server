const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const addFieldProject = async (client, projectId, fieldId) => {
  await fieldId.map((id) => {
    return client.query(
      `
      INSERT INTO project_field
      (project_id, field_id)
      VALUES($1, $2)
      RETURNING *
      `,
      [projectId, id],
    );
  });
};

const getFieldByProjectId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT pf.field_id AS id, f.name AS name
    FROM "project" pj
    INNER JOIN "project_field" pf
      ON pj.id = pf.project_id
    INNER JOIN "field" f
      ON pf.field_id = f.id
    WHERE pj.id = $1
    `,
    [projectId],
  );
  return convertSnakeToCamel.keysToCamel(rows);
};

module.exports = { addFieldProject, getFieldByProjectId };
