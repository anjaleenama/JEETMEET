const express = require('express')
const questionController = require('../controllers/questionController')


const questionRouter = express.Router()

questionRouter.post("/addQuestion",questionController.addQuestions)
questionRouter.get("/displayQuestion/:classDivision/:subject",questionController.displayQuestion)
// router.get('/question/displayQuestion/:classDivision/:subject', displayQuestion);
questionRouter.post("/attendExam",questionController.submitExam)




module.exports = questionRouter