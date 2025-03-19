const { default: mongoose } = require("mongoose");



const examSchema = new mongoose.Schema({
    date: { 
        type: Date, 
        required: true,
        trim: true, 
    },
  startTime: {
        type: String,
        required: true ,
        trim: true,
    }, // Example: "09:30 AM"
  endTime: { 
        type: String,
        required: true ,
        trim: true,
    }, // Example: "04:30 PM"
  examType: {
         type: String, 
         required: true ,
         trim: true,
    }, // Example: "Aptitude Test"
  category: {
        type: String, 
        required: true ,
        trim: true,
    }, // Example: "Test"
  classDivision: {
        type: String, 
        required: true,
        trim: true,
    }, // Example: "4 A"
  subject: {
        type: String, 
        required: true,
        trim: true, 
    }, // Example: "Mathematics"
  room: {
        type: String,
        required: true ,
        trim: true,
    }, // Example: "Room 4"
  instruction: { 
        type: [String] ,
        default:[]
    },
    // questions: [{ type: mongoose.Schema.Types.ObjectId, ref: "Question" }]

})

const examDetails = mongoose.model("examdetails", examSchema);
module.exports =examDetails