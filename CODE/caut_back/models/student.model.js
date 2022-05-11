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
    USER_NAME: {
        type: String,
        required: true
    },
    E_MAIL: {
        type: String,
        required: true
    },
    PASSWORD: {
        type: String,
        required: true
    },
    ELECTIVE_REM:{
        type: String,
        required: true
    }
}, {
    timestamps: true
})


module.exports = mongoose.model('Student', studentSchema)