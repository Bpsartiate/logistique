const { Model, DataTypes } = require('sequelize');
const sequelize = require('../sequelize');

class Projet extends Model {}

Projet.init({
  id: {
    type: DataTypes.BIGINT.UNSIGNED,
    primaryKey: true,
    autoIncrement: true,
  },
  nom: {
    type: DataTypes.STRING(255),
    allowNull: false,
  },
  bailleur: {
    type: DataTypes.STRING(255),
    allowNull: false,
  },
  date_debut: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  date_fin: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  budget: {
    type: DataTypes.DECIMAL(15, 2),
    allowNull: false,
  },
  description: {
    type: DataTypes.TEXT,
    allowNull: true,
  }
}, {
  sequelize,
  modelName: 'Projet',
  tableName: 't_projet',
  timestamps: false,
});

module.exports = Projet;
