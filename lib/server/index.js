console.log('hello world')
//imports from packages
const express = require('express');
const mongose = require('mongoose');

//imports from other files

const authRouter = require('./routes/auth');

//init
const port = 5555;
const app = express();

const DB = "mongodb+srv://vaseemva:vaseem123@cluster0.bwloagt.mongodb.net/?retryWrites=true&w=majority";
//middle ware
app.use(express.json())
app.use(authRouter);

//connections

mongose.connect(DB).then(() => {
    console.log('connected to database');
}).catch((e) => {
    console.log(e);
})

app.listen(port, "0.0.0.0", () => {
    console.log(`connected at port ${port}`)
})

app.get('/vaseem', (req, res) => {
    res.json({ 'message': 'hi this is vaseem' })
})