const express = require("express")
const questionRouter = require("./questionRouter")
const examDetailsDisplayRouter = require("./examDetailsDisplayRouter")


const router =express()


router.use("/exam",examDetailsDisplayRouter)
router.use("/question",questionRouter)


module.exports=router

