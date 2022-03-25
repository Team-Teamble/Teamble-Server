import { Response, Router } from 'express';
import { User } from '../entity/user';
import { Repository } from '../repository';
import { asyncRoute } from '../lib/endpoint';

function setEndpoint(router: Router, db: Repository) {
  return true;
}

export default setEndpoint;
