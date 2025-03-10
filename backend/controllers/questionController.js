const asyncHandler = require('express-async-handler');
const Question = require('../model/questionModel');



const questionController = {
    addQuestions:asyncHandler(async (req,res) => {
        const { questionText,options,subject,classDivision } = req.body
        console.log(questionText,options,subject,classDivision);

        if (!questionText || !options || !subject || !classDivision) {
            throw new Error("Question, Options, subject, classDivision is required");
        }

        const question =await Question.create({
            questionText,
            options,
            subject,
            classDivision
        })

        if (!question) {
            throw new Error("Question is not add to the database");
            
        }

        res.status(200).json({
            message:"Question is successfully added to the database"
           })
        
    }),
    displayQuestion:asyncHandler(async (req,res) => {
        const {subject,classDivision}=req.body

        const questions = await Question.find({classDivision:classDivision , subject:subject})
        
        const sanitizedQuestion = questions.map(q =>({
            _id : q._id,
            questionText : q.questionText,
            options : q.options.map(opt =>({text: opt.text}))
        }))
        res.json(sanitizedQuestion)
    }),
    submitExam: asyncHandler(async (req, res) => {
        const { answers } = req.body;
    
        if (!answers || !Array.isArray(answers)) {
            return res.status(400).json({ message: "Invalid request format" });
        }
    
        let totalMark = 0;
        let result = [];
    
        for (const answer of answers) {
            const question = await Question.findById(answer.questionId);
            if (!question) continue;
    
            // Find the correct answer
            const correctOption = question.options.find(opt => opt.isCorrect);
            const isCorrect = correctOption && correctOption.text === answer.selectedOption;
    
            if (isCorrect) {
                totalMark += 1;
            }
    
            result.push({
                questionText: question.questionText,
                userAnswer: answer.selectedOption || "No answer",
                correctAnswer: correctOption?.text || "No correct answer found",
                isCorrect,
            });
        }
    
        res.json({
            totalMark,
            result,
            message: "Exam submitted successfully!"
        });
    })
    
}

module.exports =questionController

