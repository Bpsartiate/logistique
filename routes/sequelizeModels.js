const sequelize = require('../sequelize'); // Configuration Sequelize

const Projet = require('./projet');            // Modèle Projet
const ArticlePlanAchat = require('./planAchatArt');  // Modèle Article plan achat (renommer si possible pour plus de clarté)
const ProcedureAchat = require('./procedure');  // Modèle Procédure achat, si utilisé

// Associations Sequelize
ArticlePlanAchat.belongsTo(Projet, { foreignKey: 'projet_id' });
Projet.hasMany(ArticlePlanAchat, { foreignKey: 'projet_id', as: 'articles' });

module.exports = {
  sequelize,
  Projet,
  ArticlePlanAchat,
  ProcedureAchat,
};
