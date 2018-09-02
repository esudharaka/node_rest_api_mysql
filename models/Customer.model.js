'use strict';

const Customer = (sequelize, DataTypes) => {
    const Model = sequelize.define('CUSTOMER', {
        ID: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        FIRST_NAME: {
            type: DataTypes.STRING,
            required: true
        },
        LAST_NAME: {
            type: DataTypes.STRING,
            required: true
        },
        EMAIL: {
            type: DataTypes.STRING,
            required: true
        },
        PHONE: {
            type: DataTypes.STRING,
            required: true
        },
        SHIPPING_ADDRESS  : {
            type: DataTypes.STRING,
            required: true
        },
    },
        {
            tableName: 'CUSTOMER',
            timestamps: false,

        }
    );

    Model.associate = function(models){
    };

    Model.beforeSave(async (user, options) => {
    });

    Model.prototype.toWeb = function (pw) {
        let json = this.toJSON();
        return json;
    };

    return Model;
};

export {Customer}