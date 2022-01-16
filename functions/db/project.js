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

module.exports = { getProjectIdByUserId, addProject, isClosedProject, getProjectByProjectId };
