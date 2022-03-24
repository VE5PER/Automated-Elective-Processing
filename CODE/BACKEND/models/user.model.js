const mongoose = require('mongoose')
const schema = mongoose.Schema

const newSchema = new schema({
    email:String,
    password:String
})

module.exports = mongoose.model('User', newSchema)