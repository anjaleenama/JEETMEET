const jwt =require("jsonwebtoken")
require("dotenv").config()
const auth=((req,res,next)=>{
    const {token} =req.cookies

    if (!token) {
        throw new Error("Token not Found");
        
    }
    
    const decoded= jwt.verify(token,process.env.JWT_SECRET_KEY)

    if (!decoded) {
        throw new Error("Invalid Token");
        
    }
    req.user = decoded

    next()
})

module.exports = auth