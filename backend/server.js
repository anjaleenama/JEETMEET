const express = require('express');
const connectdb = require('./db/connectdb');
const cors = require("cors");
const http = require("http"); 
const { Server } = require("socket.io"); // Import Server from socket.io
const bookRouter = require('./router/bookRouter');

require('dotenv').config();

const app = express();
const server = http.createServer(app); // Create HTTP server for Socket.IO

// Initialize Socket.IO
app.use(cors({
  origin: "*", // Allow all origins (change to frontend URL in production)
  methods: ["GET", "POST", "PUT", "DELETE"],
  credentials: true
}));


// Connect to MongoDB
connectdb().catch((err) => {
    console.log("Database Connection Error:", err);
});

// Middleware
app.use(cors()); // Enable CORS

app.use(express.json()); // Parse JSON requests

// API Routes
app.use("/api/v1/book", bookRouter); // Use book routes

// Socket.IO Connection
io.on("connection", (socket) => {
    console.log(`User connected: ${socket.id}`);

    socket.on("sendMessage", async (data) => {
      try {
        console.log("Message received:", data);
  
        const newMessage = new Chat({
          senderId: data.senderId,
          receiverId: data.receiverId,
          message: data.message,
        });
  
        await newMessage.save(); // Save message in MongoDB
  
        io.emit("receiveMessage", data); // Broadcast to all connected users
      } catch (error) {
        console.error("Error saving message:", error);
      }
    });

    socket.on("disconnect", () => {
      console.log(`User disconnected: ${socket.id}`);
    });
});

// Start the server
const PORT = process.env.PORT || 5000;
server.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
