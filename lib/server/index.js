console.log('hello world')
//imports from packages
const express  = require('express');

//imports from other files

const authRouter=require('./routes/auth');

//init
const port=3000;
const app=express();

//middle ware
app.use(authRouter);

app.listen(port,"0.0.0.0",()=>{
    console.log(`connected at port ${port}`)
})

app.get('/vaseem',(req,res)=>{
res.json({'message':'hi this is vaseem'})
})