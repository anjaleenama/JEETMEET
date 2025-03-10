const express = require("express")

const examDetailsDisplayController = require("../controllers/examDetailsDisplayController")


const examDetailsDisplayRouter = express.Router()

examDetailsDisplayRouter.post("/result",examDetailsDisplayController.examDetails),
examDetailsDisplayRouter.post("/exam-details",examDetailsDisplayController.showExamDetails)
examDetailsDisplayRouter.post("/detailstostartexam",examDetailsDisplayController.viewStartExamPage)

module.exports=examDetailsDisplayRouter