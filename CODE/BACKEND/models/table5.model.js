const mongoose = require('mongoose')

const table5Schema = new mongoose.Schema({
    S_ID: {
        ref:'Student',
        type: String,
        required: true,
    },
    FACULTY_ID: {
        ref:'Faculty',
        type: String,
        required: true
    },
    DEPT_ID: {
        ref:'Department',
        type: String,
        required: true
    },  
}, {
    timestamps: true
})


module.exports = mongoose.model('Table5', table5Schema)