const asyncHandler = require('express-async-handler');
const mongoose = require('mongoose');
const TimeTable = require('../models/timeTableModel');

const timeTableController = {
    
    // Create a new timetable entry
    createTimeTable: asyncHandler(async (req, res) => {
        const { day, period, subject, startTime, endTime, teacher, room } = req.body;

        if (!day || !period || !subject || !startTime || !endTime || !teacher || !room) {
            return res.status(400).json({ message: "All fields are required" });
        }

        const timeTable = await TimeTable.create({
            day,
            period,
            subject,
            startTime,
            endTime,
            teacher,
            room
        });

        if (!timeTable) {
            return res.status(400).json({ message: "Failed to create timetable entry" });
        }

        res.status(201).json(timeTable);
    }),

    // Get all timetable entries
    getAll: asyncHandler(async (req, res) => {
        const timeTables = await TimeTable.find();
        res.status(200).json(timeTables);
    }),

    // Get timetable for a specific day
    getByDay: asyncHandler(async (req, res) => {
        const timeTables = await TimeTable.find({ day: req.params.day });

        if (!timeTables.length) {
            return res.status(404).json({ message: "No timetable found for this day" });
        }

        res.status(200).json(timeTables);
    }),

    // Update a timetable entry
    update: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const timeTable = await TimeTable.findById(req.params.id);

        if (!timeTable) {
            return res.status(404).json({ message: "Timetable entry not found" });
        }

        const updatedTimeTable = await TimeTable.findByIdAndUpdate(
            req.params.id,
            req.body,
            { new: true }
        );

        res.status(200).json(updatedTimeTable);
    }),

    // Delete a timetable entry
    delete: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const timeTable = await TimeTable.findById(req.params.id);

        if (!timeTable) {
            return res.status(404).json({ message: "Timetable entry not found" });
        }

        await timeTable.deleteOne();
        res.status(200).json({ message: "Timetable entry deleted successfully" });
    })
};

module.exports = timeTableController;
