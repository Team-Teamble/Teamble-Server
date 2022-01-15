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

module.exports = { getTagByTypeId };
