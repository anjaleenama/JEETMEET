const express = require("express")
const questionRouter = require("./questionRouter")
const examDetailsDisplayRouter = require("./examDetailsDisplayRouter")
const assignmentRouter = require("./assignmentRouter");
const eventRouter = require("./eventRouter");
const bookRouter = require('./bookRouter');
const chatRouter = require('./chatRouter');
const userRouter = require('./userRouter');
const examRouter = require('./examRouter');
const leaveRouter = require('./leaverouter');
const studentRouter = require("./studentRouter");
const subjectRouter = require("./subjectRouter");
const menuRouter = require("./menuRouter");
const requestBookRoutes = require("./requestBookRoutes");
const attendanceRouter = require("./attendanceRouter");
const timeTableRouter = require("./timeTableRouter");


const router =express()





router.use("/exam",examDetailsDisplayRouter)
router.use("/question",questionRouter)

router.use("/book",bookRouter)
router.use("/exam",examRouter)
router.use("/leave",leaveRouter)
router.use("/chat",chatRouter)
router.use("/user",userRouter)


router.use("/student",studentRouter)

router.use("/test",assignmentRouter)

router.use("/subject",subjectRouter)

router.use('/event',eventRouter)

router.use('/menu',menuRouter)

router.use('/requestBook',requestBookRoutes)

router.use('/attendance',attendanceRouter)

router.use('/timetable',timeTableRouter)


module.exports=router
