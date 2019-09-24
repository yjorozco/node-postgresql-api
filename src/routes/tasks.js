import { Router } from 'express';
import { createTask, getTasks,  deleteTask, updateTask, getOneTask, getTaskByProject } from '../controllers/task.controller';
const router = Router();

router.post('/', createTask);
router.get('/', getTasks);
router.delete('/:id',  deleteTask);
router.put('/:id',  updateTask);
router.get('/:id',  getOneTask);
router.get('/project/:projectid',  getTaskByProject);
export default router;