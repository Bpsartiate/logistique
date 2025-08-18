const express = require('express');
const cors = require('cors');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { Sequelize } = require('sequelize');

const db = require('./db'); // pool mysql2/promise

// Initialisation Sequelize (adapter les paramètres si besoin)
const sequelize = new Sequelize('c1743910c_aurorardc', 'root', 'aurora@2021RDC', {
  host: 'localhost',
  dialect: 'mysql',
  logging: false,
});

// Modèle Sequelize pour pondérations
const PonderationEntreprise = sequelize.define('t_ponderations_entreprise', {
  id_entreprise: { type: Sequelize.INTEGER, primaryKey: true },
  critere: { type: Sequelize.STRING, primaryKey: true },
  poids: { type: Sequelize.FLOAT, allowNull: false, defaultValue: 0 }
}, { tableName: 't_ponderations_entreprise', timestamps: false });

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

const uploadDir = path.join(__dirname, 'uploads');
if (!fs.existsSync(uploadDir)) fs.mkdirSync(uploadDir, { recursive: true });
app.use('/uploads', express.static(uploadDir));

const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, uploadDir),
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1e9);
    cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
  }
});
const upload = multer({ storage });

// Fonction pour statut validité document
function getStatutValidite(date_expiration) {
  if (!date_expiration) return 'Inconnu';
  const today = new Date();
  const exp = new Date(date_expiration);
  if (isNaN(exp.getTime())) return 'Inconnu';
  const diff = (exp - today) / (1000 * 60 * 60 * 24);
  if (diff < 0) return 'Expiré';
  if (diff <= 30) return 'Expire bientôt';
  return 'Valide';
}

// Fonction async maj statut fournisseur
async function majStatutEtScoreAvecIncidents(fournisseurId) {
  try {
    const [[{ score_moyen }]] = await db.query(
      'SELECT AVG(score_global) AS score_moyen FROM t_evaluation_fournisseur WHERE id_fournisseur = ?',
      [fournisseurId]
    );
    const score = score_moyen || 0;
    const [[{ max_gravite }]] = await db.query(
      'SELECT MAX(gravite) AS max_gravite FROM t_incident_fournisseur WHERE id_fournisseur = ? AND statut_incident = "ouvert"',
      [fournisseurId]
    );

    let statut = 'En attente';
    if (score >= 85 && max_gravite < 2) statut = 'Actif';
    else if (score >= 70 && max_gravite < 3) statut = 'Sous surveillance';
    else if (score >= 50 && max_gravite < 4) statut = 'Risque élevé';
    else statut = 'Suspendu';

    await db.query('UPDATE t_fournisseur SET score = ?, statut = ? WHERE id = ?', [score, statut, fournisseurId]);
  } catch (err) {
    console.error('Erreur maj statut fournisseur:', err);
    throw err;
  }
}

// --- Fonction d'enregistrement des actions fournisseur ---
async function enregistrerActionFournisseur({ idFournisseur, typeAction, gravite = null, idUtilisateur = null, description = null }) {
  try {
    await db.query(`
      INSERT INTO t_actions_fournisseur
      (id_fournisseur, type_action, gravite, id_utilisateur, description)
      VALUES (?, ?, ?, ?, ?)
    `, [idFournisseur, typeAction, gravite, idUtilisateur, description]);
  } catch (err) {
    console.error('Erreur lors de l\'enregistrement de l\'action fournisseur :', err);
  }
}
// -----------------------------------------------------------

// --- ROUTES ---

// POST /fournisseurs (création + contacts + produits + documents)
app.post('/fournisseurs', upload.fields([
  { name: 'documentsDemandes', maxCount: 10 },
  { name: 'documentsFournis', maxCount: 10 }
]), async (req, res) => {
  const fournisseurData = {
    nom: req.body.nomSociete || null,
    nom_commercial: req.body.nomCommercial || null,
    nif: req.body.nif || null,
    tva: req.body.tva || null,
    statut_juridique: req.body.statutJuridique || null,
    adresse_siege: req.body.adresseSiege || null,
    adresse_facturation: req.body.adresseFacturation || null,
    adresse_livraison: req.body.adresseLivraison || null,
    site_web: req.body.siteWeb || null,
    rib_iban: req.body.rib || null,
    banque: req.body.banque || null,
    adresse_banque: req.body.adresseBanque || null,
    conditions_paiement: req.body.conditionsPaiement || null,
    conditions_generales_vente: req.body.conditionsGeneralesVente || null,
    devise: req.body.devise || null,
    credit_info: req.body.credit || null,
    description: req.body.description || null,
    tarifs: req.body.tarifs || null,
    delai_livraison: req.body.delaiLivraison || null,
    conditions_garantie: req.body.garantie || null,
    date_debut_relation: req.body.dateDebut || null,
    date_fin_contrat: req.body.dateFin || null,
    reference_contrat: req.body.referenceContrat || null,
    certifications: req.body.certifications || null,
    remarques: req.body.remarques || null,
    statut: 'En attente',
    score: 0
  };
  try {
    const [result] = await db.query('INSERT INTO t_fournisseur SET ?', fournisseurData);
    const fournisseurId = result.insertId;

    const ensureArray = d => Array.isArray(d) ? d : (d ? [d] : []);
    const typesContact = ensureArray(req.body.typeContact);
    const nomsContact = ensureArray(req.body.nomContact);
    const telContact = ensureArray(req.body.telContact);
    const mailContact = ensureArray(req.body.mailContact);

    const contactsToInsert = [];
    for (let i = 0; i < nomsContact.length; i++) {
      if (nomsContact[i] && nomsContact[i].trim() !== '') {
        contactsToInsert.push([
          fournisseurId,
          typesContact[i] || null,
          nomsContact[i],
          telContact[i] || null,
          mailContact[i] || null
        ]);
      }
    }

    let produitsList = [];
    if (req.body.produitsServices && req.body.produitsServices.trim() !== '') {
      produitsList = req.body.produitsServices.split(/\r?\n/).map(p => p.trim()).filter(p => p);
    }
    const produitsToInsert = produitsList.map(p => [fournisseurId, p]);

    const documentsToInsert = [];
    if (req.files) {
      ['documentsDemandes', 'documentsFournis'].forEach(typeDoc => {
        if (req.files[typeDoc]) {
          req.files[typeDoc].forEach(f => {
            documentsToInsert.push([
              fournisseurId,
              f.originalname,
              typeDoc,
              f.filename,
              f.path
            ]);
          });
        }
      });
    }
    if (contactsToInsert.length) {
      await db.query('INSERT INTO t_contact_fournisseur (fournisseur_id,type_contact,nom,telephone,email) VALUES ?', [contactsToInsert]);
    }
    if (produitsToInsert.length) {
      await db.query('INSERT INTO t_produit_service (fournisseur_id, description) VALUES ?', [produitsToInsert]);
    }
    if (documentsToInsert.length) {
      await db.query('INSERT INTO t_document_fournisseur (fournisseur_id, nom_original,type_document, nom_genere, chemin_fichier) VALUES ?', [documentsToInsert]);
    }

    // Enregistre action création fournisseur dans l'historique
    await enregistrerActionFournisseur({
      idFournisseur: fournisseurId,
      typeAction: 'Création fournisseur',
      gravite: null,
      idUtilisateur: null,
      description: `Fournisseur '${fournisseurData.nom}' créé`
    });

    res.status(201).json({ message: "Fournisseur créé avec succès", fournisseurId });
  } catch (err) {
    if (req.files) Object.values(req.files).flat().forEach(f => fs.unlink(f.path, () => {}));
    console.error(err);
    res.status(500).json({ error: "Erreur insertion fournisseur" });
  }
});

// GET fournisseurs
app.get('/fournisseurs', async (req, res) => {
  try {
    const [fournisseurs] = await db.query(`
      SELECT f.*,
             (SELECT c.nom
              FROM t_contact_fournisseur c
              WHERE c.fournisseur_id = f.id
                AND c.type_contact = 'principale'
              LIMIT 1) AS nom_contact_principal
      FROM t_fournisseur f
      ORDER BY f.id DESC
    `);

    await Promise.all(fournisseurs.map(async (f) => {
      const [contacts] = await db.query('SELECT * FROM t_contact_fournisseur WHERE fournisseur_id = ?', [f.id]);
      const [produits_services] = await db.query('SELECT * FROM t_produit_service WHERE fournisseur_id = ?', [f.id]);
      const [incidents] = await db.query('SELECT * FROM t_incident_fournisseur WHERE id_fournisseur = ?', [f.id]);

      f.contacts = contacts;
      f.produits_services = produits_services;
      f.incidents = incidents;
    }));

    res.json(fournisseurs);
  } catch (err) {
    console.error('Erreur récupération fournisseurs avec détails :', err);
    res.status(500).json({ error: 'Erreur serveur lors de la récupération des fournisseurs', details: err.message });
  }
});

// GET fournisseur by ID
app.get('/fournisseurs/:id', async (req, res) => {
  try {
    const id = req.params.id;
    const [fournisseurs] = await db.query('SELECT * FROM t_fournisseur WHERE id = ?', [id]);
    if (fournisseurs.length === 0) return res.status(404).json({ error: 'Fournisseur non trouvé' });

    const fournisseur = fournisseurs[0];
    const [contacts] = await db.query('SELECT * FROM t_contact_fournisseur WHERE fournisseur_id = ?', [id]);
    const [produits] = await db.query('SELECT * FROM t_produit_service WHERE fournisseur_id = ?', [id]);
    const [incidents] = await db.query('SELECT * FROM t_incident_fournisseur WHERE id_fournisseur = ?', [id]);

    fournisseur.contacts = contacts;
    fournisseur.produits_services = produits;
    fournisseur.incidents = incidents;

    res.json(fournisseur);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// PUT mise à jour fournisseur + contacts + produits avec transaction
app.put('/fournisseurs/:id', async (req, res) => {
  const id = req.params.id;
  const data = { ...req.body };

  delete data.contacts;
  delete data.produits_services;
  delete data.incidents;
  delete data.id;
  delete data.score;
  delete data.statut;

  Object.keys(data).forEach(key => {
    if (data[key] === undefined || data[key] === null || data[key] === '') {
      delete data[key];
    }
  });

  function formatDateTime(value) {
    const dt = new Date(value);
    if (isNaN(dt)) return null;
    return dt.getFullYear() + '-' +
      String(dt.getMonth() + 1).padStart(2, '0') + '-' +
      String(dt.getDate()).padStart(2, '0') + ' ' +
      String(dt.getHours()).padStart(2, '0') + ':' +
      String(dt.getMinutes()).padStart(2, '0') + ':' +
      String(dt.getSeconds()).padStart(2, '0');
  }
  function formatDate(value) {
    const dt = new Date(value);
    if (isNaN(dt)) return null;
    return dt.getFullYear() + '-' +
      String(dt.getMonth() + 1).padStart(2, '0') + '-' +
      String(dt.getDate()).padStart(2, '0');
  }

  if (data.last_update) {
    const val = formatDateTime(data.last_update);
    if (val) data.last_update = val;
    else delete data.last_update;
  }
  ['date_debut_relation', 'date_fin_contrat'].forEach(field => {
    if (data[field]) {
      const val = formatDate(data[field]);
      if (val) data[field] = val;
      else delete data[field];
    }
  });

  const contacts = req.body.contacts || [];
  const produits_services = req.body.produits_services || [];

  const connection = await db.getConnection();

  try {
    await connection.beginTransaction();

    await connection.query('UPDATE t_fournisseur SET ? WHERE id = ?', [data, id]);

    const [existingContacts] = await connection.query('SELECT id FROM t_contact_fournisseur WHERE fournisseur_id = ?', [id]);
    const existingContactIds = existingContacts.map(c => c.id);
    const submittedContactIds = contacts.filter(c => c.id).map(c => c.id);
    const contactIdsToDelete = existingContactIds.filter(eid => !submittedContactIds.includes(eid));
    if (contactIdsToDelete.length) {
      await connection.query('DELETE FROM t_contact_fournisseur WHERE id IN (?)', [contactIdsToDelete]);
    }
    for (const c of contacts) {
      if (c.id && existingContactIds.includes(c.id)) {
        const { id: cid, ...contactData } = c;
        await connection.query('UPDATE t_contact_fournisseur SET ? WHERE id = ?', [contactData, cid]);
      } else {
        await connection.query(
          'INSERT INTO t_contact_fournisseur (fournisseur_id, type_contact, nom, telephone, email) VALUES (?, ?, ?, ?, ?)',
          [id, c.type_contact, c.nom, c.telephone, c.email]
        );
      }
    }

    const [existingProduits] = await connection.query('SELECT id FROM t_produit_service WHERE fournisseur_id = ?', [id]);
    const existingProduitIds = existingProduits.map(p => p.id);
    const submittedProduitIds = produits_services.filter(p => p.id).map(p => p.id);
    const produitIdsToDelete = existingProduitIds.filter(eid => !submittedProduitIds.includes(eid));
    if (produitIdsToDelete.length) {
      await connection.query('DELETE FROM t_produit_service WHERE id IN (?)', [produitIdsToDelete]);
    }
    for (const p of produits_services) {
      if (p.id && existingProduitIds.includes(p.id)) {
        const { id: pid, ...prodData } = p;
        await connection.query('UPDATE t_produit_service SET ? WHERE id = ?', [prodData, pid]);
      } else {
        await connection.query('INSERT INTO t_produit_service (fournisseur_id, description) VALUES (?, ?)', [id, p.description]);
      }
    }

    await connection.commit();
    connection.release();

    // Enregistrement action modification fournisseur
    await enregistrerActionFournisseur({
      idFournisseur: parseInt(id, 10),
      typeAction: 'Modification fournisseur',
      gravite: null,
      idUtilisateur: null,
      description: `Fournisseur ID ${id} modifié`
    });

    res.json({ success: true, message: 'Fournisseur mis à jour avec contacts et produits' });
  } catch (error) {
    await connection.rollback();
    connection.release();
    console.error('Erreur lors de la mise à jour fournisseur :', error);
    res.status(500).json({ error: 'Erreur lors de la mise à jour' });
  }
});

// GET toutes les évaluations d’un fournisseur
app.get('/evaluations/:idFournisseur', async (req, res) => {
  try {
    const [results] = await db.query('SELECT * FROM t_evaluation_fournisseur WHERE id_fournisseur = ? ORDER BY id_evaluation DESC', [req.params.idFournisseur]);
    res.json(results);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// POST nouvelle évaluation
app.post('/evaluations', upload.none(), async (req, res) => {
  try {
    const {
      id_fournisseur,
      id_utilisateur,
      id_entreprise,
      qualite,
      delai,
      conformite,
      service,
      communication,
      commentaire,
      cout
    } = req.body;

    const coutNum = Number(cout);
    const coutValue = (isNaN(coutNum) || coutNum < 1 || coutNum > 10) ? 0 : coutNum;

    const notes = [
      Number(qualite) || 0,
      Number(delai) || 0,
      Number(conformite) || 0,
      Number(service) || 0,
      Number(communication) || 0,
      coutValue
    ];

    const score_global = notes.reduce((a, b) => a + b, 0) / notes.length;

    const dataEval = {
      id_fournisseur,
      id_utilisateur,
      id_entreprise,
      qualite,
      delai,
      conformite,
      service,
      communication,
      cout: coutValue,
      score_global,
      commentaire: commentaire || null
    };

    await db.query('INSERT INTO t_evaluation_fournisseur SET ?', dataEval);
    await majStatutEtScoreAvecIncidents(id_fournisseur);

    // Enregistre action nouvelle évaluation
    await enregistrerActionFournisseur({
      idFournisseur: id_fournisseur,
      typeAction: 'Nouvelle évaluation',
      gravite: null,
      idUtilisateur: id_utilisateur || null,
      description: `Évaluation ajoutée avec score global ${score_global.toFixed(2)}`
    });

    res.status(201).json({ message: 'Évaluation enregistrée' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur insertion évaluation' });
  }
});

// GET count des évaluations d’un fournisseur
app.get('/evaluations/count/:idFournisseur', async (req, res) => {
  try {
    const [results] = await db.query('SELECT COUNT(*) AS count FROM t_evaluation_fournisseur WHERE id_fournisseur = ?', [req.params.idFournisseur]);
    res.json({ count: results[0].count });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// POST incident avec fichiers optionnels
app.post('/incidents', upload.array('fichiers[]'), async (req, res) => {
  try {
    const { id_fournisseur, type_incident, gravite, description } = req.body;
    if (!id_fournisseur || !type_incident || !gravite)
      return res.status(400).json({ error: 'Champs obligatoires manquants' });

    const incidentData = {
      id_fournisseur,
      type_incident,
      gravite,
      statut_incident: 'ouvert',
      description
    };

    const [result] = await db.query('INSERT INTO t_incident_fournisseur SET ?', incidentData);
    await majStatutEtScoreAvecIncidents(id_fournisseur);

    // Enregistre action signalement incident
    await enregistrerActionFournisseur({
      idFournisseur: id_fournisseur,
      typeAction: 'Signalement incident',
      gravite,
      idUtilisateur: null,
      description: description || `Incident de type ${type_incident}`
    });

    res.status(201).json({ message: 'Incident enregistré', id_incident: result.insertId });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur insertion incident' });
  }
});

// GET incidents par fournisseur
app.get('/incidents/:idFournisseur', async (req, res) => {
  try {
    const [results] = await db.query('SELECT * FROM t_incident_fournisseur WHERE id_fournisseur = ?', [req.params.idFournisseur]);
    res.json(results);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur récupération incidents' });
  }
});

// -- Documents --

// GET documents fournisseur
app.get('/documents/:fournisseur_id', async (req, res) => {
  try {
    const [results] = await db.query('SELECT * FROM t_document_fournisseur WHERE fournisseur_id = ? ORDER BY upload_date DESC', [req.params.fournisseur_id]);
    const docs = results.map(doc => {
      const filePath = doc.nom_genere ? path.join(uploadDir, doc.nom_genere) : null;
      let url_public = null;
      if (filePath && fs.existsSync(filePath)) url_public = '/uploads/' + doc.nom_genere;
      return {
        ...doc,
        statut_validite: getStatutValidite(doc.date_expiration),
        url_public
      };
    });
    res.json(docs);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur récupération documents' });
  }
});

// POST ajouter document (upload)
app.post('/documents', upload.single('fichier'), async (req, res) => {
  try {
    const { id_fournisseur, type, nom, date_emission, date_expiration } = req.body;
    if (!id_fournisseur || !type || !nom || !req.file)
      return res.status(400).json({ error: 'Champs obligatoires manquants' });

    const data = {
      fournisseur_id: id_fournisseur,
      type_document: type,
      nom_original: req.file.originalname,
      nom_genere: req.file.filename,
      chemin_fichier: req.file.path,
      date_emission: date_emission || null,
      date_expiration: date_expiration || null
    };

    await db.query('INSERT INTO t_document_fournisseur SET ?', data);

    // Enregistrement action ajout document
    await enregistrerActionFournisseur({
      idFournisseur: id_fournisseur,
      typeAction: 'Ajout document',
      gravite: null,
      idUtilisateur: null,
      description: `Document '${req.file.originalname}' ajouté`
    });

    res.status(201).json({ message: 'Document ajouté' });
  } catch (err) {
    if (req.file) fs.unlink(req.file.path, () => { });
    console.error(err);
    res.status(500).json({ error: 'Erreur ajout document' });
  }
});

// PUT modifier document (infos + fichier)
app.put('/documents/:id_document', upload.single('fichier'), async (req, res) => {
  const id = req.params.id_document;
  const { nom, type, date_emission, date_expiration } = req.body;
  try {
    const [rows] = await db.query('SELECT chemin_fichier, fournisseur_id FROM t_document_fournisseur WHERE id=?', [id]);
    if (rows.length === 0) return res.status(404).json({ error: 'Document introuvable' });
    const ancienChemin = rows[0].chemin_fichier;
    const fournisseurId = rows[0].fournisseur_id;

    const updateFields = {
      nom_original: nom,
      type_document: type,
      date_emission: date_emission || null,
      date_expiration: date_expiration || null
    };
    if (req.file) {
      updateFields.nom_genere = req.file.filename;
      updateFields.chemin_fichier = req.file.path;
    }

    await db.query('UPDATE t_document_fournisseur SET ? WHERE id=?', [updateFields, id]);

    if (req.file && ancienChemin && fs.existsSync(ancienChemin)) {
      fs.unlink(ancienChemin, () => { });
    }

    // Enregistrement action modification document
    await enregistrerActionFournisseur({
      idFournisseur: fournisseurId,
      typeAction: 'Modification document',
      gravite: null,
      idUtilisateur: null,
      description: `Document modifié : '${nom}'`
    });

    res.json({ message: 'Document modifié' });
  } catch (err) {
    if (req.file) fs.unlink(req.file.path, () => { });
    console.error(err);
    res.status(500).json({ error: 'Erreur mise à jour document' });
  }
});

// DELETE document
app.delete('/documents/:id_document', async (req, res) => {
  const id = req.params.id_document;
  try {
    const [rows] = await db.query('SELECT chemin_fichier, fournisseur_id, nom_original FROM t_document_fournisseur WHERE id=?', [id]);
    if (rows.length === 0) return res.status(404).json({ error: 'Document introuvable' });
    const filePath = rows[0].chemin_fichier;
    const fournisseurId = rows[0].fournisseur_id;
    const nomDoc = rows[0].nom_original;

    await db.query('DELETE FROM t_document_fournisseur WHERE id=?', [id]);

    if (filePath && fs.existsSync(filePath)) fs.unlink(filePath, () => { });

    // Enregistrement action suppression document
    await enregistrerActionFournisseur({
      idFournisseur: fournisseurId,
      typeAction: 'Suppression document',
      gravite: null,
      idUtilisateur: null,
      description: `Document supprimé : '${nomDoc}'`
    });

    res.json({ message: 'Document supprimé' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur suppression document' });
  }
});

// -- Pondérations --

// GET pondérations pour une entreprise
app.get('/api/ponderations/:id_entreprise', async (req, res) => {
  try {
    const id_entreprise = req.params.id_entreprise;
    const ponderations = await PonderationEntreprise.findAll({ where: { id_entreprise } });
    res.json(ponderations.map(p => ({ critere: p.critere, poids: p.poids })));
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// POST pondérations (validation somme ≤ 100)
app.post('/api/ponderations', async (req, res) => {
  try {
    const { id_entreprise, ponderations } = req.body;
    const criteres = ['qualite', 'communication', 'cout', 'service', 'delai', 'conformite'];

    let total = 0;
    for (const c of criteres) {
      const val = parseFloat(ponderations[c]) || 0;
      if (val < 0) return res.status(400).json({ error: 'Pondérations négatives non autorisées' });
      total += val;
    }
    if (total > 100) return res.status(400).json({ error: 'La somme des pondérations doit être ≤ 100%' });

    await Promise.all(criteres.map(critere =>
      PonderationEntreprise.upsert({
        id_entreprise, critere, poids: parseFloat(ponderations[critere]) || 0
      })
    ));

    res.json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// DELETE pondération par critère
app.delete('/api/ponderations/:id_entreprise/:critere', async (req, res) => {
  try {
    const { id_entreprise, critere } = req.params;
    await PonderationEntreprise.destroy({ where: { id_entreprise, critere } });
    res.json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Score global pondéré pour une entreprise
app.get('/api/score-global-pondere/:id_entreprise', async (req, res) => {
  try {
    const id_entreprise = Number(req.params.id_entreprise);
    if (isNaN(id_entreprise)) return res.status(400).json({ error: 'ID entreprise invalide' });

    const [results] = await db.query(`
      SELECT AVG(score_global) AS avg_score
      FROM t_evaluation_fournisseur
      WHERE id_entreprise = ? AND score_global IS NOT NULL
    `, [id_entreprise]);

    const score = results[0].avg_score !== null ? parseFloat(results[0].avg_score) : null;
    res.json({ score });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Endpoint pour récupérer l’historique d’un fournisseur (id en param URL)
app.get('/api/actions_fournisseur/:idFournisseur', async (req, res) => {
  const idFournisseur = parseInt(req.params.idFournisseur, 10);
  if (isNaN(idFournisseur)) {
    return res.status(400).json({ error: 'ID fournisseur invalide' });
  }

  try {
    const [rows] = await db.query(`
      SELECT a.id, a.type_action, a.date_action, a.gravite, a.description, u.nom AS utilisateur_nom
      FROM t_actions_fournisseur a
      LEFT JOIN t_utilisateur u ON a.id_utilisateur = u.id_utilisateur
      WHERE a.id_fournisseur = ?
      ORDER BY a.date_action DESC
      LIMIT 100
    `, [idFournisseur]);

    res.json(rows);

  } catch (error) {
    console.error('Erreur lors du chargement de l\'historique:', error);
    res.status(500).json({ error: 'Erreur serveur lors du chargement de l\'historique', details: error.message });
  }
});
//fournisseurs a risque elever
// GET fournisseurs à risque élevé (score < 50 ou statut = Risque élevé ou Suspendu)
app.get('/fournisseurs-risque-eleve', async (req, res) => {
  try {
    const [fournisseurs] = await db.query(`
      SELECT id, nom, score, statut
      FROM t_fournisseur
      WHERE statut IN ('Risque élevé', 'Suspendu') OR score < 50
      ORDER BY score ASC
      LIMIT 100
    `);
    res.json(fournisseurs);
  } catch (err) {
    console.error('Erreur récupération fournisseurs à risque élevé:', err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});


// Lancement serveur
app.listen(port, () => console.log(`Serveur démarré sur http://localhost:${port}`));
