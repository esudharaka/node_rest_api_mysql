const express 			= require('express');
const router 			= express.Router();

const UserController 	= require('../controllers/user.controller');
const OrderController 	= require('../controllers/order.controller');
// const CompanyController = require('../controllers/company.controller');
// const HomeController 	= require('../controllers/home.controller');

const custom 	        = require('./../middleware/custom');

const passport      	= require('passport');
const path              = require('path');



router.post('/user', UserController.create);
router.get('/users', UserController.getAllusers);
router.get('/items', OrderController.getAllItems);


//********* API DOCUMENTATION **********
router.use('/docs/api.json',            express.static(path.join(__dirname, '/../public/v1/documentation/api.json')));
router.use('/docs',                     express.static(path.join(__dirname, '/../public/v1/documentation/dist')));
module.exports = router;
