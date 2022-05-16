const express = require('express')
const app = express()
const port = 8432 || process.env.PORT
const cors = require('cors')
const bodyParser = require('body-parser')

const mongoose = require('mongoose')
//mongoose.connect("mongodb://localhost:27017/db1",{ useNewUrlParser: true, useUnifiedTopology: true })  //docker mongo local

mongoose.connect("mongodb://mongo:27017/db1",{ useNewUrlParser: true, useUnifiedTopology: true })  //compose for docker multi image


app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use('/',require('./routes/user.routes.js'))

app.listen(port,()=>{
    console.log('Port running on', port)
})