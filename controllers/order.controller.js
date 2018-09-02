const orderService = require('../services/order.service');
const {to, toErrorResponse, toSuccessResponse} = require('../services/util.service');

const getAllItems = async (req, res) => {
    const [error, result] =  await to(orderService.getItems());
    console.log(result);
    if (error) return toErrorResponse(res, err, 422);
    return toSuccessResponse(res, {
        message: 'Fetch Items Successfully',
        items: result,
    }, 201);
};
export {
    getAllItems,
}


// curl -d  '{"firstName":"lakkhana", "lastName":"swarnamali", "email":"luxrulez@gmail.com", "phone":"07745322", "shippingAddress":"NHSL"}' -H "Content-Type: application/json" -X POST http://localhost:3001/v1/user