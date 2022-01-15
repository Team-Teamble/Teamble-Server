const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const getTagByTypeId = async (client, typeId) => {
  const { rows } = await client.query(
    `
    SELECT t.*
    FROM "tag" t
    INNER JOIN "type_tag" tt
      ON t.id = tt.tag_id
    WHERE tt.type_id = $1
    ORDER BY id ASC;
    `,
    [typeId],
  );

  // 해당하는 태그가 없는 경우 빈 배열 반환
  return convertSnakeToCamel.keysToCamel(rows);
};

// tag 테이블 모든 정보 가져오기
const getTag = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "tag" t
    ORDER BY id ASC;
    `,
  );

  /**
  태그 정보가 존재하는 경우 태그 객체의 배열 저장
  태그 정보가 존재하지 않는 경우 [] 저장
  */
  const tag = rows ? rows : [];

  return convertSnakeToCamel.keysToCamel(tag);
};

module.exports = { getTagByTypeId, getTag };
