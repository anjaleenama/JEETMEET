const express = require("express")
const questionRouter = require("./questionRouter")
const examDetailsDisplayRouter = require("./examDetailsDisplayRouter")


const router =express()

const bookRouter = require('./bookRouter');
const chatRouter = require('./chatRouter');
const userRouter = require('./userRouter');
const examRouter = require('./examRouter');
const leaveRouter = require('./leaverouter');



router.use("/exam",examDetailsDisplayRouter)
router.use("/question",questionRouter)

router.use("/book",bookRouter)
router.use("/exam",examRouter)
router.use("/leave",leaveRouter)
router.use("/chat",chatRouter)
router.use("/user",userRouter)


module.exports=router
