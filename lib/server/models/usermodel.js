const mongoose = require('mongoose');
var validator = require("email-validator");

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validator: {
            validator: (value) => {
                const re =
                    /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);

                // Test the email against the pattern

            },
            message: "please enter a valid email"
        }
    },
    password: {
        required: true,
        type: String,
        validator: {
            validator: (value) => {
                return value > 5
            },
            message: "please enter a long password"
        }

    },
    address: {

        type: String,
        default: ''
    },
    type: {

        type: String,
        default: 'user'
    },
})

const User = mongoose.model('User', userSchema);
module.exports = User;