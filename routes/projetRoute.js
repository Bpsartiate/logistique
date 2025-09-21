
const express = require('express');
const router = express.Router();
const { Projet, ArticlePlanAchat } = require('./sequelizeModels');

// GET tous les projets avec articles
router.get('/', async (req, res) => {
  try {
    const projets = await Projet.findAll({
      include: [{ model: ArticlePlanAchat, as: 'articles' }]
    });
    res.json(projets);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});
// GET articles d'un projet par id
router.get('/:id/articles', async (req, res) => {
  try {
    const projet = await Projet.findByPk(req.params.id, {
      include: [{ model: ArticlePlanAchat, as: 'articles' }]
    });
    if (!projet) return res.status(404).json({ error: 'Projet non trouvé' });
    res.json(projet.articles);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET projet par id avec articles
router.get('/:id', async (req, res) => {
  try {
    const projet = await Projet.findByPk(req.params.id, {
      include: [{ model: ArticlePlanAchat, as: 'articles' }]
    });
    if (!projet) return res.status(404).json({ error: 'Projet non trouvé' });
    res.json(projet);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// POST création projet
router.post('/', async (req, res) => {
  try {
    const { nom, bailleur, date_debut, date_fin, budget, description } = req.body;

    if (!nom || typeof nom !== 'string' || nom.trim() === '') {
      return res.status(400).json({ error: 'Le champ "nom" est obligatoire et doit être une chaîne non vide.' });
    }
    if (!bailleur || typeof bailleur !== 'string' || bailleur.trim() === '') {
      return res.status(400).json({ error: 'Le champ "bailleur" est obligatoire et doit être une chaîne non vide.' });
    }
    if (!date_debut || !/^\d{4}-\d{2}-\d{2}$/.test(date_debut)) {
      return res.status(400).json({ error: 'Le champ "date_debut" est obligatoire et doit être au format AAAA-MM-JJ.' });
    }
    if (!date_fin || !/^\d{4}-\d{2}-\d{2}$/.test(date_fin)) {
      return res.status(400).json({ error: 'Le champ "date_fin" est obligatoire et doit être au format AAAA-MM-JJ.' });
    }
    if (budget === undefined || isNaN(budget) || parseFloat(budget) < 0) {
      return res.status(400).json({ error: 'Le champ "budget" est obligatoire et doit être un nombre positif.' });
    }

    const projet = await Projet.create({
      nom: nom.trim(),
      bailleur: bailleur.trim(),
      date_debut,
      date_fin,
      budget: parseFloat(budget),
      description: description || null
    });

    res.status(201).json(projet);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur lors de la création du projet.' });
  }
});
// PUT modification projet
router.put('/:id', async (req, res) => {
  try {
    const { nom, bailleur, date_debut, date_fin, budget, description } = req.body;
    const projet = await Projet.findByPk(req.params.id);
    if (!projet) return res.status(404).json({ error: 'Projet non trouvé' });

    if (!nom || typeof nom !== 'string' || nom.trim() === '') {
      return res.status(400).json({ error: 'Le champ "nom" est obligatoire et doit être une chaîne non vide.' });
    }
    if (!bailleur || typeof bailleur !== 'string' || bailleur.trim() === '') {
      return res.status(400).json({ error: 'Le champ "bailleur" est obligatoire et doit être une chaîne non vide.' });
    }
    if (!date_debut || !/^\d{4}-\d{2}-\d{2}$/.test(date_debut)) {
      return res.status(400).json({ error: 'Le champ "date_debut" est obligatoire et doit être au format AAAA-MM-JJ.' });
    }
    if (!date_fin || !/^\d{4}-\d{2}-\d{2}$/.test(date_fin)) {
      return res.status(400).json({ error: 'Le champ "date_fin" est obligatoire et doit être au format AAAA-MM-JJ.' });
    }
    if (budget === undefined || isNaN(budget) || parseFloat(budget) < 0) {
      return res.status(400).json({ error: 'Le champ "budget" est obligatoire et doit être un nombre positif.' });
    }

    await projet.update({
      nom: nom.trim(),
      bailleur: bailleur.trim(),
      date_debut,
      date_fin,
      budget: parseFloat(budget),
      description: description || null
    });
    res.json(projet);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur lors de la modification du projet.' });
  }
});

// DELETE suppression projet
router.delete('/:id', async (req, res) => {
  try {
    const projet = await Projet.findByPk(req.params.id);
    if (!projet) return res.status(404).json({ error: 'Projet non trouvé' });
    await projet.destroy();
    res.json({ message: 'Projet supprimé' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur lors de la suppression du projet.' });
  }
});



module.exports = router;
