const jwt = require('jsonwebtoken');
require('dotenv').config();

const IsAuth = (req, res, next) => {
    try {
        const { token } = req.cookies;

        if (!token) {
            return res.status(401).json({ success: false, message: "Token not found" });
        }

        const decoded = jwt.verify(token, process.env.SECRET_KEY);

        if (!decoded) {
            return res.status(401).json({ success: false, message: "Invalid token" });
        }

        req.user = decoded;
        console.log("okay");
        
        next();
    } catch (error) {
        return res.status(401).json({ success: false, message: "Authentication failed", error: error.message });
    }
};

module.exports = IsAuth;