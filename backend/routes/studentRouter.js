const express=require("express")
const studentController = require("../controller/studentController")
const isAuth = require("../middleware/isAuth")
const studentRouter=express.Router()

studentRouter.post('/register',studentController.register)
// studentRouter.post('/parentRegister',studentController.addParent)
studentRouter.get('/dashboard',isAuth,studentController.dashBoard)
studentRouter.post('/notification/add',studentController.insertNotification)
studentRouter.post('/login',studentController.login)
studentRouter.post('/profile',isAuth,studentController.profile)
studentRouter.post('/assignment/add',isAuth,studentController.addAssignment)
studentRouter.post('/assignment/show',isAuth,studentController.getAssignments)
studentRouter.post('/teacher/add',isAuth,studentController.createTeacher)
studentRouter.post('/teacher/show',isAuth,studentController.getTeachersByClass)
studentRouter.post('/assignment/calender',isAuth,studentController.calender)
studentRouter.post('/forgotPassword',studentController.forgotPassword)
studentRouter.post('/reset-password/:token',studentController.resetPassword)









module.exports=studentRouter

