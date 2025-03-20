const { default: mongoose } = require("mongoose");
require('dotenv').config()





async function connectdb(){
    await mongoose.connect(process.env.MONGO_URI)
    console.log("pinged your deployment. you successfully connected to mongoDB!");
    
}

module.exports = connectdb