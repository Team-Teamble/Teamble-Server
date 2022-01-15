const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const addTagProject = async (client, projectId, tagId) => {
  await tagId.map((id) => {
    return client.query(
      `
      INSERT INTO project_tag
      (project_id, tag_id)
      VALUES($1, $2)
      RETURNING *
      `,
      [projectId, id],
    );
  });
};

module.exports = { addTagProject };
