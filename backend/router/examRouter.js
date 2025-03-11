const express = require('express');
const examController = require('../controllers/examController');

const examRouter = express.Router()

examRouter.post("/new",examController.getExams)
examRouter.post("/new1/:id",examController.getExamById)
examRouter.post("/new2",examController.addExam)
examRouter.post("/new3/:id",examController.updateExam)
examRouter.post("/new4/:id",examController.deleteExam)


module.exports = examRouter
