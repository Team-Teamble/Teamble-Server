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

  return convertSnakeToCamel.keysToCamel(projectId)
};

module.exports = { getProjectIdByUserId };