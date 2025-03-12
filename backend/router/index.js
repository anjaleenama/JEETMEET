
const express=require('express');
const bookRouter = require('./bookRouter');
const chatRouter = require('./chatRouter');
const userRouter = require('./userRouter');
const examRouter = require('./examRouter');
const leaveRouter = require('./leaverouter');





const router=express.Router()

router.use("/book",bookRouter)
router.use("/exam",examRouter)
router.use("/leave",leaveRouter)
router.use("/chat",chatRouter)
router.use("/user",userRouter)


module.exports=router