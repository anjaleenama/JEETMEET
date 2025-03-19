const express = require("express");
const connectdb = require("./db/connectdb");
const router = require("./router");
const cookieParser = require("cookie-parser");
const cors = require("cors");

const app = express();

// ✅ Apply Middleware
app.use(express.json());
app.use(cookieParser());

// ✅ Fix CORS issue (allow frontend requests)
app.use(cors({ origin: "http://localhost:5173", 
  optionsSuccessStatus: 200}));

// ✅ Connect to MongoDB with error handling
connectdb()
  .then(() => console.log("Database connected successfully"))
  .catch((err) => console.error("Database connection error:", err));

// ✅ API Routes
app.use("/api/v1", router);
// ✅ Start the server
app.listen(4000,()=>{
    console.log("running");
})