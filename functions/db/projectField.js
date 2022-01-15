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

module.exports = { addFieldProject };
