import { Response, Router } from 'express';
import { Project } from '../entity/project';
import { Repository } from '../repository';
import { asyncRoute } from '../lib/endpoint';

function setEndpoint(router: Router, db: Repository) {
  return true;
}

export default setEndpoint;
