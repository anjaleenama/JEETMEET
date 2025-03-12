const asyncHandler = require('express-async-handler');
const mongoose = require('mongoose'); 
const Book = require('../model/bookModel');
require('dotenv').config();

const bookController = {
   
    getBooks: asyncHandler(async (req, res) => {
        const books = await Book.find();
        if (!books) {
            throw new Error("No books found");
        }
        res.json({
            message: "Books fetched successfully",
            books,
        });
    }),

   
    getBookById: asyncHandler(async (req, res) => {
        const { id } = req.params;
        if (!mongoose.Types.ObjectId.isValid(id)) {
            throw new Error("Invalid book ID");
        }

        const book = await Book.findById(id);
        if (!book) {
            throw new Error("Book not found");
        }

        res.json({
            message: "Book fetched successfully",
            book,
        });
    }),

    addBook: asyncHandler(async (req, res) => {
        const { name,author,category,price,rackNumber,status } = req.body;
        const newBook = await Book.create({
           name,
           author,
           category,
           price,
           rackNumber,
           status

        });

        if (!newBook) {
            throw new Error("Book details could not be inserted");
        }

        res.json({
            message: "Book inserted successfully",
            book: newBook,
        });
    }),

    
    updateBook: asyncHandler(async (req, res) => {
        const { id } = req.params;
        if (!mongoose.Types.ObjectId.isValid(id)) {
            throw new Error("Invalid book ID");
        }

        const updatedBook = await Book.findByIdAndUpdate(id, req.body, { new: true });
        if (!updatedBook) {
            throw new Error("Book not found or could not be updated");
        }

        res.json({
            message: "Book updated successfully",
            updatedBook,
        });
    }),

   
    deleteBook: asyncHandler(async (req, res) => {
        const { id } = req.params;
        if (!mongoose.Types.ObjectId.isValid(id)) {
            throw new Error("Invalid book ID");
        }

        const deletedBook = await Book.findByIdAndDelete(id);
        if (!deletedBook) {
            throw new Error("Book not found or could not be deleted");
        }

        res.json({
            message: "Book deleted successfully",
            deletedBook,
        });
    }),
};

module.exports = bookController;
