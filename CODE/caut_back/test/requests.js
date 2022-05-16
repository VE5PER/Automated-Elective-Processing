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
