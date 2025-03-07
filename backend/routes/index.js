const express=require("express")
const studentRouter = require("./studentRouter")
const router=express()

router.use("/student",studentRouter)

module.exports=router