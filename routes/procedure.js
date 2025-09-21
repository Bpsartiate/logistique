const sequelize = require('../sequelize'); // chemin vers ce fichier 
const { DataTypes } = require('sequelize');

const Procedure = sequelize.define('procedure', {
  id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
  categorie: { type: DataTypes.STRING(100), allowNull: false, unique: true },
  type_procedure: { type: DataTypes.STRING(255), allowNull: false, unique: true },
  montant_min: { type: DataTypes.DECIMAL(15, 2), allowNull: false },
  montant_max: { type: DataTypes.DECIMAL(15, 2), allowNull: true }
}, {
  tableName: 'proceduresapprovisionnement',
  timestamps: false
});

module.exports = Procedure;
