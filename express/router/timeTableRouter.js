const express = require('express');
const timeTableController = require('../controllers/timeTableController');

const timeTableRouter = express.Router();

timeTableRouter.post('/', timeTableController.createTimeTable);
timeTableRouter.get('/', timeTableController.getAll);
timeTableRouter.get('/:day', timeTableController.getByDay);
timeTableRouter.put('/:id', timeTableController.update);
timeTableRouter.delete('/:id', timeTableController.delete);

module.exports = timeTableRouter;
