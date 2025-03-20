const asyncHandler = require('express-async-handler');
const mongoose = require('mongoose');
const Subject = require('../model/subjectModel');

const subjectController  = {
  
    create: asyncHandler(async (req, res) => {
        const { className, subjectCode, subjectName, Teacher, subjectAuthor, passMark, finalMark, description } = req.body;

        const subject = await Subject.create({
            className,
            subjectCode,
            subjectName,
            Teacher,
            subjectAuthor,
            passMark,
            finalMark,
            description
        });

        if (!subject) {
            res.status(400);
            throw new Error('Invalid subject data');
        }

        res.status(201).json({ _id: subject._id, ...subject._doc });
    }),

    getAll: asyncHandler(async (req, res) => {
        const subjects = await Subject.find();
        res.status(200).json(subjects);
    }),

    getById: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            res.status(400);
            throw new Error('Invalid ObjectId format');
        }

        const subject = await Subject.findById(req.params.id);

        if (!subject) {
            res.status(404);
            throw new Error('Subject not found');
        }

        res.status(200).json(subject);
    }),

    update: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            res.status(400);
            throw new Error('Invalid ObjectId format');
        }

        const subject = await Subject.findById(req.params.id);

        if (!subject) {
            res.status(404);
            throw new Error('Subject not found');
        }
        
        const updatedSubject = await Subject.findByIdAndUpdate(req.params.id, req.body, { new: true });
        res.status(200).json(updatedSubject);
    }),

    delete: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            res.status(400);
            throw new Error('Invalid ObjectId format');
        }

        const subject = await Subject.findById(req.params.id);

        if (!subject) {
            res.status(404);
            throw new Error('Subject not found');
        }

        await subject.deleteOne();
        res.status(200).json({ message: 'Subject deleted successfully' });
    })
};

module.exports = subjectController;
