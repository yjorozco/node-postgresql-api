import { Router } from 'express';
import { createProject, updateProject, deleteProject, getProjects, getOneProject } from '../controllers/project.controller';

const router = Router();

router.post('/', createProject);
router.get('/', getProjects);
router.get('/:id', getOneProject);
router.delete('/:id', deleteProject);
router.put('/:id', updateProject);
export default router;