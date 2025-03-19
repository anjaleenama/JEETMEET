const express = require("express");
const connectdb = require("./db/connectdb");
const http = require("http");
const { Server } = require("socket.io");
const cors = require("cors");

const bookRouter = require("./router/bookRouter");
const leaveRouter = require("./router/leaverouter");
const examRouter = require("./router/examRouter");
const chatRouter = require("./router/chatRouter");
const userRouter = require("./router/userRouter");
const Chat = require("./model/chatModel"); // Import Chat model

require("dotenv").config();

const app = express();
const server = http.createServer(app); // Create HTTP server for Socket.IO

// ✅ Move CORS middleware above all routes
app.use(cors({ origin: "http://localhost:3000", credentials: true }));

// ✅ Middleware for JSON parsing
app.use(express.json());

// ✅ Initialize Socket.IO with the correct CORS origin
const io = new Server(server, {
  cors: {
    origin: "http://localhost:3000", // ✅ Fix this (frontend origin)
    methods: ["GET", "POST", "PUT", "DELETE"],
  },
});

// ✅ Connect to MongoDB
connectdb().catch((err) => {
  console.log("Database Connection Error:", err);
});

// ✅ API Routes
app.use("/api/v1/book", bookRouter);
app.use("/api/v1/leave", leaveRouter);
app.use("/api/v1/exam", examRouter);
app.use("/api/v1/chat", chatRouter);
app.use("/api/v1/user", userRouter);

// ✅ Socket.IO Connection
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

      io.emit("receiveMessage", newMessage); // Broadcast to all connected users
    } catch (error) {
      console.error("Error saving message:", error);
    }
  });

  socket.on("disconnect", () => {
    console.log(`User disconnected: ${socket.id}`);
  });
});

// ✅ Start the server
const PORT = process.env.PORT || 4000;
server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
