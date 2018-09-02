const { CUSTOMER } 	    = require('../models');
const validator     = require('validator');
const { to, TE }    = require('../services/util.service');


const createUser = async (userInfo) => {
    const  [err, customer] = await to(CUSTOMER.create(userInfo));
    if(err) TE('Error while creating user');
    return customer;
};

const getAllUsers = async ()=> {
    const  [err, users] = await to(CUSTOMER.findAll());
    if(err) TE('error while fetching users');
    return users;
};
module.exports.createUser = createUser;
module.exports.getAllUsers = getAllUsers;