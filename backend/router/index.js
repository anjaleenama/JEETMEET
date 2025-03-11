
const express=require('express');
const bookRouter = require('./bookRouter');
const examRouter = require('./examRouter');
const chatRouter = require('./chatRouter');
const userRouter = require('./userRouter');
const leaveRouter = require('./leaveRouter');



const router=express.Router()

router.use("/book",bookRouter)
router.use("/exam",examRouter)
router.use("/leave",leaveRouter)
router.use("/chat",chatRouter)
router.use("/user",userRouter)


module.exports=router