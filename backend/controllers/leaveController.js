const asyncHandler = require("express-async-handler");
const mongoose = require("mongoose");
const Leave = require("../model/leaveModel");

require("dotenv").config();

const leaveController = {
  // Get all leave applications
  getLeaves: asyncHandler(async (req, res) => {
    const leaves = await Leave.find();
    if (!leaves) {
      throw new Error("No leave applications found");
    }

    const formattedLeaves = leaves.map((leave) => ({
      id: leave._id,
      category: leave.category,
      startDate: leave.startDate,
      endDate: leave.endDate,
      reason: leave.reason,
      attachment: leave.attachment,
    }));

    res.json({
      message: "Leave applications fetched successfully",
      leaves: formattedLeaves,
    });
  }),

  // Get a single leave application by ID
  getLeaveById: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      throw new Error("Invalid leave ID");
    }

    const leave = await Leave.findById(id);
    if (!leave) {
      throw new Error("Leave application not found");
    }

    res.json({
      message: "Leave application fetched successfully",
      leave: {
        id: leave._id,
        category: leave.category,
        startDate: leave.startDate,
        endDate: leave.endDate,
        reason: leave.reason,
        attachment: leave.attachment,
      },
    });
  }),

  // Submit a new leave application
  submitLeave: asyncHandler(async (req, res) => {
    const { category, startDate, endDate, reason } = req.body;
    const attachment = req.file ? req.file.filename : null;

    const newLeave = await Leave.create({
      category,
      startDate,
      endDate,
      reason,
      attachment,
    });

    if (!newLeave) {
      throw new Error("Leave application could not be submitted");
    }

    res.json({
      message: "Leave application submitted successfully",
      leave: {
        id: newLeave._id,
        category: newLeave.category,
        startDate: newLeave.startDate,
        endDate: newLeave.endDate,
        reason: newLeave.reason,
        attachment: newLeave.attachment,
      },
    });
  }),

  // Update a leave application
  updateLeave: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      throw new Error("Invalid leave ID");
    }

    const updatedLeave = await Leave.findByIdAndUpdate(
      id,
      {
        category: req.body.category,
        startDate: req.body.startDate,
        endDate: req.body.endDate,
        reason: req.body.reason,
        attachment: req.file ? req.file.filename : req.body.attachment,
      },
      { new: true }
    );

    if (!updatedLeave) {
      throw new Error("Leave application not found or could not be updated");
    }

    res.json({
      message: "Leave application updated successfully",
      leave: {
        id: updatedLeave._id,
        category: updatedLeave.category,
        startDate: updatedLeave.startDate,
        endDate: updatedLeave.endDate,
        reason: updatedLeave.reason,
        attachment: updatedLeave.attachment,
      },
    });
  }),

  // Delete a leave application
  deleteLeave: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      throw new Error("Invalid leave ID");
    }

    const deletedLeave = await Leave.findByIdAndDelete(id);
    if (!deletedLeave) {
      throw new Error("Leave application not found or could not be deleted");
    }

    res.json({
      message: "Leave application deleted successfully",
      deletedLeaveId: deletedLeave._id,
    });
  }),
};

module.exports = leaveController;
