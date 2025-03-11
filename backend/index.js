const express = require('express');
const connectdb = require('./db/connectdb');
const cors = require("cors");
const  router  = require('./router');
const http = require("http"); // Import http module
const { Server } = require("socket.io"); // Import Server from socket.io
const bookRouter = require('./router/bookRouter');


const app = express()
const server = http.createServer(app); // Create HTTP server for Socket.IO
const io = new Server(server, {
  cors: {
    origin: "*", // Change this to your frontend URL in production
    methods: ["GET", "POST","PUT","DELETE"],
  },
});


connectdb().catch((err)=>{
    console.log(err);
})

app.use(cors({
  origin: "http://localhost:5173",  
  methods: ["GET", "POST","PUT","DELETE"]
}));


app.use(express.json())

app.use("/api/v1/book",bookRouter)


// Socket.IO Connection
io.on("connection", (socket) => {
    console.log(`User connected: ${socket.id}`);
  
    // Listen for messages
    socket.on("sendMessage", async (data) => {
      try {
        console.log("Message received:", data);
  
        const newMessage = new Chat({
          senderId: data.senderId,
          receiverId: data.receiverId,
          message: data.message,
        });
  
        await newMessage.save(); // Save message in MongoDB
  
        // Broadcast message to all connected users
        io.emit("receiveMessage", data);
      } catch (error) {
        console.error("Error saving message:", error);
      }
    });
  
    socket.on("disconnect", () => {
      console.log(`User disconnected: ${socket.id}`);
    });
  });


server.listen(5000,()=>{
    console.log("running");
})