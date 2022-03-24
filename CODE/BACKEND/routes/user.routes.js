
const express = require('express')
const User = require('../models/student.model')
const router = express.Router()


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
                message:'ID is not avilable'
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
module.exports = router