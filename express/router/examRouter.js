const express = require('express');
const examController = require('../controllers/examController');

const examRouter = express.Router()

examRouter.get("/new",examController.getExams)
examRouter.get("/new1/:id",examController.getExamById)
examRouter.post("/new2",examController.addExam)
examRouter.put("/new3/:id",examController.updateExam)
examRouter.delete("/new4/:id",examController.deleteExam)


module.exports = examRouter
