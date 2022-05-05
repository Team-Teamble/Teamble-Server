import express, { Router } from 'express';
import { UserController } from '../controllers';

const router: Router = express.Router();

router.post('/', UserController.createUser);

export default router;
