const { default: mongoose } = require("mongoose");


const questionModel = new mongoose.Schema({
    questionText:{
        type:String,
        required: true
    },
    options:[
        {
            text:{
                type:String,
                required:true
            },
            isCorrect:{
                type:Boolean,
                required:true
            }
        }
    ],
    subject:{
        type:String,
        required:true
    },
    classDivision:{
        type:String,
        required:true
    },
    createdAt:{
        type:Date,
        default:Date.now
    }
});

const Question= mongoose.model("Question",questionModel);
module.exports = Question;