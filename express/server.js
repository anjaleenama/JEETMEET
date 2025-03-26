const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const dotenv = require("dotenv");

dotenv.config(); // Load environment variables

const app = express();

// Middleware
app.use(express.json()); // Parse JSON requests
 // Enable CORS for frontend requests
app.use(cors({
  origin: "http://localhost:5173",
  methods: ["GET", "POST", "PUT", "DELETE"],
  allowedHeaders: ["Content-Type", "Authorization"]
}));

// Connect to MongoDB
mongoose
  .connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("✅ MongoDB Connected"))
  .catch((err) => console.log("❌ MongoDB Connection Error:", err));

// Routes
app.use("/api/v1/event", require("./router/eventRouter")); // Import event routes
app.use("/api/v1/test", require ("./router/assignmentRouter"));
app.use("/api/v1/menu", require("./router/menuRouter"))
app.use("/api/v1/requestBook", require("./router/requestBookRoutes"))
app.use("/api/v1/attendance", require("./router/attendanceRouter"))
app.use("/api/v1/timetable", require("./router/timeTableRouter"))
app.use("/api/v1/subject", require("./router/subjectRouter"))

// Server Start
const PORT = process.env.PORT || 5001;
app.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));
