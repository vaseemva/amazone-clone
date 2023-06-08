const express = require('express');
const User = require('../models/usermodel');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const auth = require('../middlewares/auth');
const authRouter = express.Router();
module.exports = authRouter;
authRouter.post('/api/signup', async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email })
        if (existingUser) {
            return res.status(400).json({
                message: "email address already exists"
            })
        }

        const hashedPassword = await bcrypt.hash(password, 8);

        let user = new User({

            email,
            password: hashedPassword,
            name,

        })
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({
            error: e.message
        })
    }
})


//signin method
authRouter.post("/api/signin", async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({
                message: "User with this email doesn't exist"
            })
        }
        const isMatch = await bcrypt.compare(password, user.password);

        if (!isMatch) {
            return res.status(400).json({
                message: "Incorrect Password"
            })
        }

        const token = jwt.sign({ id: user._id }, "passwordKey")
        res.json({ token, ...user._doc })

    } catch (e) {
        return res.status(500).json({
            error: e.message
        })
    }
})

//token is valid

authRouter.post("/tokenisvalid", async (req, res) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) return res.json(false);
        const verified = jwt.verify(token, "passwordKey")
        if (!verified) return res.json(false);

        const user = User.findById(verified.id)

        if (!user) return res.json(false);

        res.json(true);


    } catch (e) {
        res.status(500).json({ error: e.message })
    }
})

//get user data
authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({
        ...user._doc, token: req.token
    })


})