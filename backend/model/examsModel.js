const { default: mongoose } = require("mongoose");


const ExamsSchema = new mongoose.Schema({
  category: {
    type:String,
  },

  classDivision:{
   type:String,
},

subject:{
  type:String,
},
  room: {
    type:String,
  },

  date:{
    type:Date,
  },

  time:{
    type:String
  },

  instructions: {
    type:String,
},
});

const Exam = mongoose.model("Exam", ExamsSchema);

module.exports = Exam