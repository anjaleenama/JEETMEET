const {default : mongooose} = require('mongoose');

const subjectSchema = new mongooose.Schema({

    className:{
        type: String,
        required: true
    },
    subjectCode:{
        type: Number,
        required: true
    },
    subjectName:{
        type: String,
        required: true
    },
    Teacher:[{
        type:String,
        required: true
    }],
    subjectAuthor:{
        type: String,
        required: true
    },
    passMark:{
        type:Number,
        required: true
    },
    finalMark:{
        type:Number,
        required: true
    },
    description:{
        type: String,
        required: true
    }
},{Timestamp:true})

const Subject = mongooose.model('Subject', subjectSchema);

module.exports = Subject;