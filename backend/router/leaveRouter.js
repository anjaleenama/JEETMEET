const express = require('express');
const leaveController = require('../controllers/leaveController');



const leaveRouter = express.Router();




leaveRouter.get("/getLeaves", leaveController.getLeaves); // Get all leave applications
leaveRouter.get("/getLeaveById/:id", leaveController.getLeaveById); // Get a single leave by ID
leaveRouter.post("/submitLeave", leaveController.submitLeave); // Submit a new leave application
// leaveRouter.post("/submit", upload.single("attachment"), leaveController.submitLeave);
leaveRouter.put("/:id", leaveController.updateLeave); // Update a leave application
leaveRouter.delete("/deleteLeave/:id", leaveController.deleteLeave); // Delete a leave application




module.exports = leaveRouter;