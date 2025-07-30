const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { Sequelize, DataTypes } = require('sequelize');


// Initialisation Sequelize (adapter les paramètres si besoin)
const sequelize = new Sequelize('c1743910c_aurorardc', 'root', 'aurora@2021RDC', {
  host: 'localhost',
  dialect: 'mysql',
  logging: false
});


const app = express();
const port = 3000;


app.use(cors());
app.use(express.json());


// ======== Config MySQL ========
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'aurora@2021RDC',
  database: 'c1743910c_aurorardc'
});


db.connect(err => {
  if (err) {
    console.error('Erreur connexion MySQL:', err);
    process.exit(1);
  }
  console.log('Connecté à la base MySQL');
});


// ======== Upload fichiers (Multer & fichiers statiques) ========
const uploadDir = path.join(__dirname, 'uploads');
if (!fs.existsSync(uploadDir)) fs.mkdirSync(uploadDir, { recursive: true });
app.use('/uploads', express.static(uploadDir)); // Expose le dossier uploads côté web


const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, uploadDir),
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
  }
});
const upload = multer({ storage });


/**
 * Statut automatique d’un document selon sa date d’expiration.
 * "Valide", "Expire bientôt" (<=30 jours), "Expiré", "Inconnu"
 */
function getStatutValidite(date_expiration) {
  if (!date_expiration) return 'Inconnu';
  const today = new Date();
  const exp = new Date(date_expiration);
  if (isNaN(exp.getTime())) return 'Inconnu';
  const diff = (exp - today) / (1000 * 60 * 60 * 24); // jours
  if (diff < 0) return 'Expiré';
  if (diff <= 30) return 'Expire bientôt';
  return 'Valide';
}


// ======== FONCTIONNEL Fournisseurs/Evaluations/Incidents (conforme tes messages) ========
function majStatutEtScoreAvecIncidents(fournisseurId, callback) {
  db.query(
    'SELECT AVG(score_global) AS score_moyen FROM t_evaluation_fournisseur WHERE id_fournisseur = ?',
    [fournisseurId], 
    (err, evalRes) => {
      if (err) return callback(err);
      const score = evalRes[0].score_moyen || 0;
      db.query(
        'SELECT MAX(gravite) AS max_gravite FROM t_incident_fournisseur WHERE id_fournisseur = ? AND statut_incident = "ouvert"',
        [fournisseurId],
        (err2, incRes) => {
          if (err2) return callback(err2);
          const maxGravite = incRes[0].max_gravite || 0;


          let statut = 'En attente';


          // Nouvelle échelle de statut plus fine et lisible
          if (score >= 85 && maxGravite < 2) {
            statut = 'Actif';
          } else if (score >= 70 && maxGravite < 3) {
            statut = 'Sous surveillance';
          } else if (score >= 50 && maxGravite < 4) {
            statut = 'Risque élevé';
          } else {
            statut = 'Suspendu';
          }


          // Historique des changements de statut (à implémenter si besoin)


          db.query(
            'UPDATE t_fournisseur SET score = ?, statut = ? WHERE id = ?', 
            [score, statut, fournisseurId], 
            callback
          );
        }
      );
    }
  );
}


// ========= FOURNISSEUR : Création + listing ==========
app.post('/fournisseurs', upload.fields([
  { name: 'documentsDemandes', maxCount: 10 },
  { name: 'documentsFournis', maxCount: 10 }
]), (req, res) => {
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
    statut: 'En attente', // statut initial
    score: 0 // score initial
  };
  
  db.query('INSERT INTO t_fournisseur SET ?', fournisseurData, (err, result) => {
    if (err) {
      console.error(err);
      if (req.files) {
        Object.values(req.files).flat().forEach(f => fs.unlink(f.path, () => {}));
      }
      return res.status(500).json({ error: "Erreur insertion fournisseur" });
    }
    const fournisseurId = result.insertId;


    // Contacts
    const ensureArray = d => Array.isArray(d) ? d : (d ? [d] : []);
    const typesContact = ensureArray(req.body.typeContact);
    const nomsContact = ensureArray(req.body.nomContact);
    const telContact = ensureArray(req.body.telContact);
    const mailContact = ensureArray(req.body.mailContact);
    
    const contactsToInsert = [];
    for (let i=0; i<nomsContact.length; i++) {
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
    // Produits
    let produitsList = [];
    if (req.body.produitsServices && req.body.produitsServices.trim() !== '') {
      produitsList = req.body.produitsServices.split(/\r?\n/).map(p => p.trim()).filter(p => p);
    }
    const produitsToInsert = produitsList.map(p => [fournisseurId, p]);


    // Documents
    const documentsToInsert = [];
    if (req.files) {
      ['documentsDemandes','documentsFournis'].forEach(typeDoc => {
        if(req.files[typeDoc]) {
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


    const processNext = (err, cb) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ error: "Erreur insertion données liées" });
      }
      cb();
    }


    const insertContacts = (cb) => {
      if (contactsToInsert.length === 0) return cb();
      db.query('INSERT INTO t_contact_fournisseur (fournisseur_id,type_contact,nom,telephone,email) VALUES ?', [contactsToInsert], (e) => processNext(e, cb));
    }
    const insertProduits = (cb) => {
      if (produitsToInsert.length === 0) return cb();
      db.query('INSERT INTO t_produit_service (fournisseur_id, description) VALUES ?', [produitsToInsert], (e) => processNext(e, cb));
    }
    const insertDocuments = (cb) => {
      if (documentsToInsert.length === 0) return cb();
      db.query('INSERT INTO t_document_fournisseur (fournisseur_id, nom_original,type_document, nom_genere, chemin_fichier) VALUES ?', [documentsToInsert], (e) => processNext(e, cb));
    }


    insertContacts(() => insertProduits(() => insertDocuments(() => {
      res.status(201).json({ message: "Fournisseur créé avec succès", fournisseurId });
    })));
  });
});


// Route GET fournisseurs avec contact principal
app.get('/fournisseurs', (req, res) => {
  const sql = `
    SELECT
      f.*,
      (SELECT c.nom
       FROM t_contact_fournisseur c
       WHERE c.fournisseur_id = f.id AND c.type_contact = 'principale'
       LIMIT 1) AS nom_contact_principal
    FROM t_fournisseur f
    ORDER BY f.id DESC
  `;
  db.query(sql, (err, fournisseurs) => {
    if (err) {
      console.error('Erreur récupération fournisseurs:', err);
      return res.status(500).json({ error: 'Erreur lors de la récupération des fournisseurs' });
    }
    // Pour chaque fournisseur, récupérer ses contacts, ses produits/services ET ses évaluations (incidents)
    const promises = fournisseurs.map(f => {
      return new Promise((resolve, reject) => {
        db.query('SELECT * FROM t_contact_fournisseur WHERE fournisseur_id = ?', [f.id], (err2, contacts) => {
          if (err2) return reject(err2);
          f.contacts = contacts;
          db.query('SELECT * FROM t_produit_service WHERE fournisseur_id = ?', [f.id], (err3, produits) => {
            if (err3) return reject(err3);
            f.produits = produits;
            db.query('SELECT * FROM t_incident_fournisseur WHERE id_fournisseur = ?', [f.id], (err4, incidents) => {
              if (err4) return reject(err4);
              f.evaluations = incidents;
              resolve();
            });
          });
        });
      });
    });
    Promise.all(promises)
      .then(() => res.json(fournisseurs))
      .catch(e => res.status(500).json({ error: 'Erreur récupération contacts/produits/evaluations', details: e.message }));
  });
});


// ========= Evaluations =========
// GET toutes les évaluations d'un fournisseur
app.get('/evaluations/:idFournisseur', (req, res) => {
  const id = req.params.idFournisseur;
  db.query('SELECT * FROM t_evaluation_fournisseur WHERE id_fournisseur = ? ORDER BY id_evaluation DESC', [id], (err, results) => {
    if (err) {
      console.error('Erreur récupération évaluations :', err);
      return res.status(500).json({ error: 'Erreur serveur' });
    }
    res.json(results);
  });
});
app.post('/evaluations', upload.none(), (req, res) => {
  const { id_fournisseur, id_utilisateur, id_entreprise, qualite, delai, conformite, service, communication, commentaire } = req.body;
  let cout = Number(req.body.cout);
  if (isNaN(cout) || cout < 1 || cout > 10) cout = 0;
  const notes = [
    Number(qualite) || 0,
    Number(delai) || 0,
    Number(conformite) || 0,
    Number(service) || 0,
    Number(communication) || 0,
    cout
  ];
  const score_global = notes.reduce((a, b) => a + b, 0) / notes.length;


  const dataEval = {
    id_fournisseur,
    id_utilisateur,
    id_entreprise, // Ajouté ici
    qualite,
    delai,
    conformite,
    service,
    communication,
    cout,
    score_global,
    commentaire: commentaire || null
  };


  db.query('INSERT INTO t_evaluation_fournisseur SET ?', dataEval, (err) => {
    if (err) {
      console.error('Erreur insertion évaluation :', err);
      return res.status(500).json({ error: 'Erreur insertion évaluation', details: err.message });
    }
    majStatutEtScoreAvecIncidents(id_fournisseur, err2 => {
      if (err2) console.error('Erreur mise à jour statut:', err2);
      res.status(201).json({ message: 'Évaluation enregistrée' });
    });
  });
});


app.get('/evaluations/count/:idFournisseur', (req, res) => {
  const id = req.params.idFournisseur;
  db.query('SELECT COUNT(*) AS count FROM t_evaluation_fournisseur WHERE id_fournisseur = ?', [id], (err, results) => {
    if (err) {
      console.error('Erreur comptage évaluations :', err);
      return res.status(500).json({ error: 'Erreur serveur' });
    }
    res.json({ count: results[0].count });
  });
});


// ========= Incidents =========
// Correction: multer middleware to parse files and multipart/form-data
app.post('/incidents', upload.array('fichiers[]'), (req, res) => {
  const { id_fournisseur, type_incident, gravite, description } = req.body;
  if (!id_fournisseur || !type_incident || !gravite) return res.status(400).json({ error: 'Champs obligatoires manquants' });


  const incidentData = { id_fournisseur, type_incident, gravite, statut_incident: 'ouvert', description };
  db.query('INSERT INTO t_incident_fournisseur SET ?', incidentData, (err, result) => {
    if (err) return res.status(500).json({ error: 'Erreur insertion incident' });
    majStatutEtScoreAvecIncidents(id_fournisseur, err2 => {
      if (err2) console.error(err2);
      res.status(201).json({ message: 'Incident enregistré', id_incident: result.insertId });
    });
  });
});


app.get('/incidents/:idFournisseur', (req, res) => {
  const id = req.params.idFournisseur;
  db.query('SELECT * FROM t_incident_fournisseur WHERE id_fournisseur = ?', [id], (err, results) => {
    if (err) return res.status(500).json({ error: 'Erreur récupération incidents' });
    res.json(results);
  });
});


// ========= DOCUMENTS FOURNISSEUR : Liste, Compte, Ajouter, Modifier (infos+fichier), Supprimer =========


// Lister docs fournisseur (+ statut validité dynamique)
app.get('/documents/:fournisseur_id', (req, res) => {
  const fournisseurId = req.params.fournisseur_id;
  db.query(
    'SELECT * FROM t_document_fournisseur WHERE fournisseur_id = ? ORDER BY upload_date DESC',
    [fournisseurId],
    (err, results) => {
      if (err) {
        console.error('Erreur récupération documents:', err);
        return res.status(500).json({ error: 'Erreur récupération documents' });
      }
      // Ajoute le statut et l'URL publique à chaque doc uniquement si le fichier existe
      const docs = results.map(doc => {
        const filePath = doc.nom_genere ? path.join(uploadDir, doc.nom_genere) : null;
        let url_public = null;
        if (filePath && fs.existsSync(filePath)) {
          url_public = '/uploads/' + doc.nom_genere;
        }
        return {
          ...doc,
          statut_validite: getStatutValidite(doc.date_expiration),
          url_public
        };
      });
      res.json(docs);
    }
  );
});


// Compter les documents d'un fournisseur
app.get('/documents/count/:fournisseur_id', (req, res) => {
  const fournisseurId = req.params.fournisseur_id;
  db.query('SELECT COUNT(*) AS count FROM t_document_fournisseur WHERE fournisseur_id = ?', [fournisseurId], (err, results) => {
    if (err) {
      console.error('Erreur comptage documents:', err);
      return res.status(500).json({ error: 'Erreur serveur' });
    }
    res.json({ count: results[0].count });
  });
});


// Ajouter un document (upload)
app.post('/documents', upload.single('fichier'), (req, res) => {
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
    // ajoute_par: req.user?.id_utilisateur || null  // À ajouter si auth
  };


  db.query('INSERT INTO t_document_fournisseur SET ?', data, err => {
    if (err) {
      console.error('Erreur ajout document:', err);
      // clean up du fichier
      fs.unlink(req.file.path, _=>{});
      return res.status(500).json({ error: 'Erreur ajout document' });
    }
    res.status(201).json({ message: 'Document ajouté' });
  });
});


// Editer (infos ET fichier si remplacé)
app.put('/documents/:id_document', upload.single('fichier'), (req, res) => {
  const id = req.params.id_document;
  const { nom, type, date_emission, date_expiration } = req.body;


  db.query('SELECT chemin_fichier FROM t_document_fournisseur WHERE id=?', [id], (err, result) => {
    if (err || result.length === 0) return res.status(404).json({ error: 'Document introuvable' });
    const ancienChemin = result[0].chemin_fichier;


    let updateFields = {
      nom_original: nom,
      type_document: type,
      date_emission: date_emission || null,
      date_expiration: date_expiration || null
    };
    if (req.file) {
      updateFields.nom_genere = req.file.filename;
      updateFields.chemin_fichier = req.file.path;
    }


    db.query(
      'UPDATE t_document_fournisseur SET ? WHERE id=?',
      [updateFields, id],
      (err2) => {
        if (err2) {
          if (req.file) fs.unlink(req.file.path, ()=>{});
          return res.status(500).json({ error: 'Erreur mise à jour' });
        }
        if (req.file && ancienChemin && fs.existsSync(ancienChemin)) {
          fs.unlink(ancienChemin, ()=>{});
        }
        res.json({ message: 'Document modifié' });
      }
    );
  });
});


// Supprimer un document (physique + BDD)
app.delete('/documents/:id_document', (req, res) => {
  const id = req.params.id_document;
  db.query('SELECT chemin_fichier FROM t_document_fournisseur WHERE id=?', [id], (err, results) => {
    if (err || results.length === 0) {
      return res.status(404).json({ error: 'Document introuvable' });
    }
    const filePath = results[0].chemin_fichier;
    db.query('DELETE FROM t_document_fournisseur WHERE id=?', [id], (err2) => {
      if (err2) {
        return res.status(500).json({ error: 'Erreur suppression BDD' });
      }
      if (filePath && fs.existsSync(filePath)) fs.unlink(filePath, ()=>{});
      res.json({ message: 'Document supprimé' });
    });
  });
});


app.listen(port, () => console.log(`Serveur démarré sur http://localhost:${port}`));
//  Modèle Sequelize pour t_ponderations_entreprise
const PonderationEntreprise = sequelize.define('t_ponderations_entreprise', {
  id_entreprise: { type: Sequelize.INTEGER, primaryKey: true },
  critere: { type: Sequelize.STRING, primaryKey: true },
  poids: { type: Sequelize.FLOAT, allowNull: false, defaultValue: 0 }
}, { tableName: 't_ponderations_entreprise', timestamps: false });
// Route POST pour enregistrer les pondérations (validation somme ≤100)
app.post('/api/ponderations', async (req, res) => {
  const { id_entreprise, ponderations } = req.body;
  const criteres = ['qualite', 'communication', 'cout', 'service', 'delai', 'conformite'];


  let total = 0;
  for (const c of criteres) {
    const val = parseFloat(ponderations[c]) || 0;
    if (val < 0) return res.status(400).json({ error: 'Pondérations négatives non autorisées' });
    total += val;
  }
  if (total > 100)
    return res.status(400).json({ error: 'La somme des pondérations doit être ≤ 100%' });


  await Promise.all(criteres.map(critere =>
    PonderationEntreprise.upsert({
      id_entreprise, critere, poids: parseFloat(ponderations[critere]) || 0
    })
  ));


  return res.json({ success: true });
});


// GET /api/ponderations/:id_entreprise
app.get('/api/ponderations/:id_entreprise', async (req, res) => {
  const id_entreprise = req.params.id_entreprise;
  try {
    const ponderations = await PonderationEntreprise.findAll({ where: { id_entreprise } });
    // Format: [{ critere, poids }, ...]
    res.json(ponderations.map(p => ({ critere: p.critere, poids: p.poids })));
  } catch (err) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});


// DELETE /api/ponderations/:id_entreprise/:critere
app.delete('/api/ponderations/:id_entreprise/:critere', async (req, res) => {
  const { id_entreprise, critere } = req.params;
  try {
    await PonderationEntreprise.destroy({ where: { id_entreprise, critere } });
    res.json({ success: true });
  } catch (err) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});


// GET score global pondéré pour une entreprise
app.get('/api/score-global-pondere/:id_entreprise', (req, res) => {
  const id_entreprise = Number(req.params.id_entreprise);
  if (isNaN(id_entreprise)) return res.status(400).json({ error: 'ID entreprise invalide' });


  const sql = `
    SELECT AVG(score_global) AS avg_score
    FROM t_evaluation_fournisseur
    WHERE id_entreprise = ? AND score_global IS NOT NULL
  `;
  db.query(sql, [id_entreprise], (err, results) => {
    if (err) {
      console.error('Erreur calcul score global pondéré:', err);
      return res.status(500).json({ error: 'Erreur serveur' });
    }
    const score = results[0].avg_score !== null ? parseFloat(results[0].avg_score) : null;
    res.json({ score });
  });
});
//  Calcul du score pondéré pour une évaluation
async function calculScorePonderePourcent(idEvaluation, idEntreprise) {
  const eval = await Evaluation.findOne({ where: { id_evaluation: idEvaluation, id_entreprise: idEntreprise } });
  if (!eval) throw new Error('Évaluation introuvable');


  const ponderations = await PonderationEntreprise.findAll({ where: { id_entreprise: idEntreprise } });
  const poidsMap = {};
  ponderations.forEach(p => { poidsMap[p.critere] = (p.poids || 0) / 100; });


  const criteres = ['qualite', 'communication', 'cout', 'service', 'delai', 'conformite'];


  let somme = 0, sommePoids = 0;
  criteres.forEach(c => {
    const note = eval[c];
    const poids = poidsMap[c] || 0;
    if (note !== null && poids > 0) {
      somme += note * poids;
      sommePoids += poids;
    }
  });


  if (sommePoids === 0) return null;


  const score = somme / sommePoids;
  await eval.update({ score_global: score });
  return score;
}
