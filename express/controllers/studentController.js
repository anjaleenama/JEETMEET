const asyncHandler = require("express-async-handler");
const mongoose = require("mongoose");
const Student = require("../model/studentSchema");
const bcrypt = require("bcrypt");
const Parent = require("../model/parentSchema"); // Ensure consistent naming
const Notification = require("../model/notificationSchema");
const jwt=require("jsonwebtoken");
const Assignment = require("../model/assignmentSchema");
const Teacher = require("../model/teacherSchema");
const nodemailer = require("nodemailer");


const studentController = {
    register: asyncHandler(async (req, res) => {
        const { 
            email, 
            password, 
            name, 
            profile_image, 
            classes, 
            division, 
            roll_number, 
            dob, 
            parent_id, 
            secondary_phone, 
            address, 
            place, 
            post_code, 
            blood_group, 
            state, 
            country, 
            natonality, 
            register_number,
            username,
            gender,
            phone // Add phone field here
        } = req.body;
    
        // Check if all required fields are provided, including username, gender, and phone
        if (!email || !password || !name || !profile_image || !classes || !division || !register_number || !roll_number || !dob || !parent_id || !username || !gender || !phone) {
            return res.status(400).json({ message: "Incomplete data" });
        }
    
        // Validate parent_id format
        if (!mongoose.Types.ObjectId.isValid(parent_id)) {
            return res.status(400).json({ message: "Invalid parent_id format" });
        }
    
        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 12);
    
        // Create a new student with the provided data, including username, gender, and phone
        const newStudent = await Student.create({
            email,
            password: hashedPassword,
            name,
            profile_image,
            classes,
            division,
            roll_number,
            dob,
            parent_id: new mongoose.Types.ObjectId(parent_id),
            secondary_phone,
            address,
            place,
            post_code,
            blood_group,
            state,
            country,
            natonality,
            username,
            register_number,
            gender,
            phone // Include phone in the new student object
        });
    
        // Check if the student was successfully created
        if (!newStudent) {
            return res.status(500).json({ message: "Registration failed" });
        }
    
        // Return success response with the new student data
        res.status(201).json({ message: "Registration successful", student: newStudent });
    }),

    addParent: asyncHandler(async (req, res) => {
        const { name, email, phone, address } = req.body;

       
        const existingParent = await Parent.findOne({ email });
        if (existingParent) {
            return res.status(400).json({ message: "Parent already exists" });
        }

        const newParent = await Parent.create({
            name,
            email,
            phone,
            address
        });

        if (!newParent) {
            return res.status(500).json({ message: "Failed to add parent" });
        }

        res.status(201).json({ message: "Parent added successfully", parent: newParent });
    }),
    dashBoard: asyncHandler(async (req, res) => {
        
    
        const { id } = req.user;
    
        // Check if required fields are provided
        if (!id ) {
            return res.status(400).json({ message: "id and email are required" });
        }
    
        try {
            // Fetch student details
            const studentDetails = await Student.findOne({ _id:id });
    
            if (!studentDetails) {
                return res.status(404).json({ message: "Student not found" });
            }
    
            // Fetch notifications for the student
            const notifications = await Notification.find();
    
            // Send response with student details and notifications
            res.status(200).json({
                student: studentDetails,
                notifications: notifications,
            });
    
        } catch (error) {
            console.error("Dashboard error:", error);
            res.status(500).json({ message: "Server error", error: error.message });
        }
    }),
    
    insertNotification: asyncHandler(async (req, res) => {
        const { title, message, type } = req.body;
    
        // Validate required fields
        if (!title || !message) {
            return res.status(400).json({ message: "title and message are required" });
        }
    
        try {
            // Create a new notification (without user_id)
            const newNotification = await Notification.create({
                title,
                message,
                type: type || "info", // Default type is "info"
            });
    
            // Send success response
            res.status(201).json({
                message: "Notification added successfully",
                notification: newNotification,
            });
    
        } catch (error) {
            console.error("Failed to add notification:", error);
            res.status(500).json({ message: "Failed to add notification", error: error.message });
        }
    }),
    login : asyncHandler(async (req, res) => {
        const { username, password } = req.body;

        
        if (!process.env.SECRET_KEY) {
            console.error("SECRET_KEY is not defined in the environment variables.");
            return res.status(500).json({ message: "Internal server error" });
        }else{
            console.log(process.env.SECRET_KEY);
        }


    
        // Check if username and password are provided
        if (!username || !password) {
            return res.status(400).json({ message: "Incomplete data" });
        }
    
        // Find the user by username
        const UserDetails = await Student.findOne({ username });
        if (!UserDetails) {
            return res.status(404).json({ message: "User not found" });
        }
    
        // Compare the provided password with the stored hashed password
        const isMatch = await bcrypt.compare(password, UserDetails.password);
        if (!isMatch) {
            return res.status(401).json({ message: "Invalid username or password" });
        }
    
        // Create a JWT token
        const payload = {
            username: UserDetails.username,
            id: UserDetails._id
        };
    
        const token = jwt.sign(payload, process.env.SECRET_KEY);
    
        // Set the token in a cookie
        res.cookie("token", token, {
            httpOnly: true, // Prevents client-side JavaScript from accessing the cookie
            maxAge: 24 * 60 * 60 * 1000, // 1 day in milliseconds
             // Ensures the cookie is only sent over HTTPS in production// Prevents the cookie from being sent with cross-site requests
        });
    
        // Send a success response
        res.status(200).json({ message: "Login successful", token });
    }),
    profile:asyncHandler(async(req,res)=>{
        const {id}=req.user
        console.log(req.user);
        
        if(!id){throw new Error("Incomplete data")}
        const userDetails=await Student.findOne({_id:id})
        if(!userDetails){throw new Error("User not found")}

        res.status(200).send(userDetails)
    }),
    
    

    
     addAssignment : asyncHandler(async (req, res) => {
      const { title, dueDate, description, assignedBy, classes, division, subject, gradeLevel, instructions, resources } = req.body;  // Include new fields
    
      
      if (!title || !dueDate || !assignedBy || !classes || !division) {
        res.status(400); 
        throw new Error('Please provide all required fields: title, dueDate, assignedBy, classes, and division.');
      }
    
      const insertAssignment = await Assignment.create({
        title,
        dueDate,
        description,
        assignedBy,
        classes,
        division,
        subject,
        gradeLevel,
        instructions,
        resources,
      });
    
      if (!insertAssignment) {
        res.status(500); 
        throw new Error("Failed to create assignment."); 
      }
    
      res.status(201).json(insertAssignment); 
    }),
    getAssignments: asyncHandler(async (req, res) => {
        try {
            const studentId = req.user.id; 
            console.log(studentId);
           
            // Convert studentId to ObjectId
            if (!mongoose.Types.ObjectId.isValid(studentId)) {
                res.status(400);
                throw new Error('Invalid student ID');
            }
            
            const student = await Student.findOne({ _id: new mongoose.Types.ObjectId(studentId) });
            if (!student) {
                res.status(404);
                throw new Error('Student not found');
            }
    
            console.log(student.classes);
    
            const assignments = await Assignment.find({ classes: student.classes });
            console.log(assignments);
    
            if (!assignments || assignments.length === 0) {
                res.status(404);
                throw new Error('No assignments found for your class');
            }
    
            res.status(200).json(assignments);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    }),
    createTeacher: asyncHandler(async (req, res) => {
        const { name, subjects, department, classes } = req.body;
    
        if (!name || !subjects || subjects.length === 0) {
            res.status(400);
            throw new Error('Please provide name and at least one subject');
        }
    
        const newTeacher = await Teacher.create({
            name,
            subjects: Array.isArray(subjects) ? subjects : [subjects], // Ensure it's an array
            classes,
            department
        });
    
        res.status(201).json(newTeacher);
    }),
    
      getTeachersByClass : asyncHandler(async (req, res) => {
        const { id } = req.user;
    
        // Find student by ID
        const findStudent = await Student.findOne({ _id: id });
        if (!findStudent) {
            throw new Error("Student not found");
        }
    
        // Get student's class
        const studentClass = findStudent.classes;
    
        // Find teachers associated with the class
        const teachers = await Teacher.find({ classes: studentClass });
    
        if (!teachers || teachers.length === 0) {
            throw new Error("No teachers found for this class.");
        }
    
        console.log("Fetched Teachers:", teachers); // Debugging log
    
        // Group teachers by subject
        const teachersBySubject = {};
    
        teachers.forEach(teacher => {
            if (!teacher.subjects) {
                console.warn(`Teacher ${teacher.name} has no subjects field.`);
                return; // Skip this teacher
            }
    
            if (!Array.isArray(teacher.subjects)) {
                console.warn(`Teacher ${teacher.name} has an invalid subjects format.`);
                return; // Skip this teacher
            }
    
            teacher.subjects.forEach(subject => {
                if (!teachersBySubject[subject]) {
                    teachersBySubject[subject] = [];
                }
                teachersBySubject[subject].push(teacher);
            });
        });
    
        console.log("Grouped Teachers by Subject:", teachersBySubject); // Debugging log
    
        res.status(200).json(teachersBySubject);
    }),
    calender: asyncHandler(async (req, res) => {
        const { id } = req.user;
        if (!id) {
            throw new Error("User is not logged in");
        }
    
        const student = await Student.findOne({ _id: id });
        if (!student) {
            throw new Error("Student not found");
        }
    
        const classStudent = student.classes;
    
        const assignments = await Assignment.find({ classes: classStudent });
    
        if (!assignments || assignments.length === 0) {
            throw new Error("No assignments found");
        }
    
        console.log(assignments);
    
        // Extract separate date and time
        const formattedDates = assignments.map((assignment) => {
            const dateObj = new Date(assignment.dueDate);
            return {
                date: dateObj.toISOString().split("T")[0], // YYYY-MM-DD
                time: dateObj.toTimeString().split(" ")[0] // HH:MM:SS
            };
        });
    
        console.log(formattedDates);
        res.status(200).json(formattedDates);
    }) ,
    forgotPassword: asyncHandler(async (req, res) => {
        try {
            console.log("🔹 Forgot Password Request Received");
    
            const { email } = req.body;
            console.log(`📧 Email Received: ${email}`);
    
            if (!email) {
                console.error("❌ Error: Email is missing from request");
                return res.status(400).json({ error: "Email is required" });
            }
    
            // Find student by email
            const user = await Student.findOne({ email }).lean();
            if (!user) {
                console.error(`❌ Error: No user found with email ${email}`);
                return res.status(404).json({ error: "User not found" });
            }
    
            console.log(`✅ User Found: ${user.email}`);
    
            // Generate Reset Token (Valid for 1 hour)
            let resetToken;
            try {
                resetToken = jwt.sign({ id: user._id }, process.env.SECRET_KEY, { expiresIn: "1h" });
                console.log("🔑 Reset Token Generated Successfully");
            } catch (jwtError) {
                console.error("❌ JWT Token Generation Error:", jwtError.message);
                return res.status(500).json({ error: "Failed to generate reset token" });
            }
    
            // Construct Reset URL for Frontend (Include email as a query parameter)
            const resetUrl = `http://localhost:5173/reset-password?token=${resetToken}&email=${email}`;
            console.log(`🔗 Reset URL: ${resetUrl}`);
    
            // Configure Nodemailer Transporter
            const transporter = nodemailer.createTransport({
                service: "gmail",
                auth: {
                    user: process.env.EMAIL_USER,
                    pass: process.env.EMAIL_PASS
                }
            });
    
            console.log("📨 Nodemailer Transporter Configured");
    
            // Email Content
            const mailOptions = {
                from: process.env.EMAIL_USER,
                to: user.email,
                subject: "Password Reset Request",
                text: `Click the link below to reset your password:\n\n${resetUrl}\n\nThis link expires in 1 hour.`,
            };
    
            console.log("📬 Sending Email...");
    
            // Send Email
            try {
                await transporter.sendMail(mailOptions);
                console.log("✅ Email Sent Successfully!");
            } catch (emailError) {
                console.error("❌ Error Sending Email:", emailError.message);
                return res.status(500).json({ error: "Failed to send reset email" });
            }
    
            return res.status(200).json({ message: "Password reset email sent successfully" });
    
        } catch (error) {
            console.error("❌ General Error:", error);
            return res.status(500).json({ error: error.toString() });
        }
    }),
    
    // ────────────────────────────────────────────────────────────
    // RESET PASSWORD - VERIFY TOKEN & UPDATE PASSWORD
    // ────────────────────────────────────────────────────────────
    resetPassword: asyncHandler(async (req, res) => {
        try {
            console.log("🔹 Reset Password Request Received");
            console.log("🔹 Full Request Body:", req.body);
            console.log("🔹 Query:", req.query);
            console.log("🔹 Params:", req.params);

    
            // Extract token and email from query parameters
            const { token } = req.params;
            const { newPassword,email } = req.body;
    
            // Validate token, email, and new password
            if (!token) {
                console.error("❌ Error: Reset token is missing");
                return res.status(400).json({ error: "Reset token is required" });
            }
    
            if (!email) {
                console.error("❌ Error: Email is missing");
                return res.status(400).json({ error: "Email is required" });
            }
    
            if (!newPassword || newPassword.length < 6) {
                console.error("❌ Error: Password is missing or too short");
                return res.status(400).json({ error: "New password must be at least 6 characters long" });
            }
    
            let decoded;
            try {
                decoded = jwt.verify(token, process.env.SECRET_KEY);
                console.log("🔑 Token Verified Successfully:", decoded);
            } catch (err) {
                console.error("❌ Error: Invalid or expired token");
                return res.status(400).json({ error: "Invalid or expired token" });
            }
    
            // Find user by ID from token payload
            const user = await Student.findById(decoded.id);
            console.log("decoded", decoded.id);
    
            if (!user) {
                console.error("❌ Error: No user found with given token");
                return res.status(404).json({ error: "User not found" });
            }
    
            // Verify that the email matches the user's email
            if (user.email !== email) {
                console.error("❌ Error: Email does not match the user's email");
                return res.status(400).json({ error: "Invalid email" });
            }
    
            // Hash the new password and update user record
            const salt = await bcrypt.genSalt(10);
            user.password = await bcrypt.hash(newPassword, salt);
    
            // Update user in the database (without re-saving the whole object)
            await Student.updateOne({ _id: user._id }, { $set: { password: user.password } });
    
            console.log("✅ Password Reset Successfully!");
            return res.status(200).json({ message: "Password reset successfully!" });
    
        } catch (error) {
            console.error("❌ General Error:", error);
            return res.status(500).json({ error: error.toString() });
        }
    }),
    
};

module.exports = studentController;
