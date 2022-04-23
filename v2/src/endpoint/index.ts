import { Router } from 'express';
import { Repository } from '../repository';
import { MysqlRepository } from '../repository/mysqlRepository';

import setProjectEndpoint from './project';
import setUserEndpoint from './user';
import setUserEndpoint2 from './user2';

export async function getAPIEndpoints(db: Repository, config: { baseURL: string }): Promise<Router> {
  const apiRouter = Router();

  setProjectEndpoint(apiRouter, db);
  setUserEndpoint(apiRouter, db);

  return apiRouter;
}

export async function getAPIEndpoints2(db: MysqlRepository, config: { baseURL: string }): Promise<Router> {
  const apiRouter = Router();

  setUserEndpoint2(apiRouter, db);

  return apiRouter;
}
