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

module.exports = { addUser, getUserByUserId };

// SELECT (u.name, type.name) AS type_name
// FROM "user" u
// JOIN "type" t
// ON u.type_id = t.id
// WHERE u.id = $1
// AND is_deleted = FALSE

// INNER JOIN staff s 
// ON p.staff_id = s.staff_id
// ORDER BY payment_date;

// SELECT * FROM "user" u
// WHERE id = $1
// AND is_deleted = FALSE



  /* -------- 로직1 --------*/
  // 1. user가 있는지 확인
  // user.id, is_deleted=false
  // 없으면 바로 return

  // 있으면 
  // 2. userId로 user 테이블의 정보 조회(select)
  // user.type_id, user.field_id user.position_id 등

  // 3-1. if(user.type_id) // 있으면 id에 저장 및 select, 없으면 null
  // select * from type
  // 반환값 저장하기

  // select * from tag
  // 반환값 저장하기

  // 3-2. if(user.field_id) // 있으면 id에 저장 및 select, 없으면 null
  // select * from field
  // where id = 
  // 반환값 저장하기

  // 3-3. if(user.position_id) // 있으면 id에 저장 및 select, 없으면 null
  // select * from position

  // 4. 반환값들 합치기

  /* -------- 로직2 --------*/
  // select (~~) as type
  // from
  // join

  //