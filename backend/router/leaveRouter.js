const express = require('express');
const leaveController = require('../controllers/leaveController');



const leaveRouter = express.Router();




leaveRouter.get("/getLeaves", leaveController.getLeaves); 
leaveRouter.get("/getLeaveById/:id", leaveController.getLeaveById); 
leaveRouter.post("/submitLeave", leaveController.submitLeave); 
leaveRouter.put("/:id", leaveController.updateLeave); 
leaveRouter.delete("/deleteLeave/:id", leaveController.deleteLeave); 




module.exports = leaveRouter;