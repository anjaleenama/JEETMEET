const mongoose = require('mongoose');

const assignmentSchemas = new mongoose.Schema({
  title: {
    type: String,
    required: true, 
  },
  dueDate: {
    type: Date,
    required: true, 
  },
  
  description: {
    type: String,
  },
  assignedBy: { 
    type: String, 
    required: true 
},
 
  classes: {
    type:String,
    required:true,
    trim:true
  },
  division:{
    type:String,
    required:true,
    trim:true,
  },
 

  

}, { timestamps: true });

const Assignment = mongoose.model('Assignment', assignmentSchemas);

module.exports = Assignment;