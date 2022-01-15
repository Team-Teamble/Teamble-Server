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

// 협업 성향 태그 배열로 객체 가져오기
const getTagByTagId = async (client, tagId) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "tag" t
    WHERE t.id = ANY($1)
    ORDER BY id ASC;
    `,
    [tagId],
  );

  const tag = rows ? rows : [];

  return convertSnakeToCamel.keysToCamel(tag);
};

module.exports = { getTagByTypeId, getTagByTagId };
