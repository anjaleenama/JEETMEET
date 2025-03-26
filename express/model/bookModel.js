const { default: mongoose } = require("mongoose");


const BookSchema = new mongoose.Schema({
  name:{
  type:String,
  required: true,
  trim: true,
  },

  author:{
    type:String,
    required: true,
    trim: true,
  },
  
  category:{
    type:String,
    required: true,
    trim: true,
   },

  price:{
    type:Number,
    required: true,
    trim: true,
   },

  rackNumber:{
    type: String,
  },
  status: { 
    type: String, enum: ["Available", "Issued"], default: "Available"
   },

});

const Book = mongoose.model("Book",BookSchema)

module.exports = Book
