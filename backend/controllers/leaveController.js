const asyncHandler = require("express-async-handler");
const mongoose = require("mongoose");
const Leave = require("../model/leaveModel");

require("dotenv").config();

const leaveController = {
  getLeaves: asyncHandler(async (req, res) => {
    const leaves = await Leave.find();
    if (!leaves || leaves.length === 0) {
      return res.status(404).json({ message: "No leave applications found" });
    }
    res.json({
      message: "Leave applications fetched successfully",
      leave: leaves,
    });
  }),

  getLeaveById: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: "Invalid leave ID" });
    }

    const leave = await Leave.findById(id);
    if (!leave) {
      return res.status(404).json({ message: "Leave application not found" });
    }

    res.json({
      message: "Leave application fetched successfully",
      leave: leave,
    });
  }),

  submitLeave: asyncHandler(async (req, res) => {
    const { name, category, startDate, endDate, days, reason } = req.body;
    const attachment = req.file ? req.file.filename : null;

    if (!name || !category || !startDate || !endDate || !days || !reason) {
      return res.status(400).json({ message: "All fields are required" });
    }

    if (days <= 0) {
      return res.status(400).json({ message: "Days must be at least 1" });
    }

    const newLeave = await Leave.create({
      name,
      category,
      startDate,
      endDate,
      days,
      reason,
      attachment,
    });

    res.status(201).json({
      message: "Leave application submitted successfully",
      leave: newLeave,
    });
  }),

  updateLeave: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: "Invalid leave ID" });
    }

    const updatedLeave = await Leave.findByIdAndUpdate(id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!updatedLeave) {
      return res.status(404).json({
        message: "Leave application not found or could not be updated",
      });
    }

    res.json({
      message: "Leave application updated successfully",
      leave: updatedLeave,
    });
  }),

  deleteLeave: asyncHandler(async (req, res) => {
    const { id } = req.params;
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: "Invalid leave ID" });
    }

    const deletedLeave = await Leave.findByIdAndDelete(id);
    if (!deletedLeave) {
      return res.status(404).json({
        message: "Leave application not found or could not be deleted",
      });
    }

    res.json({
      message: "Leave application deleted successfully",
      deletedLeaveId: deletedLeave._id,
    });
  }),
};

module.exports = leaveController;
