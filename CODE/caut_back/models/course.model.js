const mongoose = require('mongoose')

const courseSchema = new mongoose.Schema({
    COURSE_ID: {
        type: String,
        required: true,
    },
    SEMESTER: {
        type: String,
        required: true
    },
    CREDITS: {
        type: String,
        required: true
    },
    COURSE_NAME: {
        type: String,
        required: true,
    },    
}, {
    timestamps: true
})


module.exports = mongoose.model('Course', courseSchema)