'use strict';

// import Customer from './Customer.model';
import { Customer} from './Customer.model'
const fs        = require('fs');
const path      = require('path');
const Sequelize = require('sequelize');
const basename  = path.basename(__filename);
const db        = {};
const CONFIG = require('../config/config');


const dbConnection = new Sequelize(CONFIG.db_name, CONFIG.db_user, CONFIG.db_password, {
  host: CONFIG.db_host,
  dialect: CONFIG.db_dialect,
  port: CONFIG.db_port,
  operatorsAliases: false
});

db['CUSTOMER'] = Customer(dbConnection, Sequelize);


Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

const authDbConnection = ()=> {

    dbConnection.authenticate().then(() => {
        console.log('Connected to SQL database:', CONFIG.db_name);
    })
        .catch(err => {
            console.error('Unable to connect to SQL database:',CONFIG.db_name, err);
        });
};
db.dbConnection = dbConnection;
db.Sequelize = Sequelize;
db.authDbConnection = authDbConnection;

module.exports = db;

