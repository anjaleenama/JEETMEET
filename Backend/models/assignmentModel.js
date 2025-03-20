const {default : mongoose} = require('mongoose');

const assignmentSchema = new mongoose.Schema({

    className: {
        type: String,
        required: true
    },
    academicYear: {
        type: String,
        required: true
    },
    category: {
        type: String,
        required: true
    },
    deadline: {
        type: Date,
        required: true
    },
    subject: {
        type: String,
        required: true
    },
    description: {
        type: String
    },
    attachment: {
        type: String 
    }
}, { timestamps: true });

const Assignment = mongoose.model('Assignment', assignmentSchema);

module.exports = Assignment;
