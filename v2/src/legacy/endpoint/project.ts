import { Response, Router } from 'express';
import { Project } from '../../interfaces/Project';
import { Repository } from '../repository';
import { asyncRoute } from '../../lib/endpoint';
import util from '../../lib/util';
import statusCode from '../../constants/statusCode';
import responseMessage from '../../constants/responseMessage';

function setEndpoint(router: Router, db: Repository) {
  router.post(
    '/project',
    asyncRoute(async (req, res) => {
      if (projectFormatGuard(req.body, res)) {
        const newProject = await db.createProject(req.body);

        res.status(statusCode.CREATED).send(util.success(statusCode.CREATED, responseMessage.CREATE_PROJECT_SUCCESS, newProject));
      }
    }),
  );

  router.get(
    '/project',
    asyncRoute(async (req, res) => {
      const projects = await db.getProjects();

      res.status(statusCode.OK).send(util.success(statusCode.OK, responseMessage.GET_PROJECT_SUCCESS, projects));
    }),
  );

  router.get(
    '/project/:projectId',
    asyncRoute(async (req, res) => {
      const projectId = req.params.projectId;
      const project = await db.getProject(projectId);

      if (project === null) {
        res.status(404).json({
          message: '해당 id의 게시글이 없습니다.',
        });
        return;
      }

      res.status(200).json(project);
    }),
  );
}

function projectFormatGuard(obj: unknown, res: Response): obj is Pick<Project, 'title' | 'intro'> {
  if (typeof obj !== 'object' || obj === null) {
    res.status(400).json({ message: `올바르지 않은 객체입니다.` });
    return false;
  }

  const toCheck: Array<keyof Pick<Project, 'title' | 'intro'>> = ['title', 'intro'];

  for (const key of toCheck) {
    if ((obj as Project)[key] === undefined) {
      res.status(400).json({ message: `${key} 필드가 없습니다.` });
      return false;
    }
  }

  return true;
}

export default setEndpoint;
