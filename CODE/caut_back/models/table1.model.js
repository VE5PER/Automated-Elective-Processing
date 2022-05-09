const mongoose = require('mongoose')

const table1Schema = new mongoose.Schema({
    YEAR: {
        type: String,
        required: true,
    },
    SEMESTER: {
        type: String,
        required: true
    },
    ELECTIVE_ID: {
        type: String,
        required: true
    },
    BATCH_SIZE: {
        type: String,
        required: true
    },
    NUMBER_OF_BATCHES: {
        type: String,
        required: true
    },      
}, {
    timestamps: true
})


module.exports = mongoose.model('Table1', table1Schema)