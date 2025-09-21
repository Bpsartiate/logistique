const { Model, DataTypes } = require('sequelize');
const sequelize = require('../sequelize');
const Projet = require('./projet');

class ArticlePlanAchat extends Model {}

ArticlePlanAchat.init({
  id: {
    type: DataTypes.BIGINT.UNSIGNED,
    primaryKey: true,
    autoIncrement: true,
  },
  article_nom: {
    type: DataTypes.STRING(255),
    allowNull: false,
  },
  montant: {
    type: DataTypes.DECIMAL(15, 2),
    allowNull: false,
  },
  procedure_achat: {
    type: DataTypes.STRING(255),
    allowNull: true,
  },
  projet_id: {
    type: DataTypes.BIGINT.UNSIGNED,
    allowNull: false,
  },
  categorie: {
    type: DataTypes.STRING(255),
    allowNull: false,
  },
  date_limite_achat: {
    type: DataTypes.DATEONLY,  // Date au format YYYY-MM-DD
    allowNull: false,
  }
}, {
  sequelize,
  modelName: 'ArticlePlanAchat',
  tableName: 't_plan_achat_article',
  timestamps: false,
});

module.exports = ArticlePlanAchat;
