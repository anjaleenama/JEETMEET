const express = require('express');
const connectdb = require('./db/connectdb');
const  router  = require('./router');
const cookieParser = require("cookie-parser")



const app = express()

app.use(express.json())

app.use(cookieParser())

connectdb().catch((err)=>{
    console.log(err);
})

app.use("/api/v1",router)



app.listen(4000,()=>{
    console.log("running");
})