const _ = require('lodash');
const convertSnakeToCamel = require('../lib/convertSnakeToCamel');

// goal 테이블 모든 정보 가져오기
const getGoal = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "goal" g
    ORDER BY id ASC
    `,
  );
  /**
  목표 정보가 존재하는 경우 목표 객체의 배열 저장
  목표 정보가 존재하지 않는 경우 [] 저장
  */
  const goal = rows ? rows : [];
  return convertSnakeToCamel.keysToCamel(goal);
};

// goal 테이블의 '전체' row를 제외한 모든 정보 가져오기
const getGoalWithoutAll = async (client) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "goal" g
    WHERE g.id > 1
    ORDER BY id ASC;
    `,
  );

  /**
  목표 정보가 존재하는 경우 목표 객체의 배열 저장
  목표 정보가 존재하지 않는 경우 [] 저장
  */
  const goalWithoutAll = rows ? rows : [];

  return convertSnakeToCamel.keysToCamel(goalWithoutAll);
};

const getGoalByGoalId = async (client, goalId) => {
  const { rows } = await client.query(
    `
    SELECT *
    FROM "goal" g
    WHERE g.id = $1
    ORDER BY id ASC;
    `,
    [goalId],
  );
  const goal = rows[0] ? rows[0] : null;
  return convertSnakeToCamel.keysToCamel(goal);
};

module.exports = { getGoal, getGoalWithoutAll, getGoalByGoalId };
