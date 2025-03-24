const express = require("express");
const connectdb = require("./db/connectdb");
const cookieParser = require("cookie-parser");
const router = require("./router");
require('dotenv').config();


const app = express()

app.use(express.json())

app.use(cookieParser())

connectdb().catch((err)=>{
    console.log(err);
})
app.use("/api/v1",router)


app.listen(5000,()=>{
    console.log("running");
    
})