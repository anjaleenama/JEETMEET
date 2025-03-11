
const { default: mongoose } = require('mongoose')


require ('dotenv').config()


async function connectdb(){
    await mongoose.connect(process.env.MONGO_URI)
    console.log("Pinged your deployment. ")
}




module.exports = connectdb