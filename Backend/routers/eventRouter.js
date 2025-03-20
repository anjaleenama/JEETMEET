const express = require("express");
const eventController = require("../controllers/eventController");



const eventRouter = express.Router();

eventRouter.post('/',eventController.create);

eventRouter.get('/',eventController.getAll);

eventRouter.get('/:id',eventController.getById);

eventRouter.put('/:id',eventController.update);

eventRouter.delete('/:id',eventController.delete);

module.exports = eventRouter;