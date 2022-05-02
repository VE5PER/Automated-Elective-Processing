const mongoose = require('mongoose')

const table3Schema = new mongoose.Schema({
    S_ID: {
        type: String,
        required: true,
    },
    ELECTIVE_ID: {
        type: String,
        required: true
    },  
}, {
    timestamps: true
})


module.exports = mongoose.model('Table3', table3Schema)