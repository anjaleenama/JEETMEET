const asyncHandler = require('express-async-handler');
const mongoose = require('mongoose');
const Assignment = require('../models/assignmentModel');

const assignmentController = {

    create: asyncHandler(async (req, res) => {
        const { className, academicYear, category, deadline, subject, description, attachment } = req.body;

        const assignment = await Assignment.create({
            className,
            academicYear,
            category,
            deadline,
            subject,
            description,
            attachment
        });

        if (!assignment) {
            return res.status(400).json({ message: "Failed to create assignment" });
        }

        res.status(201).json(assignment);
    }),

    getAll: asyncHandler(async (req, res) => {
        const assignments = await Assignment.find();
        res.status(200).json(assignments);
    }),

    getById: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const assignment = await Assignment.findById(req.params.id);

        if (!assignment) {
            return res.status(404).json({ message: "Assignment not found" });
        }

        res.status(200).json(assignment);
    }),

    update: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const assignment = await Assignment.findById(req.params.id);

        if(!assignment){
            res.status(404);
            throw new Error('Assignment not found')
        }

        const updatedAssignment = await Assignment.findByIdAndUpdate(
            req.params.id,
            req.body,
            { new: true}
        );
        res.status(200).json(updatedAssignment);
    }),

    delete: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const assignment = await Assignment.findById(req.params.id);

        if(!assignment){
            res.status(404);
            throw new Error('Assignment not found');
        }

        await assignment.deleteOne();
        res.status(200).json({ message: "Assignment deleted successfully" });
    })
};

module.exports = assignmentController;
