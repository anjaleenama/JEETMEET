const express = require('express');

const subjectController = require('../controllers/subjectController')




const subjectRouter = express.Router();

subjectRouter.post('/', subjectController.create )

subjectRouter.get('/', subjectController.getAll);

subjectRouter.get('/:id', subjectController.getById);

subjectRouter.put('/:id', subjectController.update);

subjectRouter.delete('/:id', subjectController.delete);



module.exports = subjectRouter;