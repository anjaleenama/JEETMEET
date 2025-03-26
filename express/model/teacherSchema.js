const mongoose = require('mongoose');

const teacherSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  subjects: {  // ✅ Store subjects as an array
    type: [String],
    required: true,
  },
  classes: {
    type: String,
    required: true,
  }
});

const Teacher = mongoose.model('Teacher', teacherSchema);
module.exports = Teacher;
