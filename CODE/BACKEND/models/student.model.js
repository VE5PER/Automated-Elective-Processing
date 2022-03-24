const mongoose = require('mongoose')

const studentSchema = new mongoose.Schema({
    S_ID: {
        type: String,
        required: true,
    },
    S_NAME: {
        type: String,
        required: true
    },
    YEAR: {
        type: String,
        required: true
    },
    SEMESTER: {
        type: String,
        required: true
    },    
    CLASS_NAME: {
        type: String,
        required: true
    },
    USER_NAME: {
        type: String,
        ref: 'User',
        required: true
    },
    E_MAIL: {
        type: String,
        ref: 'User',
        required: true
    }
}, {
    timestamps: true
})


module.exports = mongoose.model('Student', studentSchema)