const mongoose = require('mongoose')

const table2Schema = new mongoose.Schema({
    S_ID: {
        type: String,
        ref: 'Student',
        required: true,
    },
    COURSE_ID: {
        ref: 'Course',
        type: String,
        required: true
    },
    ENROLLMENT: {
        type: String,
        required: true
    },    
}, {
    timestamps: true
})


module.exports = mongoose.model('Table2', table2Schema)