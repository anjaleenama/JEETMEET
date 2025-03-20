const express = require('express');
const assignmentRouter = require('./assignmentRouter');
const subjectRouter = require('./subjectRouter');
const eventRouter = require('./eventRouter');
const menuRouter = require('./menuRouter');
const requestBookRoutes = require('./requestBookRoutes');
const attendanceRouter = require('./attendanceRouter');
const timeTableRouter = require('./timeTableRouter');




const router = express()

router.use("/test",assignmentRouter)

router.use("/subject",subjectRouter)

router.use('/event',eventRouter)

router.use('/menu',menuRouter)

router.use('/requestBook',requestBookRoutes)

router.use('/attendance',attendanceRouter)

router.use('/timetable',timeTableRouter)

module.exports = router;