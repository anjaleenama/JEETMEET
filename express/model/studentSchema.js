const mongoose = require("mongoose");

const StudentSchema = new mongoose.Schema({
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    name: { type: String, required: true },
    profile_image: { type: String, default: null },
    classes: { type: String, required: true },
    division: { type: String, required: true },
    roll_number: { type: Number, required: true },
    register_number: { type: String, required: true, unique: true }, // Added register number
    dob: { type: Date, required: true },
    parent_id: { type: mongoose.Schema.Types.ObjectId, ref: "Parent", required: true }, 
    secondary_phone: { type: String, default: null }, 
    address: { type: String, default: null },       
    place: { type: String, default: null },         
    post_code: { type: String, default: null },       
    blood_group: { type: String, default: null },
    state: { type: String, default: null },
    country: { type: String, default: null },  
    nationality: { type: String, default: null },
    username: { type: String, required: true, unique: true }
}, { timestamps: true });

module.exports = mongoose.model("Student", StudentSchema);
