
const express = require('express')
const User = require('../models/student.model')
const router = express.Router()
const Elective = require('../models/elective.model')

router.post('/signup',(req,res)=>{
    User.findOne({S_ID:req.body.S_ID},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(user==null){
                const user = User({
                    S_ID:req.body.S_ID,
                    PASSWORD:req.body.PASSWORD,
                    S_NAME: req.body.S_NAME,
                    YEAR: req.body.YEAR,
                    SEMESTER: req.body.SEMESTER,
                    USER_NAME: req.body.USER_NAME, 
                    E_MAIL: req.body.E_MAIL

                })
                user.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(user)
                        res.json(user)
                    }
                    
                })
            }else{

            res.json({
                message:'ID is not available'
            })   
            }
        }
    })
    
})

router.post('/signin',(req,res)=>{
    User.findOne({S_ID:req.body.S_ID,PASSWORD:req.body.PASSWORD},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(user!=null)
            {
                res.json(user)  } 
                else{
                    res.json({
                        message:'ID or Password Incorrect'
                    }) 
                }
        }
    })
})




router.post('/addElective',(req,res)=>{
    Elective.findOne({ELECTIVE_ID:req.body.ELECTIVE_ID},(err,course)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(course==null){
                const course = Elective({
                    ELECTIVE_ID:req.body.ELECTIVE_ID,
                    ELECTIVE_PDF_LINK:req.body.ELECTIVE_PDF_LINK,
                    ELECTIVE_NAME: req.body.ELECTIVE_NAME,
                    SEATS:req.body.SEATS
                })
                course.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(course)
                        res.json(course)
                    }
                    
                })
            }else{

            res.json({
                message:'ID is not available'
            })   
            }
        }
    })
    
})

router.get('/getElectives', async (req,res) =>{
    console.log("sfdsfd")
    try{
        electiveData = await Elective.find({},)
        console.log(electiveData)
        res.json({ElectiveList: electiveData})
    } catch (error){
        console.log(error)
        res.json({status: error})
    }
})

module.exports = router