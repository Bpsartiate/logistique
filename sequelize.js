const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('c1743910c_aurorardc', 'root', 'aurora@2021RDC', {
  host: 'localhost',
  dialect: 'mysql',
  logging: false, // à true si tu veux voir les requêtes SQL dans la console
  pool: {
    max: 10,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
});

module.exports = sequelize;
