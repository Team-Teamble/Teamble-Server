const _ = require("lodash");
const convertSnakeToCamel = require("../lib/convertSnakeToCamel");

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
    [idFirebase]
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
}

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

const getUserIdByIdFirebase = async (client, idFirebase) => {
  const { rows } = await client.query(
    `
    SELECT id
    FROM "user" u
    WHERE u.id_firebase = $1 AND u.is_deleted = false
    `,
    [idFirebase]
  );
  return convertSnakeToCamel.keysToCamel(rows[0]);
};

const getTypeIdByUserId = async (client, userId) => {
  const { rows } = await client.query(
    `
    SELECT type_id
    FROM "user" u
    WHERE u.id = $1
    `,
    [userId]
  );

  return convertSnakeToCamel.keysToCamel(rows[0]);
};
  
module.exports = { addUser, getUserByIdFirebase, getUserByUserId,  getUserIdByIdFirebase, getTypeIdByUserId };