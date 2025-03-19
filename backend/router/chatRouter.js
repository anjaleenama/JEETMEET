const express = require("express");
const chatController = require("../controllers/chatController");


const chatRouter = express.Router();

chatRouter.post("/", chatController.sendMessage);  // Send a message
chatRouter.get("/:senderId/:receiverId", chatController.getChatHistory);  // Get chat messages between two users
chatRouter.delete("/:messageId", chatController.deleteMessage);  // Delete a specific message
chatRouter.all("/all",chatController.getAllChats);

module.exports = chatRouter;
