const express = require('express');
const router = express.Router();
const { Op } = require('sequelize');
const { ArticlePlanAchat, Projet, ProcedureAchat } = require('./sequelizeModels');

// Fonction pour récupérer la procédure selon catégorie et montant
async function getProcedureByCategorieAndMontant(categorie, montant) {
  const proc = await ProcedureAchat.findOne({
    where: {
      categorie: categorie,
      montant_min: { [Op.lte]: montant },
      [Op.or]: [
        { montant_max: { [Op.gte]: montant } },
        { montant_max: null }
      ]
    }
  });
  return proc ? proc.type_procedure : 'Procédure inconnue';
}

// POST créer un article lié à un projet (sur /articles_plan_achat et /)
async function createArticleHandler(req, res) {
  try {
    const {
      projet_id,
      article_nom,
      quantite,
      montant,
      categorie,
      date_limite_achat,
      procedure_achat: reqProcedureAchat
    } = req.body;

    if (!projet_id || !article_nom || !montant || !categorie || !date_limite_achat) {
      return res.status(400).json({ error: 'Champs obligatoires manquants.' });
    }

    const projet = await Projet.findByPk(projet_id);
    if (!projet) {
      return res.status(404).json({ error: 'Projet non trouvé.' });
    }

    // Validation date_limite_achat entre date_debut et date_fin projet
    const dateLimite = new Date(date_limite_achat);
    if (isNaN(dateLimite)) {
      return res.status(400).json({ error: 'Date limite d\'achat invalide.' });
    }
    if (dateLimite < new Date(projet.date_debut) || dateLimite > new Date(projet.date_fin)) {
      return res.status(400).json({ error: 'La date limite d\'achat doit être comprise entre la date de début et la date de fin du projet.' });
    }

    let procedure_achat = reqProcedureAchat;
    if (!procedure_achat) {
      procedure_achat = await getProcedureByCategorieAndMontant(categorie, montant);
      if (!procedure_achat || procedure_achat === 'Procédure inconnue') {
        procedure_achat = 'Non défini';
      }
    }

    const nouvelArticle = await ArticlePlanAchat.create({
      projet_id,
      article_nom,
      quantite,
      montant,
      categorie,
      date_limite_achat: dateLimite,
      procedure_achat
    });

    res.status(201).json(nouvelArticle);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur serveur.' });
  }
}

router.post('/articles_plan_achat', createArticleHandler);
router.post('/', createArticleHandler);

// GET tous les articles de tous projets
router.get('/', async (req, res) => {
  try {
    const articles = await ArticlePlanAchat.findAll();
    res.json(articles);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur serveur.' });
  }
});

// PUT modifier un article, avec gestion date_limite_achat
router.put('/:id', async (req, res) => {
  try {
    const article = await ArticlePlanAchat.findByPk(req.params.id);
    if (!article) {
      return res.status(404).json({ error: 'Article non trouvé.' });
    }

    const {
      article_nom,
      quantite,
      montant,
      categorie,
      date_limite_achat,
      procedure_achat: reqProcedureAchat
    } = req.body;

    if (article_nom !== undefined) article.article_nom = article_nom;
    if (quantite !== undefined) article.quantite = quantite;
    if (montant !== undefined) article.montant = montant;
    if (categorie !== undefined) article.categorie = categorie;

    if (date_limite_achat !== undefined) {
      // Valider date_limite_achat avec projet associé
      const projet = await Projet.findByPk(article.projet_id);
      const dateLimite = new Date(date_limite_achat);
      if (isNaN(dateLimite)) {
        return res.status(400).json({ error: 'Date limite d\'achat invalide.' });
      }
      if (dateLimite < new Date(projet.date_debut) || dateLimite > new Date(projet.date_fin)) {
        return res.status(400).json({ error: 'La date limite d\'achat doit être comprise entre la date de début et la date de fin du projet.' });
      }
      article.date_limite_achat = dateLimite;
    }

    if (reqProcedureAchat) {
      article.procedure_achat = reqProcedureAchat;
    } else if (categorie !== undefined || montant !== undefined) {
      // Recalculer procédure si montant/catégorie changent
      const newCategorie = categorie !== undefined ? categorie : article.categorie;
      const newMontant = montant !== undefined ? montant : article.montant;
      article.procedure_achat = await getProcedureByCategorieAndMontant(newCategorie, newMontant);
    }

    await article.save();
    res.json(article);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur serveur.' });
  }
});

// DELETE un article par id
router.delete('/:id', async (req, res) => {
  try {
    const article = await ArticlePlanAchat.findByPk(req.params.id);
    if (!article) {
      return res.status(404).json({ error: 'Article non trouvé.' });
    }
    await article.destroy();
    res.json({ message: 'Article supprimé avec succès.' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur serveur.' });
  }
});

module.exports = router;
