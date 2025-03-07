const express=require("express")
// const  route = require("./routes/studentRouter")
const connectDb = require("./db/connectdb")
const  router  = require("./routes")
const cookieParser = require("cookie-parser")
const cors=require('cors')
const app=express()

connectDb().catch(e=>{console.log(e);
})
const corsOptions = {
    origin: 'http://localhost:5173',
    optionsSuccessStatus: 200 
  }


app.use(express.json())
app.use(cookieParser()); 
app.use(cors(corsOptions))


app.use("/api/v1",router)



app.listen(5000,()=>{
    console.log("app is running");
    
})