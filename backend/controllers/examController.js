const asyncHandler = require("express-async-handler");
const mongoose = require("mongoose");
const Exam = require("../model/examViewModel");

require("dotenv").config();

const examController = {
  
  getExams: asyncHandler(async (req, res) => {
    const exams = await Exam.find();
    if (!exams || exams.length === 0) {
      return res.status(404).json({ message: "No exams found" });
    }
    res.json({
      message: "Exams fetched successfully",
      exams,
    });
  }),

  getExamById: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: "Invalid exam ID" });
    }

    const exam = await Exam.findById(id);
    if (!exam) {
      return res.status(404).json({ message: "Exam not found" });
    }

    res.json({
      message: "Exam fetched successfully",
      exam,
    });
  }),

  addExam: asyncHandler(async (req, res) => {
    const { category, classDivision, subject, room, date, time, instructions } = req.body;

    // Validate required fields
    if (!category || !classDivision || !subject || !room || !date || !time || !instructions) {
      return res.status(400).json({ message: "All fields are required" });
    }

    // Validate date format
    if (isNaN(Date.parse(date))) {
      return res.status(400).json({ message: "Invalid date format. Use YYYY-MM-DD." });
    }

    const newExam = await Exam.create({
      category,
      classDivision,
      subject,
      room,
      date,
      time,
      instructions
    });

    res.status(201).json({
      message: "Exam inserted successfully",
      exam: newExam,
    });
  }),

  updateExam: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: "Invalid exam ID" });
    }

    const updatedExam = await Exam.findByIdAndUpdate(id, req.body, { new: true, runValidators: true });
    if (!updatedExam) {
      return res.status(404).json({ message: "Exam not found or could not be updated" });
    }

    res.json({
      message: "Exam updated successfully",
      exam: updatedExam,
    });
  }),

  deleteExam: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: "Invalid exam ID" });
    }

    const deletedExam = await Exam.findByIdAndDelete(id);
    if (!deletedExam) {
      return res.status(404).json({ message: "Exam not found or could not be deleted" });
    }

    res.json({
      message: "Exam deleted successfully",
      deletedExamId: deletedExam._id,
    });
  }),
};

module.exports = examController;
