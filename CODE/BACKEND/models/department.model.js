const mongoose = require('mongoose')

const departmentSchema = new mongoose.Schema({
    DEPT_ID: {
        type: String,
        required: true,
    },
    DEPT_HOD: {
        type: String,
        required: true
    },
    DEPT_NAME: {
        type: String,
        required: true
    },    
}, {
    timestamps: true
})


module.exports = mongoose.model('Department', departmentSchema)