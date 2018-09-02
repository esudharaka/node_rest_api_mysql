const {to, TE} = require('../services/util.service');
import {getAllItems} from './dao/order.dao'

const getItems = async () => {
    const [error, items] = await to(getAllItems());
    if (error) TE('error while fetching items');
    return items;
};
export {
    getItems,
}