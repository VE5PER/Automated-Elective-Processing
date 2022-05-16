process.env.NODE_ENV = 'test';
let mongoose = require("mongoose")
let Elective = require("../routes/user.routes")
let chai = require("chai");
let chaiHttp = require("chai-http");
let server = require("../index");

//AssertionStyle
let should = chai.should();

chai.use(chaiHttp)

describe('Batches', () => {

    describe("GET /getBatches", () => {
        it("It should get all the Batches entered by the Admin", (done) => {
            chai.request('http://localhost:8432')
                .get('/getBatches')
                .end((err, res) => {
                    res.should.have.status(200);
                    res.body.should.be.a('object')
                done();
                });
        });  
        it("It should not get any of the Batches", (done) => {
            chai.request('http://localhost:8432')
                .get('/getBatch')
                .end((err, res) => {
                    res.should.have.status(404);
                done();
                });
        });
    });

});

describe('Electives', () => {

    describe("GET /getElectives", () => {
        it("It should get all the Electives for different Semesters.", (done) => {
            chai.request('http://localhost:8432')
                .get('/getElectives')
                .end((err, res) => {
                    res.should.have.status(200);
                    res.body.should.be.a('object')
                done();
                });
        });  
        it("Wrong URL, Should not fetch any of the electives.", (done) => {
            chai.request('http://localhost:8432')
                .get('/getElective')
                .end((err, res) => {
                    res.should.have.status(404);
                done();
                });
        });
    });

});

describe('Seats', () => {

    describe("GET /getSeats", () => {
        it("It should get the number of seats for each semester.", (done) => {
            chai.request('http://localhost:8432')
                .get('/getSeats')
                .end((err, res) => {
                    res.should.have.status(200);
                    res.body.should.be.a('object')
                done();
                });
        });  
        it("It should not get the number of seats.", (done) => {
            chai.request('http://localhost:8432')
                .get('/getSeat')
                .end((err, res) => {
                    res.should.have.status(404);
                done();
                });
        });
    });

});
describe('Seats', () => {

    describe("GET /getSeats", () => {
        it("It should get the number of seats for each semester.", (done) => {
            chai.request('http://localhost:8432')
                .get('/getSeats')
                .end((err, res) => {
                    res.should.have.status(200);
                    res.body.should.be.a('object')
                done();
                });
        });  
        it("It should not get the number of seats.", (done) => {
            chai.request('http://localhost:8432')
                .get('/getSeat')
                .end((err, res) => {
                    res.should.have.status(404);
                done();
                });
        });
    });

});