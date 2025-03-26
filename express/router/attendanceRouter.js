const express = require('express');
const attendanceController = require('../controllers/attendanceController');

const attendanceRouter = express.Router();

attendanceRouter.post('/', attendanceController.markAttendance);
attendanceRouter.get('/', attendanceController.getAll);
attendanceRouter.get('/:studentId', attendanceController.getByStudent);
attendanceRouter.put('/:id', attendanceController.update);
attendanceRouter.delete('/:id', attendanceController.delete);

module.exports = attendanceRouter;
