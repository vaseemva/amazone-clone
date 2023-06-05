const express=require('express');
const authRouter=express.Router();
module.exports=authRouter;
authRouter.get('/user',(req,res)=>{
res.send('hii this is auth')
})