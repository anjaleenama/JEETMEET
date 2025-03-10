const { default: mongoose } = require("mongoose");
require('dotenv').config()

async function connectdb() {
    
    await mongoose.connect(process.env.MONGO_URI)
    console.log("pinged your deployment. You successfully connected to MongoDB!");
}

module.exports = connectdb

