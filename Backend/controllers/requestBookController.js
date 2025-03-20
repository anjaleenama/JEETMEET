const asyncHandler = require('express-async-handler');
const mongoose = require('mongoose');
const RequestBook = require('../model/requestBookModel');

const requestBookController = {
    
    // Create a new book request
    create: asyncHandler(async (req, res) => {
        const { name, category, author, price, status, rackNo, subject } = req.body;

        const bookRequest = await RequestBook.create({
            name,
            category,
            author,
            price,
            status: status || "Available",
            rackNo,
            subject
        });

        if (!bookRequest) {
            return res.status(400).json({ message: "Failed to request book" });
        }

        res.status(201).json(bookRequest);
    }),

    // Get all book requests
    getAll: asyncHandler(async (req, res) => {
        const bookRequests = await RequestBook.find();
        res.status(200).json(bookRequests);
    }),

    // Get a single book request by ID
    getById: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const bookRequest = await RequestBook.findById(req.params.id);

        if (!bookRequest) {
            return res.status(404).json({ message: "Book request not found" });
        }

        res.status(200).json(bookRequest);
    }),

    // Update book request (e.g., change status)
    update: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const bookRequest = await RequestBook.findById(req.params.id);

        if (!bookRequest) {
            res.status(404);
            throw new Error("Book request not found");
        }

        const updatedRequest = await RequestBook.findByIdAndUpdate(
            req.params.id,
            req.body,
            { new: true }
        );

        res.status(200).json(updatedRequest);
    }),

    // Delete book request
    delete: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
            return res.status(400).json({ message: "Invalid ObjectId format" });
        }

        const bookRequest = await RequestBook.findById(req.params.id);

        if (!bookRequest) {
            res.status(404);
            throw new Error("Book request not found");
        }

        await bookRequest.deleteOne();
        res.status(200).json({ message: "Book request deleted successfully" });
    })
};

module.exports = requestBookController;
