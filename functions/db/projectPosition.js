const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const addPositionProject = async (client, projectId, position) => {
  await Promise.all(
    position.map((positionArray) => {
      const [positionId, positionNumId] = positionArray;
      return client.query(
        `
        INSERT INTO project_position
        (project_id, position_id, position_num_id)
        VALUES($1, $2, $3)
        RETURNING *
        `,
        [projectId, positionId, positionNumId],
      );
    }),
  );
};

const getPositionByPositionId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT p.id, p.name
    FROM "project_position" pp
    INNER JOIN "position" p
      ON pp.position_id = p.id
    WHERE project_id = $1
    ORDER BY p.id ASC
    `,
    [projectId],
  );
  /**
  포지션 정보가 존재하는 경우 기간 객체 저장
  포지션 정보가 존재하지 않는 경우 [] 저장
  */
  const position = rows ? rows : [];
  return convertSnakeToCamel.keysToCamel(position);
};

const getPositionNumByPositionId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT pn.id, pn.name
    FROM "project_position" pp
    INNER JOIN "position_num" pn
      ON pp.position_num_id = pn.id
    WHERE project_id = $1
    ORDER BY pn.id ASC
    `,
    [projectId],
  );
  /**
  포지션 정보가 존재하는 경우 기간 객체 저장
  포지션 정보가 존재하지 않는 경우 [] 저장
  */
  const position = rows ? rows : [];
  return convertSnakeToCamel.keysToCamel(position);
};

const getPositionByProjectId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT pp.position_id AS id ,p.name, json_build_object('id', pp.position_num_id, 'name', pn.name) AS position_Num
    FROM "project" pj
    INNER JOIN "project_position" pp
      ON pj.id = pp.project_id
    INNER JOIN "position" p
      ON pp.position_id = p.id
    INNER JOIN "position_num" pn
      ON pp.position_num_id = pn.id
    WHERE pj.id = $1
    `,
    [projectId],
  );
  return convertSnakeToCamel.keysToCamel(rows);
};

module.exports = { addPositionProject, getPositionByPositionId, getPositionNumByPositionId, getPositionByProjectId };
