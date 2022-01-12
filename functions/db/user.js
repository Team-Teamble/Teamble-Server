const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const addUser = async (client, email, name, idFirebase) => {
  // DB에 유저 생성하기
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

  // 해당 유저의 진행중인 프로젝트 id 가져오기
  let projectId = await client.query(
      `
      SELECT id FROM "project" p
      WHERE p.user_id = $1
          AND p.is_closed = FALSE;
      `,
      [rows[0].id],
  );

  /** 
  프로젝트가 존재하는 경우 프로젝트 id 저장
  프로젝트가 존재하지 않는 경우 null 저장
  */
  projectId = projectId.rows[0] ? projectId.rows[0].id : null;

  // 유저 정보를 가진 객체에 projectId 넣어주기
  rows[0]["projectId"] = projectId;

  return convertSnakeToCamel.keysToCamel(rows[0]);
};

module.exports = { addUser };