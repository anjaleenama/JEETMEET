const { default: mongoose } = require("mongoose");


const ExamSchema = new mongoose.Schema({
  subject:{
  type:String,
},

  category: {
    type:String,
  },

  classDivision:{
   type:String,
},

  room: {
    type:String,
  },

  date:{
    type:Date,
  },

  instructions: {
    type:String,
},
});

const Exam = mongoose.model("Exam", ExamSchema);

module.exports = Exam