const mongoose = require('mongoose')

const table2Schema = new mongoose.Schema({
    YEAR: {
        type: String,
        required: true,
    },
    SEMESTER: {
        type: String,
        required: true
    },
    NO_OF_ELECTIVES: {
        type: String,
        required: true
    },    
}, {
    timestamps: true
})


module.exports = mongoose.model('Table2', table2Schema)