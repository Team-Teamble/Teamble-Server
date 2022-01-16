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

module.exports = { addUser, getUserByIdFirebase, getUserByUserId, getUserIdByIdFirebase, getTypeIdByUserId, updateUserProfile, updateUserProfilePhoto, getUserByEmail };
