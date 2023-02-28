

const bcrypt= require("bcrypt");
const { response } = require("express");

const pasdat=require ("../model/pasdata");
const Addremovsrvs =require("../services/AddRemoveService");

const userServices =require("../services/user.services");


exports.ADDj=(req,res,next)=>
{
    

    const {Journey,general_id,journey_id}=req.body;

    Addremovsrvs.ADDj({Journey,general_id,journey_id},(error,response)=>{

        if(error){
            return next(error);
        }
        return res.status(200).send({

            message:" success",
            data:response,

        });
    });

};
exports.Removej=(req,res,next)=>
{
const {Journey,general_id,journey_id}=req.body;

Addremovsrvs.Removej({Journey,general_id,journey_id},(error,response)=>{

        if(error){
            return next(error);
        }
        return res.status(200).send({

            message:" success",
            data:response,

        });
    });

};
exports.Alljourney=(req,res,next)=>
{
const {Journey,general_id,journey_id}=req.body;


Addremovsrvs.Alljourney({Journey,general_id,journey_id},(error,response)=>{

        if(error){
            return next(error);
        }
        return res.status(200).send({

           
            data:response,

        });
    });

};
exports.cardata=(req,res,next)=>
{
const {jornedata,car,}=req.body;

userServices.cardata({jornedata,car},(error,response)=>{

        if(error){
            return next(error);
        }
        return res.status(200).send({

           
            data:response,

        });
    });

};
exports.pasdata=(req,res,next)=>
{
const {tktnum,}=req.body;

Addremovsrvs.pasd(req.body,(error,response)=>{

        if(error){
            return next(error);
        }
        return res.status(200).send({

           
            data:response,

        });
    });

};
exports.Apointcar=(req,res,next)=>
{
const {tktnum,}=req.body;

Addremovsrvs.Apointcar(req.body,(error,response)=>{

        if(error){
            return next(error);
        }
        return res.status(200).send({

           
            data:response,

        });
    });

};
exports.Allcar=(req,res,next)=>
{
const{generalidnum}=req.body;

Addremovsrvs.Allcar(generalidnum,(error,response)=>{

        if(error){
            return next(error);
        }
        return res.status(200).send({
            message:" success",

           
            data:response,

        });
    });

};
exports.Allroot=(req,res,next)=>
{
  
//const{rootgeneralid}=req.body;

Addremovsrvs.Allroot(rootgeneralid,(error,response)=>{

        if(error){
            return next(error);
        }
        return res.status(200).send({
            message:" success",

           
            data:response,

        });
    });

};