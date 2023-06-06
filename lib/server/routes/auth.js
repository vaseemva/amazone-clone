const express = require('express');
const User = require('../models/usermodel');
const bcrypt = require('bcrypt');
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