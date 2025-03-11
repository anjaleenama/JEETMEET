const asyncHandler = require("express-async-handler");
const mongoose = require("mongoose");
const Exam = require("../model/examModel");
require("dotenv").config();

const examController = {
  // Get all exams
  getExams: asyncHandler(async (req, res) => {
    const exams = await Exam.find();
    if (!exams) {
      throw new Error("No exams found");
    }
    res.json({
      message: "Exams fetched successfully",
      exams,
    });
  }),

  // Get a single exam by ID
  getExamById: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      throw new Error("Invalid exam ID");
    }

    const exam = await Exam.findById(id);
    if (!exam) {
      throw new Error("Exam not found");
    }

    res.json({
      message: "Exam fetched successfully",
      exam,
    });
  }),

  // Add a new exam
  addExam: asyncHandler(async (req, res) => {
    const { title, date, duration } = req.body;
    const newExam = await Exam.create({
      title,
      date,
      duration,
    });

    if (!newExam) {
      throw new Error("Exam could not be inserted");
    }

    res.json({
      message: "Exam inserted successfully",
      exam: newExam,
    });
  }),

  // Update an exam
  updateExam: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      throw new Error("Invalid exam ID");
    }

    const updatedExam = await Exam.findByIdAndUpdate(id, req.body, { new: true });
    if (!updatedExam) {
      throw new Error("Exam not found or could not be updated");
    }

    res.json({
      message: "Exam updated successfully",
      updatedExam,
    });
  }),

  // Delete an exam
  deleteExam: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      throw new Error("Invalid exam ID");
    }

    const deletedExam = await Exam.findByIdAndDelete(id);
    if (!deletedExam) {
      throw new Error("Exam not found or could not be deleted");
    }

    res.json({
      message: "Exam deleted successfully",
      deletedExam,
    });
  }),
};

module.exports = examController;
