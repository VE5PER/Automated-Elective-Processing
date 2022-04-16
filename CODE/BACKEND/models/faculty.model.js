const mongoose = require('mongoose')

const facultySchema = new mongoose.Schema({
    FACULTY_ID: {
        type: String,
        required: true,
    },
    FACULTY_NAME: {
        type: String,
        required: true
    },
    FACULTY_DOJ: {
        type: String,
        required: true
    },
    FACULTY_POS: {
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
    }
}, {
    timestamps: true
})


module.exports = mongoose.model('Faculty', facultySchema)