const mongoose = require('mongoose')

const table3Schema = new mongoose.Schema({
    S_ID: {
        type: String,
        ref: 'Student',
        required: true,
    },
    ELECTIVE_ID: {
        ref: 'Elective',
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


module.exports = mongoose.model('Table3', table3Schema)