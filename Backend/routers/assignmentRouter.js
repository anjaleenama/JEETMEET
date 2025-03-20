const express = require("express")
const assignmentController = require('../controllers/assignmentController')


const assignmentRouter = express.Router();


assignmentRouter.post('/', assignmentController.create);


assignmentRouter.get('/', assignmentController.getAll);


assignmentRouter.get('/:id', assignmentController.getById);


assignmentRouter.put('/:id', assignmentController.update);


assignmentRouter.delete('/:id', assignmentController.delete);

module.exports = assignmentRouter;
