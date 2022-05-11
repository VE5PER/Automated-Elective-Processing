
const express = require('express')
const User = require('../models/student.model')
const mongoose = require('mongoose')
const router = express.Router()
const Elective = require('../models/elective.model')
const StuEle = require('../models/table3.model')
const Batch = require('../models/table1.model')
const Faculty = require('../models/faculty.model')
const Table2 = require('../models/table2.model')

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
    try{
        electiveData = await Elective.find({},)
        console.log(electiveData)
        res.json({ElectiveList: electiveData})
    } catch (error){
        console.log(error)
        res.json({status: error})
    }
})

router.post('/StudentElective',(req,res)=>{
    StuEle.findOne({S_ID:req.body.S_ID,ELECTIVE_ID:req.body.ELECTIVE_ID},(err,elec)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(elec==null){
                const elec = StuEle({
                    S_ID:req.body.S_ID,
                    ELECTIVE_ID:req.body.ELECTIVE_ID,
                })
                elec.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(taken)
                        res.json(taken)
                    }
                    
                })
            }else{

            res.json({
                message:'Already Registered'
            })   
            }
        }
    })
    
})
router.post('/takeElectives', async (req,res) =>{
    try{
        takeelectiveData = await StuEle.find({S_ID:req.body.S_ID},)
        console.log(takeelectiveData)
        res.json({ElectiveList: takeelectiveData})
    } catch (error){
        console.log(error)
        res.json({status: error})
    }
})


router.post('/changePassword',async (req,res)=> {
   const result =await User.updateOne(
        { S_ID:req.body.S_ID}, 
        { $set : {PASSWORD : req.body.newPassword}},
        {upsert: false}

       

    ).then((obj) => {
        console.log('Updated');
        res.json({  message:'Changed Successfully'})
       
  })
 .catch((err) => {
    console.log('Error: ' + err);
})

})

router.post('/addFaculty',(req,res)=>{
    Faculty.findOne({FACULTY_ID:req.body.FACULTY_ID},(err,faculty)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(faculty==null){
                const faculty = Faculty({
                    FACULTY_ID:req.body.FACULTY_ID,
                    PASSWORD:req.body.PASSWORD,
                    FACULTY_NAME: req.body.FACULTY_NAME,
                    FACULTY_DOJ: req.body.FACULTY_DOJ,
                    FACULTY_POS: req.body.FACULTY_POS,
                    USER_NAME: req.body.USER_NAME, 
                    E_MAIL: req.body.E_MAIL,

                })
                faculty.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(faculty)
                        res.json(faculty)
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
router.post('/addBatches',(req,res)=>{
    Batch.findOne({ELECTIVE_ID:req.body.ELECTIVE_ID,SEMESTER:req.body.SEMESTER},(err,batch)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(batch==null){
                const batch = Batch({
                    YEAR:req.body.YEAR,
                    SEMESTER:req.body.SEMESTER,
                    ELECTIVE_ID:req.body.ELECTIVE_ID,
                    BATCH_SIZE:req.body.BATCH_SIZE,
                    NUMBER_OF_BATCHES:req.body.NUMBER_OF_BATCHES,
                })
                batch.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(taken)
                        res.json(taken)
                    }
                    
                })
            }else{

            res.json({
                message:'Already Registered'
            })   
            }
        }
    })
    
})

router.get('/getBatches', async (req,res) =>{
    try{
        batchesData = await Batch.find({},)
        // newBatch = batchesData.map(batch => {
        //     return {
        //         SEMESTER: batch.SEMESTER,
        //         ELECTIVE_ID: batch.ELECTIVE_ID
        //     }
        // })
        // console.log(newBatch[0])
        res.json({BatchList: batchesData})
        console.log('hello')
    } catch (error){
        console.log(error)
        res.json({status: error})
    }
})

router.post('/updateSeats',async (req,res)=> {
    const resultEle =await Elective.updateOne(
         { ELECTIVE_ID:req.body.ELECTIVE_ID}, 
         { $set : {SEATS : req.body.newSeat}},
         {upsert: false}
 
        
 
     ).then((obj) => {
         console.log('Updated');
         res.json({  message:'Changed Successfully'})
        
   })
  .catch((err) => {
     console.log('Error: ' + err);
 })
 
 })

 router.post('/addSemElective',(req,res)=>{
    Table2.findOne({SEMESTER:req.body.SEMESTER},(err,t2)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(t2==null){
                const t2 = Table2({
                    YEAR:req.body.YEAR,
                    SEMESTER:req.body.SEMESTER,
                    NO_OF_ELECTIVES:req.body.NO_OF_ELECTIVES,
                })
                t2.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(taken)
                        res.json(taken)
                    }
                    
                })
            }else{

            res.json({
                message:'Already Registered'
            })   
            }
        }
    })
    
})



module.exports = router