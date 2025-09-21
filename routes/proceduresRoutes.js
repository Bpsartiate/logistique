const express = require('express');
const router = express.Router();
const { Op } = require('sequelize');
const Procedure = require('./procedure'); // adapte le chemin selon ton modèle

// Vérifie si un intervalle chevauche un autre dans la même catégorie (exclut un id si fourni)
async function intervalleChevauchement(montant_min, montant_max, categorie, idExclu = null) {
  const whereClause = {
    categorie,
    [Op.or]: [
      { montant_min: { [Op.between]: [montant_min, montant_max] } },
      { montant_max: { [Op.between]: [montant_min, montant_max] } },
      {
        montant_min: { [Op.lte]: montant_min },
        montant_max: { [Op.gte]: montant_max }
      }
    ]
  };
  if (idExclu) whereClause.id = { [Op.ne]: idExclu };
  const chevauche = await Procedure.findOne({ where: whereClause });
  return chevauche !== null;
}

// GET toutes procédures
router.get('/', async (req, res) => {
  try {
    const procedures = await Procedure.findAll({ order: [['id', 'ASC']] });
    res.json(procedures);
  } catch (err) { res.status(500).json({ error: 'Erreur serveur lors de la récupération' }); }
});

// POST nouvelle procédure
router.post('/', async (req, res) => {
  try {
    const { categorie, type_procedure, montant_min, montant_max } = req.body;
    // Vérifie si le type de procédure existe déjà pour la catégorie donnée
    const typeExists = await Procedure.findOne({ 
    where: { categorie, type_procedure } 
    });
    if (typeExists) {
    return res.status(409).json({ error: 'Ce type de procédure existe déjà pour cette catégorie.' });
    }  
    if (!categorie || !type_procedure || montant_min === undefined)
      return res.status(400).json({ error: 'Catégorie, type et montant min obligatoires' });
    const maxMontant = montant_max != null ? montant_max : Number.MAX_SAFE_INTEGER;
    if (await intervalleChevauchement(montant_min, maxMontant, categorie))
      return res.status(400).json({ error: 'Intervalle de montants chevauchant existant' });
    const proc = await Procedure.create({ categorie, type_procedure, montant_min, montant_max: montant_max || null });
    res.status(201).json(proc);
  } catch (err) { res.status(500).json({ error: 'Erreur création procédure' }); }
});

// PUT modifie procédure par ID
router.put('/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    // Vérifie si le type de procédure existe déjà pour la catégorie donnée, en excluant l'ID actuel
    const exist = await Procedure.findOne({
    where: {
        categorie,
        type_procedure,
        id: { [Op.ne]: id }
    }
    });
    if (exist) {
    return res.status(409).json({ error: 'Ce type de procédure existe déjà pour cette catégorie.' });
    }

    if (isNaN(id)) return res.status(400).json({ error: 'ID invalide' });
    const proc = await Procedure.findByPk(id);
    if (!proc) return res.status(404).json({ error: 'Procédure non trouvée' });

    const { categorie, type_procedure, montant_min, montant_max } = req.body;
    const minMontant = montant_min !== undefined ? montant_min : proc.montant_min;
    const maxMontant = montant_max !== undefined ? montant_max : (proc.montant_max || Number.MAX_SAFE_INTEGER);
    const cat = categorie || proc.categorie;

    if (await intervalleChevauchement(minMontant, maxMontant, cat, id))
      return res.status(400).json({ error: 'Intervalle de montants chevauchant existant pour cette catégorie' });

    if (categorie) proc.categorie = categorie;
    if (type_procedure) proc.type_procedure = type_procedure;
    if (montant_min !== undefined) proc.montant_min = montant_min;
    proc.montant_max = montant_max !== undefined ? montant_max : proc.montant_max;

    await proc.save();
    res.json(proc);
  } catch (err) { res.status(500).json({ error: 'Erreur mise à jour procédure' }); }
});

// DELETE procédure par ID
router.delete('/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    if (isNaN(id)) return res.status(400).json({ error: 'ID invalide' });
    const proc = await Procedure.findByPk(id);
    if (!proc) return res.status(404).json({ error: 'Procédure non trouvée' });
    await proc.destroy();
    res.json({ message: 'Procédure supprimée' });
  } catch (err) { res.status(500).json({ error: 'Erreur suppression procédure' }); }
});

module.exports = router;
