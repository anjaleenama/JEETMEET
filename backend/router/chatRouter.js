const express = require ('express');
const chatController = require('../controllers/chatController');



const chatRouter = express.Router()



chatRouter.post("/",chatController.sendMessage);  // Send a message
chatRouter.get("/:user1/:user2",chatController.getChatHistory);  // Get chat messages between two users
chatRouter.delete("/delete",chatController.deleteMessage);


module.exports = chatRouter




