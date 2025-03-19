const express=require("express")
const studentController = require("../controller/studentController")
const isAuth = require("../middleware/isAuth")
const studentRouter=express.Router()

studentRouter.post('/register',studentController.register)
// studentRouter.post('/parentRegister',studentController.addParent)
studentRouter.get('/dashboard',studentController.dashBoard)
studentRouter.post('/notification/add',studentController.insertNotification)
studentRouter.post('/login',studentController.login)
studentRouter.post('/profile',studentController.profile)
studentRouter.post('/assignment/add',studentController.addAssignment)
studentRouter.post('/assignment/show',studentController.getAssignments)
studentRouter.post('/teacher/add',studentController.createTeacher)
studentRouter.post('/teacher/show',studentController.getTeachersByClass)
studentRouter.post('/assignment/calender',studentController.calender)
studentRouter.post('/forgotPassword',studentController.forgotPassword)
studentRouter.post('/reset-password/:token',studentController.resetPassword)









module.exports=studentRouter

