const express=require("express")
const studentController = require("../controllers/studentController")
const isAuth = require("../middleware/isAuth")
const studentRouter=express.Router()

studentRouter.post('/register',studentController.register)
// studentRouter.post('/parentRegister',studentController.addParent)
studentRouter.get('/dashboard',isAuth,studentController.dashBoard)
studentRouter.post('/notification/add',isAuth,studentController.insertNotification)
studentRouter.post('/login',isAuth,studentController.login)
studentRouter.post('/profile',isAuth,studentController.profile)
studentRouter.post('/assignment/add',isAuth,studentController.addAssignment)
studentRouter.post('/assignment/show',isAuth,studentController.getAssignments)
studentRouter.post('/teacher/add',isAuth,studentController.createTeacher)
studentRouter.post('/teacher/show',isAuth,studentController.getTeachersByClass)
studentRouter.post('/assignment/calender',isAuth,studentController.calender)
studentRouter.post('/forgotPassword',isAuth,studentController.forgotPassword)
studentRouter.post('/reset-password/:token',isAuth,studentController.resetPassword)









module.exports=studentRouter

