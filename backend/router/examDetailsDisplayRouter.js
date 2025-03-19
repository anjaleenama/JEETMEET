const express = require("express")

const examDetailsDisplayController = require("../controllers/examDetailsDisplayController")


const examDetailsDisplayRouter = express.Router()

examDetailsDisplayRouter.post("/insert-exam-details",examDetailsDisplayController.examDetails),
examDetailsDisplayRouter.post("/exam-details",examDetailsDisplayController.showExamDetails)
examDetailsDisplayRouter.get("/details-to-start-exam/:classDivision",examDetailsDisplayController.viewStartExamPage)

module.exports=examDetailsDisplayRouter