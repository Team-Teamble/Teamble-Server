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

const getTagByProjectId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT pt.tag_id AS id, t.name AS name
    FROM "project" pj
    INNER JOIN "project_tag" pt
      ON pj.id = pt.project_id
    INNER JOIN "tag" t
      ON pt.tag_id = t.id
    WHERE pj.id = $1
    `,
    [projectId],
  );
  return convertSnakeToCamel.keysToCamel(rows);
};

module.exports = { addTagProject, getTagByProjectId };
