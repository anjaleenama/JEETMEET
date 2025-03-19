const express =require('express');
const connectdb = require('./db/connectdb');
const  router = require('./router');
const cors = require('cors')
const app= express()

const corsOptions ={
    origin:"http://localhost:5173",
    optionSucessStatus:200
}


connectdb().catch((err)=>{
    console.log(err);
})

app.use(cors(corsOptions))
app.use(express.json())

app.use("/api/v1",router)

app.listen(5000,()=>{
    console.log("Server Running");
    
})