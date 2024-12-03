import { Router } from 'express';
import mainController from '../Controller/mainController.js';

const router = Router();

router.get('/', mainController.home);
router.get('/edit', mainController.editProp);
router.get('/add', mainController.addProp);
router.post('/search', mainController.searchInput);




export default router;
