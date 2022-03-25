const mongoose = require('mongoose')

const electiveSchema = new mongoose.Schema({
    ELECTIVE_ID: {
        type: String,
        required: true,
    },
    ELECTIVE_PDF_LINK: {
        type: String,

    },
    ELECTIVE_NAME: {
        type: String,
        required: true,
    },
    SEATS: {
        type: String,
        required: true,
    },     
}, {
    timestamps: true
})


module.exports = mongoose.model('Elective', electiveSchema)