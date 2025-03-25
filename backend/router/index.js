const express = require("express")
const questionRouter = require("./questionRouter")
const examDetailsDisplayRouter = require("./examDetailsDisplayRouter")


const bookRouter = require('./bookRouter');
const chatRouter = require('./chatRouter');
const userRouter = require('./userRouter');
const examRouter = require('./examRouter');


const subjectRouter = require("./subjectRouter");   
const menuRouter = require("./menuRouter");
const requestBookRoutes = require("./requestBookRoutes");
const attendanceRouter = require("./attendanceRouter");
const timeTableRouter = require("./timeTableRouter");
const assignmentRouter = require("./assignmentRouter");
const eventRouter = require("./eventRouter");
const leaveRouter = require("./leaverouter");
const studentRouter = require("./studentRouter");





const router =express()



router.use("/student",studentRouter)

router.use("/exam",examDetailsDisplayRouter)
router.use("/question",questionRouter)
router.use("/book",bookRouter)
router.use("/exam",examRouter)
router.use("/leave",leaveRouter)
router.use("/chat",chatRouter)
router.use("/user",userRouter)


router.use("/test",assignmentRouter)
router.use("/subject",subjectRouter)
router.use('/event',eventRouter)
router.use('/menu',menuRouter)
router.use('/requestBook',requestBookRoutes)
router.use('/attendance',attendanceRouter)
router.use('/timetable',timeTableRouter)


module.exports=router
