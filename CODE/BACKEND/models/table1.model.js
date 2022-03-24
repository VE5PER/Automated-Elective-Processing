const mongoose = require('mongoose')

const table1Schema = new mongoose.Schema({
    ELECTIVE_ID: {
        type: String,
        ref: 'Elective',
        required: true,
    },
    DEPT_ID: {
        type: String,
        ref:'Department',
        required: true
    },
    SEMESTER: {
        type: String,
        required: true
    },    
}, {
    timestamps: true
})


module.exports = mongoose.model('Table1', table1Schema)