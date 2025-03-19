const asyncHandler = require("express-async-handler");
const examDetails = require("../model/examModel");



const examDetailsDisplayController ={
examDetails:asyncHandler(async (req,res) => {
    const{date,startTime,endTime,examType,category,classDivision,subject,room,instructions } =req.body

    if(!date || !startTime || !endTime || !examType || !category || !classDivision || !subject || !room || !instructions){

        throw new Error(" Date, StartTime, EndTime, ExamType, Category, ClassDivision, Subject, Room, Instructions are required");
        
    }

    console.log(date,endTime,startTime,examType,category,classDivision,subject,room,instructions);

    const examdetails = await examDetails.create({
        date,
        startTime,
        endTime,
        examType,
        category,
        classDivision,
        subject,
        room,
        instructions
    })

    if (!examdetails) {
        return res.status(500).json({error: "Failed to insert exam details"})
        
    }

    res.status(201).json({message:"Exam Details are successfully added to the Database"})
}),

showExamDetails: asyncHandler(async (req,res) => {
    const fetchedExamDetails = await examDetails.find()

    if (!fetchedExamDetails || fetchedExamDetails.length === 0) {
        return res.status(404).json({ error: "No exam details found" });
      }
      
    res.status(200).json(fetchedExamDetails) 
    
}),

viewStartExamPage: asyncHandler(async (req,res) => {

    const { classDivision } = req.params;
    if (!classDivision) {
        return res.status(400).json({ error: "Class division is required" });
      }
      console.log("Fetching details for class division:", classDivision);

    const fetchedDetails = await examDetails.find({classDivision:classDivision}).select(" -_id date startTime endTime examType classDivision subject")//-_id from remove the objectId that automatically passed

    if (!fetchedDetails.length) {
        return res.status(404).json({ error: "No exams found for this class division" });
      }

        res.status(200).json(fetchedDetails)
})

};

module.exports = examDetailsDisplayController

