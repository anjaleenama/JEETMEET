const asyncHandler = require("express-async-handler");
const User = require("../model/userModel");
require("dotenv").config();

const userController = {

  
  createUser: asyncHandler(async (req, res) => {
    try {
      const { name, email, avatar } = req.body;

      
      let user = await User.findOne({ email });
      if (user) return res.status(400).json({ message: "User already exists" });

      user = new User({ name, email, avatar });
      await user.save();
      res.status(201).json(user);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }),

 
  getUsers: asyncHandler(async (req, res) => {
    try {
      const users = await User.find();
      res.json(users);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }),

 
  getUserById: asyncHandler(async (req, res) => {
    try {
      const user = await User.findById(req.params.id);
      if (!user) return res.status(404).json({ message: "User not found" });
      res.json(user);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  })
};

module.exports = userController;
