const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

const getTagByTypeId = async (client, typeId) => {
  const { rows } = await client.query(
    `
        SELECT tag_id
        FROM "type_tag" tt
        WHERE type_id = $1
        `,
    [typeId]
  );

  /**
  타입이 존재하는 경우 타입 객체 저장
  타입이 존재하지 않는 경우 null 저장
  */
  const tag = rows[0] ? rows[0] : null;
  return convertSnakeToCamel.keysToCamel(tag);
};

module.exports = {
  getTagByTypeId,
};
