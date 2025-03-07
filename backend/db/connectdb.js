const {mongoose}=require("mongoose")
require("dotenv").config()

 const connectDb=async()=>{
    const connect=mongoose.connect(process.env.MONGO_URI)
    if(connect){console.log("connected to databse");
    }
}
 module.exports=connectDb
