const mongoose = require("mongoose");

const parentSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true // Ensure unique parent emails
    },
    phone: {
        type: String,
        required: true
    },
    address: {
        type: String
    },
    students: [{ 
        type: mongoose.Schema.Types.ObjectId, 
        ref: "Student" 
    }] // Stores an array of student ObjectIds
}, { timestamps: true });

module.exports = mongoose.model("Parent", parentSchema);
