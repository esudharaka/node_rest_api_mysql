import {dbConnection, Sequelize}from './../../models/index'


const getAllItems = () => {
    return dbConnection.query("SELECT * FROM `ITEM`", { type: Sequelize.QueryTypes.SELECT})
        .then(items => {
            return items;
        }).catch((e) => {
            console.log(e);
            throw e;
        });
};
export {
    getAllItems,
}