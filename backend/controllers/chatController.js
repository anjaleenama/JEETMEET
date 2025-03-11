const asyncHandler = require("express-async-handler");
const mongoose = require("mongoose");
const Chat = require("../model/chatModel");
require("dotenv").config();


const chatController = {

// send message

sendMessage : asyncHandler(async (req, res) => {
    const { senderId, receiverId, message } = req.body;

    if (!mongoose.Types.ObjectId.isValid(senderId) || !mongoose.Types.ObjectId.isValid(receiverId)) {
        return res.status(400).json({ message: "Invalid user ID" });
    }

    try {
        const newChat = await Chat.create({ senderId, receiverId, message });
        await newChat.save();
        res.status(201).json({
            message: "Message sent successfully",
            chat: newChat,
        });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}),

//get chat history

 getChatHistory : asyncHandler(async (req, res) => {
    const { senderId, receiverId } = req.params;

    if (!mongoose.Types.ObjectId.isValid(senderId) || !mongoose.Types.ObjectId.isValid(receiverId)) {
        return res.status(400).json({ message: "Invalid user ID" });
    }

    try {
        const chats = await Chat.find({
            $or: [
                { senderId, receiverId },
                { senderId: receiverId, receiverId: senderId },
            ],
        }).sort({ createdAt: 1 }); // Sort messages in ascending order

        res.status(200).json(chats);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}),


// Delete a chat message
 deleteMessage : asyncHandler(async (req, res) => {
    const { messageId } = req.params;

    if (!mongoose.Types.ObjectId.isValid(messageId)) {
        return res.status(400).json({ message: "Invalid message ID" });
    }

    try {
        const deletedChat = await Chat.findByIdAndDelete(messageId);

        if (!deletedChat) {
            return res.status(404).json({ message: "Message not found" });
        }

        res.status(200).json({ message: "Message deleted successfully" });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
})
};

module.exports = chatController