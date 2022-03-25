import { Router } from 'express';
import { Repository } from '../repository';

import setProjectEndpoint from './project';
import setUserEndpoint from './user';

export async function getAPIEndpoints(
  db: Repository,
  config: { baseURL: string }
): Promise<Router> {
  const apiRouter = Router();

  setProjectEndpoint(apiRouter, db);
  setUserEndpoint(apiRouter, db);

  return apiRouter;
}
