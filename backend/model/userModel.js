const { default: mongoose } = require("mongoose");


const UserSchema = new mongoose.Schema({

    name: { 
        type: String, 
        required: true 
    },
    avatar:{
         type: String,
          default: "" 
        },
    email: { 
        type: String, 
        required: true,
         unique: true }
},
 { timestamps: true });

const User = mongoose.model("User", UserSchema);

module.exports = User