const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// 유저의 진행중인 프로젝트 id 가져오기
const getProjectIdByUserId = async (client, userId) => {
  const { rows } = await client.query(
    `
    SELECT id
    FROM "project" p
    WHERE p.user_id = $1
      AND p.is_closed = FALSE;
    `,
    [userId],
  );

  /** 
  프로젝트가 존재하는 경우 프로젝트 id 저장
  프로젝트가 존재하지 않는 경우 null 저장
  */
  const projectId = rows[0] ? rows[0].id : null;

  return convertSnakeToCamel.keysToCamel(projectId);
};

const addProject = async (client, userId, title, intro, startDate, endDate, area, description) => {
  const { rows } = await client.query(
    `
    INSERT INTO project
    (user_id, title, intro, start_date, end_date, area, description)
    VALUES($1, $2, $3, $4, $5, $6, $7)
    RETURNING *
    `,
    [userId, title, intro, startDate, endDate, area, description],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

const isClosedProject = async (client, projectId) => {
  const { rows } = await client.query(
    `
    UPDATE "project" p
    SET is_closed = true, updated_at = now()
    WHERE p.id = $1
      AND p.is_closed = FALSE;
    `,
    [projectId],
  );

  return convertSnakeToCamel.keysToCamel(rows[0]);
};

// 프로젝트 id로 프로젝트 가져오기 (is_closed 허용)
const getProjectByProjectId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at,
    is_closed, is_deleted
    FROM "project" p
    WHERE p.id = $1;
    `,
    [projectId],
  );

  /**
  프로젝트가 존재하는 경우 프로젝트 저장
  프로젝트가 존재하지 않는 경우 null 저장
  */
  const project = rows[0] ? rows[0] : null;

  return convertSnakeToCamel.keysToCamel(project);
};

const updateProjectPhoto = async (client, projectId, imageUrl) => {
  const { rows } = await client.query(
    `
    UPDATE "project" 
    SET photo = $1, updated_at = now()
    WHERE id = $2
    RETURNING photo
    `,
    [imageUrl, projectId],
  );

  return convertSnakeToCamel.keysToCamel(rows[0]);
};

const getTopProject = async (client) => {
  const { rows } = await client.query(
    `
    SELECT a.id, a.title, a.intro, a.photo, a.start_date, a.end_date, a.is_closed, JSON_AGG(a.position) AS position,
       JSON_BUILD_OBJECT('id', a.user_id, 'name', a.user_name, 'photo', a.user_photo) AS user
    FROM(
        SELECT t.id, t.title, t.intro, t.photo, t.start_date, t.end_date, t.is_closed,
          JSON_BUILD_OBJECT('id', pp.position_id, 'name', p.name, 'num', pn.name) AS position,
              u.id AS user_id, u.name AS user_name, u.photo AS user_photo
        FROM (
        SELECT p.*
        FROM "project" p
        WHERE p.is_closed = FALSE
        AND p.is_deleted = FALSE
        ORDER BY p.created_at DESC
        ) t
    INNER JOIN "project_position" pp
    ON pp.project_id = t.id
    INNER JOIN "position" p
    ON p.id = pp.position_id
    INNER JOIN "position_num" pn
    ON pn.id = pp.position_num_id
    INNER JOIN "user" u
    ON u.id = t.user_id
    GROUP BY (t.id, t.title, t.intro, t.photo, t.start_date, t.end_date, t.is_closed, p.name, pp.position_id, p.name, pn.name, u.id)
    ) a
    GROUP BY a.id, a.title, a.intro, a.photo, a.start_date, a.end_date, a.is_closed, a.user_id, a.user_name, a.user_photo
    LIMIT 8;
    `,
  );

  return convertSnakeToCamel.keysToCamel(rows);
};

module.exports = { getProjectIdByUserId, addProject, isClosedProject, getProjectByProjectId, updateProjectPhoto, getTopProject };
