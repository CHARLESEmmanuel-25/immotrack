import { Router } from 'express';
import mainController from '../Controller/mainController.js';

const router = Router();

router.get('/', mainController.home);
router.get('/ajout', mainController.getaddProp);
router.post('/ajout', mainController.addProp);




export default router;
