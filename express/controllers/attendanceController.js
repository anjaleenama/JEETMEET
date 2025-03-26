const asyncHandler = require('express-async-handler');
const mongoose = require('mongoose');
const Attendance = require('../model/attendanceModel');

const attendanceController = {
    
    // Mark attendance for a student
    markAttendance: asyncHandler(async (req, res) => {
        const { studentId, date, status } = req.body;

        if (!studentId || !date || !status) {
            return res.status(400).json({ message: "All fields are required" });
        }

        const attendance = await Attendance.create({
            studentId,
            date,
            status
        });

        if (!attendance) {
            return res.status(400).json({ message: "Failed to mark attendance" });
        }

        res.status(201).json(attendance);
    }),

    // Get all attendance records
    getAll: asyncHandler(async (req, res) => {
        const attendanceRecords = await Attendance.find().populate('studentId', 'name');
        res.status(200).json(attendanceRecords);
    }),

    // Get attendance for a specific student
    getByStudent: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.studentId)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const attendanceRecords = await Attendance.find({ studentId: req.params.studentId });

        if (!attendanceRecords) {
            return res.status(404).json({ message: "No attendance records found" });
        }

        res.status(200).json(attendanceRecords);
    }),

    // Update attendance record
    update: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const attendance = await Attendance.findById(req.params.id);

        if (!attendance) {
            return res.status(404).json({ message: "Attendance record not found" });
        }

        const updatedAttendance = await Attendance.findByIdAndUpdate(
            req.params.id,
            req.body,
            { new: true }
        );

        res.status(200).json(updatedAttendance);
    }),

    // Delete an attendance record
    delete: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const attendance = await Attendance.findById(req.params.id);

        if (!attendance) {
            return res.status(404).json({ message: "Attendance record not found" });
        }

        await attendance.deleteOne();
        res.status(200).json({ message: "Attendance record deleted successfully" });
    })
};

module.exports = attendanceController;
