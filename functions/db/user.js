const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// DB에 유저 생성하기
const addUser = async (client, email, name, idFirebase) => {
  let { rows } = await client.query(
    `
    INSERT INTO "user"
    (email, name, id_firebase)
    VALUES
    ($1, $2, $3)
    RETURNING id, id_firebase, name, email, photo, is_checked, created_at, updated_at, is_deleted
    `,
    [email, name, idFirebase],
  );

  return convertSnakeToCamel.keysToCamel(rows[0]);
};

const getUserByIdFirebase = async (client, idFirebase) => {
  const { rows } = await client.query(
    `
      SELECT id, id_firebase, name, email, phone, photo, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted
      FROM "user" u 
      WHERE u.id_firebase = $1 AND u.is_deleted = false 
    `,
    [idFirebase],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

// type_id를 제외한 유저 정보 조회
const getUserByUserId = async (client, userId) => {
  const { rows } = await client.query(
    `
    SELECT id, id_firebase, name, email, phone, photo, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted
    FROM "user" u
    WHERE u.id = $1
    `,
    [userId],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

// email로 id, 이름, 사진을 포함한 유저 정보 조회
const getUserByEmail = async (client, email) => {
  const { rows } = await client.query(
    `
    SELECT id, name, photo
    FROM "user" u
    WHERE u.email = $1
    `,
    [email],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

const getUserIdByIdFirebase = async (client, idFirebase) => {
  const { rows } = await client.query(
    `
    SELECT id
    FROM "user" u
    WHERE u.id_firebase = $1 AND u.is_deleted = false
    `,
    [idFirebase],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

// 해당 유저의 타입 id 조회
const getTypeIdByUserId = async (client, userId) => {
  const { rows } = await client.query(
    `
    SELECT type_id
    FROM "user" u
    WHERE u.id = $1
    `,
    [userId],
  );

  /** 
  타입 id가 존재하는 경우 타입 id 저장
  타입 id가 존재하지 않는 경우 null 저장
  */
  const typeId = rows[0] ? rows[0].type_id : null;

  return convertSnakeToCamel.keysToCamel(typeId);
};

// 유저 프로필 수정
const updateUserProfile = async (client, userId, phone, university, major, area, intro, typeId, description) => {
  const { rows } = await client.query(
    `
    UPDATE "user" u
    SET phone = $1, university = $2, major = $3, area = $4, intro = $5, type_id = $6, description = $7, updated_at = now()
    WHERE u.id = $8
    RETURNING id, id_firebase, name, email, phone, photo, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted
    `,
    [phone, university, major, area, intro, typeId, description, userId],
  );

  return convertSnakeToCamel.keysToCamel(rows[0]);
};

const updateUserProfilePhoto = async (client, userId, imageUrl) => {
  const { rows } = await client.query(
    `
    UPDATE "user" u
    SET photo = $1, updated_at = now()
    WHERE u.id = $2
    RETURNING photo
    `,
    [imageUrl, userId],
  );

  return convertSnakeToCamel.keysToCamel(rows[0]);
};

// 필터링된 팀원 찾기 뷰 조회
const getMemberByFilter = async (client, positionId, tagId, fieldId, count, page) => {
  let positionUserId; // 협업 포지션 필터에 해당하는 유저 id
  let tagUserId; // 협업 성향 필터에 해당하는 유저 id
  let fieldUserId; // 관심 프로젝트 필터에 해당하는 유저 id

  if (positionId === 1) {
    // 협업 포지션 - 전체
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT up.user_id) AS user_id
      FROM "user_position" up;
      `,
    );
    positionUserId = rows[0].user_id ? rows[0].user_id : [];
  } else {
    // 협업 포지션 - 나머지
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT u.id) AS user_id
      FROM "user" u
      INNER JOIN "user_position" up
          ON up.user_id = u.id
      WHERE up.position_id = $1;
      `,
      [positionId],
    );
    positionUserId = rows[0].user_id ? rows[0].user_id : [];
  }

  if (tagId.includes(1)) {
    // 협업 성향 - 전체
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (u.id) AS user_id
      FROM "user" u
      WHERE u.type_id IS NOT NULL;
      `,
    );
    tagUserId = rows[0].user_id ? rows[0].user_id : [];
  } else {
    // 협업 성향 - 나머지
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT u.id) AS user_id
      FROM "user" u
      INNER JOIN "type_tag" tt
          ON tt.type_id = u.type_id
      WHERE tt.tag_id = ANY($1);
      `,
      [tagId],
    );
    tagUserId = rows[0].user_id ? rows[0].user_id : [];
  }

  if (fieldId.includes(1)) {
    // 관심 프로젝트 - 전체
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT uf.user_id) AS user_id
      FROM "user_field" uf;
      `,
    );
    fieldUserId = rows[0].user_id ? rows[0].user_id : [];
  } else {
    // 관심 프로젝트 - 나머지
    const { rows } = await client.query(
      `
      SELECT ARRAY_AGG (DISTINCT u.id) AS user_id
      FROM "user" u
      INNER JOIN "user_field" uf
          ON uf.user_id = u.id
      WHERE uf.field_id = ANY($1);
      `,
      [fieldId],
    );
    fieldUserId = rows[0].user_id ? rows[0].user_id : [];
  }

  // 최종적으로 반환할 userId를 교집합으로 구하기
  const userId = _.intersection(positionUserId, tagUserId, fieldUserId);

  const limit = count; // 한 번에 받을 팀원 개수
  let offset = (page - 1) * count; // 스킵할 row 개수

  // 최종 userId 배열과 limit, offset을 사용하여 필터에 해당하는 팀원 정보 배열 구하기
  const { rows } = await client.query(
    `
    SELECT m.id, m.name, m.photo,
          ARRAY_AGG (DISTINCT p.name) AS position,
          tp.name AS type,
          ARRAY_AGG (DISTINCT tg.name) AS tag,
          ARRAY_AGG (DISTINCT f.name) AS field
    FROM (
        SELECT u.*
        FROM "user" u
        WHERE u.id = ANY($1)
        AND u.is_deleted = false
        ORDER BY u.created_at DESC
        LIMIT $2
        OFFSET $3
        ) m
    INNER JOIN "user_position" up
    ON up.user_id = m.id
    INNER JOIN "position" p
    ON p.id = up.position_id
    INNER JOIN "type" tp
    ON m.type_id = tp.id
    INNER JOIN "type_tag" tt
    ON tt.type_id = tp.id
    INNER JOIN "tag" tg
    ON tg.id = tt.tag_id
    INNER JOIN "user_field" uf
    ON uf.user_id = m.id
    INNER JOIN "field" f
    ON f.id = uf.field_id
    GROUP BY (m.id, m.name, m.photo, tp.name);
    `,
    [userId, limit, offset],
  );

  return convertSnakeToCamel.keysToCamel(rows);
};

// 프로젝트 id로 해당 유저의 id, name, photo 불러오기
const getUserDataByProjectId = async (client, projectId) => {
  const { rows } = await client.query(
    `
    SELECT u.id, u.name, u.photo
    FROM "project" pj
    INNER JOIN "user" u
      ON pj.user_id = u.id
    WHERE pj.id = $1
    `,
    [projectId],
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

// 콕 찌르기 당한 유저의 알림 확인 여부(is_checked) 업데이트 후 정보 반환하기
const updatePokedUser = async (client, userId) => {
  const { rows } = await client.query(
    `
    UPDATE "user" u
    SET is_checked = true, updated_at = now()
    WHERE u.id = $1
    RETURNING u.id, u.is_checked;
    `,
    [userId],
  );

  return convertSnakeToCamel.keysToCamel(rows[0]);
};

const getPokingUserByMemberId = async (client, memberId) => {
  let { rows } = await client.query(
    `
    SELECT m.id, m.name, m.photo,
          ARRAY_AGG (DISTINCT p.name) AS position,
          tp.name AS type,
          ARRAY_AGG (DISTINCT tg.name) AS tag,
          ARRAY_AGG (DISTINCT f.name) AS field
    FROM (
        SELECT u.id, u.name, u.photo, u.type_id
        FROM "user" u
        WHERE u.id = ANY($1)
        AND u.is_deleted = false
        ) m
    INNER JOIN "user_position" up
    ON up.user_id = m.id
    INNER JOIN "position" p
    ON p.id = up.position_id
    INNER JOIN "type" tp
    ON m.type_id = tp.id
    INNER JOIN "type_tag" tt
    ON tt.type_id = tp.id
    INNER JOIN "tag" tg
    ON tg.id = tt.tag_id
    INNER JOIN "user_field" uf
    ON uf.user_id = m.id
    INNER JOIN "field" f
    ON f.id = uf.field_id
    INNER JOIN "user_poke" upk
    ON upk.user_poking_id = m.id
    GROUP BY (m.id, m.name, m.photo, tp.name, upk.id)
    ORDER BY upk.id DESC;
    `,
    [memberId],
  );

  rows = _.uniqBy(rows, 'id');
  return convertSnakeToCamel.keysToCamel(rows);
};

module.exports = {
  addUser,
  getUserByIdFirebase,
  getUserByUserId,
  getUserIdByIdFirebase,
  getTypeIdByUserId,
  updateUserProfile,
  updateUserProfilePhoto,
  getUserByEmail,
  getMemberByFilter,
  getUserDataByProjectId,
  updatePokedUser,
  getPokingUserByMemberId,
};
