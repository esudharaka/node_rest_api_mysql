import {createUser, getAllUsers} from '../services/user.service'
const {to, toErrorResponse, toSuccessResponse} = require('../services/util.service');

const create = async (req, res) => {
    let err, user;
    const data = req.body;
    const userInfo = {
        FIRST_NAME: data.firstName,
        LAST_NAME: data.lastName,
        EMAIL: data.email,
        PHONE: data.phone,
        SHIPPING_ADDRESS: data.shippingAddress
    };
    [err, user] = await to(createUser(userInfo));
    if (err) return toErrorResponse(res, err, 422);
    return toSuccessResponse(res, {
        message: 'Successfully created new user.',
        user: user.toWeb(),
    }, 201);
};

const getAllUsersFromDb = async (req, res) => {
    let err, users;
    [err, users] = await to(getAllUsers());
    if (err) return toErrorResponse(res, err, 422);
    return toSuccessResponse(res, {
        message: 'Successfully created new user.',
        users: users,
    }, 201);
};
module.exports.create = create;
module.exports.getAllusers = getAllUsersFromDb;


// curl -d  '{"firstName":"lakkhana", "lastName":"swarnamali", "email":"luxrulez@gmail.com", "phone":"07745322", "shippingAddress":"NHSL"}' -H "Content-Type: application/json" -X POST http://localhost:3001/v1/user