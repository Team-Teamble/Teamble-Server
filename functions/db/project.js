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
        SELECT t.id, t.title, t.intro, t.photo, t.start_date, t.end_date, t.is_closed, t.created_at,
          JSON_BUILD_OBJECT('id', pp.position_id, 'name', p.name, 'num', pn.name) AS position,
              u.id AS user_id, u.name AS user_name, u.photo AS user_photo
        FROM (
        SELECT p.*
        FROM "project" p
        WHERE p.is_closed = FALSE
        AND p.is_deleted = FALSE
        ) t
    INNER JOIN "project_position" pp
    ON pp.project_id = t.id
    INNER JOIN "position" p
    ON p.id = pp.position_id
    INNER JOIN "position_num" pn
    ON pn.id = pp.position_num_id
    INNER JOIN "user" u
    ON u.id = t.user_id
    GROUP BY (t.id, t.title, t.intro, t.photo, t.start_date, t.end_date, t.is_closed,  t.created_at,
              p.name, pp.position_id, p.name, pn.name, u.id)
    ) a
    GROUP BY a.id, a.title, a.intro, a.photo, a.start_date, a.end_date, a.is_closed, a.user_id, a.user_name, a.user_photo, a.created_at
    ORDER BY a.created_at DESC
    LIMIT 8;
    `,
  );

  return convertSnakeToCamel.keysToCamel(rows);
};

const getProjectByFilter = async (client, periodId, positionId, goalId, tagId, fieldId, count, page) => {
  let periodProjectId; // 기간 필터에 해당하는 프로젝트 id
  let positionProjectId; // 포지션 필터에 해당하는 프로젝트 id
  let goalProjectId; // 목표 필터에 해당하는 프로젝트 id
  let tagProjectId; //  필터에 해당하는 프로젝트 id
  let fieldProjectId; // 분야 필터에 해당하는 프로젝트 id

  console.log('positionId3: ', positionId);
  if (periodId === 1) {
    // 기간 - 전체
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT pp.project_id) AS project_id
      FROM "project_period" pp;
      `,
    );
    periodProjectId = rows[0].project_id ? rows[0].project_id : [];
  } else {
    // 기간 - 나머지
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT pp.project_id) AS project_id
      FROM "project_period" pp
      WHERE pp.period_id = $1
      `,
      [periodId],
    );
    periodProjectId = rows[0].project_id ? rows[0].project_id : [];
  }
  console.log('periodProject: ', periodProjectId);
  if (positionId === 1) {
    // 헙업 포지션 - 전체
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT  pp.project_id) AS project_id
      FROM (
        SELECT pp.*
        FROM "project_position" pp
        WHERE pp.position_num_id > 1
      ) pp
      `,
    );
    positionProjectId = rows[0].project_id ? rows[0].project_id : [];
  } else {
    // 협업 포지션 - 나머지
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT pp.project_id) AS project_id 
      FROM (
        SELECT PP.*
        FROM "project_position" pp
        WHERE pp.position_num_id > 1
      ) pp
      WHERE pp.position_id = $1
      `,
      [positionId],
    );
    positionProjectId = rows[0].project_id ? rows[0].project_id : [];
  }
  console.log('positionProject: ', positionProjectId);
  if (goalId === 1) {
    // 목표 - 전체
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT  pg.project_id) AS project_id
      FROM "project_goal" pg
      `,
    );
    goalProjectId = rows[0].project_id ? rows[0].project_id : [];
  } else {
    // 목표 - 나머지
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT pg.project_id) AS project_id 
      FROM "project_goal" pg
      WHERE pg.goal_id = $1
      `,
      [goalId],
    );
    goalProjectId = rows[0].project_id ? rows[0].project_id : [];
  }

  console.log('goalProject: ', goalProjectId);

  if (tagId.includes(1)) {
    // 협업 성향 - 전체
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT  pt.project_id) AS project_id
      FROM "project_tag" pt
      `,
    );
    tagProjectId = rows[0].project_id ? rows[0].project_id : [];
  } else {
    // 협업 성향 - 나머지
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT pt.project_id) AS project_id 
      FROM "project_tag" pt
      WHERE pt.tag_id = ANY($1)
      `,
      [tagId],
    );
    tagProjectId = rows[0].project_id ? rows[0].project_id : [];
  }
  console.log('tagProject: ', tagProjectId);

  if (fieldId.includes(1)) {
    // 분야 성향 - 전체
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT  pf.project_id) AS project_id
      FROM "project_field" pf
      `,
    );
    fieldProjectId = rows[0].project_id ? rows[0].project_id : [];
  } else {
    // 분야 성향 - 나머지
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT pf.project_id) AS project_id 
      FROM "project_field" pf
      WHERE pf.field_id = ANY($1)
      `,
      [fieldId],
    );
    fieldProjectId = rows[0].project_id ? rows[0].project_id : [];
  }

  console.log('fieldProject: ', fieldProjectId);

  // 최종적으로 반환된 projectId를 교집합으로 구하기
  const projectId = _.intersection(periodProjectId, positionProjectId, goalProjectId, tagProjectId, fieldProjectId);

  console.log('projectId: ', projectId);

  const limit = count; // 한 번에 받을 프로젝트 개수
  let offset = (page - 1) * count; // 스팁할 row 개수

  // 최종 projectId 배열과 limit, offset을 사용하여 필터에 해당하는 프로젝트 정보 배열 구하기
  const { rows } = await client.query(
    `
    SELECT a.id, a.title, a.intro, a.photo, a.start_date, a.end_date, a.is_closed, JSON_AGG(a.position) AS position,
    JSON_BUILD_OBJECT('id', a.user_id, 'name', a.user_name, 'photo', a.user_photo) AS user
    FROM(
      SELECT t.id, t.title, t.intro, t.photo, t.start_date, t.end_date, t.is_closed, t.created_at, JSON_BUILD_OBJECT('id', pp.position_id, 'name', p.name, 'num', pn.name) AS position, u.id AS user_id, u.name AS user_name, u.photo AS user_photo
    FROM(
      SELECT pj.*
      FROM "project" pj
      WHERE pj.id = ANY($1)
      AND pj.is_deleted = FALSE
      LIMIT $2
      OFFSET $3
    ) t
    INNER JOIN "project_position" pp
    ON pp.project_id = t.id
    INNER JOIN "position" p
    ON pp.position_id = p.id
    INNER JOIN "position_num" pn
    ON pn.id = pp.position_num_id
    INNER JOIN "user" u
    ON u.id = t.user_id
    GROUP BY (t.id, t.title, t.intro, t.photo, t.start_date, t.end_date, t.is_closed, t.created_at, p.name, pp.position_id, p.name, pn.name, u.id)
    ) a
    GROUP BY a.id, a.title, a.intro, a.photo, a.start_date, a.end_date, a.is_closed, a.created_at, a.user_id, a.user_name, a.user_photo
    ORDER BY a.created_at DESC
  `,
    [projectId, limit, offset],
  );
  return convertSnakeToCamel.keysToCamel(rows);
};
module.exports = { getProjectIdByUserId, addProject, isClosedProject, getProjectByProjectId, updateProjectPhoto, getTopProject, getProjectByFilter };
