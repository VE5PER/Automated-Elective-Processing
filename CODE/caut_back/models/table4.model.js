const mongoose = require('mongoose')

const table4Schema = new mongoose.Schema({
    FACULTY_ID: {
        ref:'Faculty',
        type: String,
        required: true,
    },
    SEMESTER: {
        type: String,
        required: true
    },
    COURSE_ID: {
        ref:'Course',
        type: String,
        required: true
    },
    ELECTIVE_ID: {
        ref:'Elective',
        type: String,
        required: true
    },    
}, {
    timestamps: true
})


module.exports = mongoose.model('Table4', table4Schema)