const jwt=require("jsonwebtoken")

const isAuth=((req,res,next)=>{
        const {token}=req.cookies
        if(!token){
            res.send("no token found")
        }
        const decode=jwt.verify(token,process.env.SECRET_KEY)
        if(!decode){
            throw new Error("not match")
        }
        req.user=decode
        next()
})

module.exports=isAuth