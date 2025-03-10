const express = require('express')
const questionController = require('../controllers/questionController')


const questionRouter = express.Router()

questionRouter.post("/addQuestion",questionController.addQuestions)
questionRouter.post("/displayQuestion",questionController.displayQuestion)
questionRouter.post("/attendExam",questionController.submitExam)




module.exports = questionRouter