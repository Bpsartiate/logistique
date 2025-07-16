const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const app = express();
const port = 3000;

app.use(cors());

// On ne met PAS app.use(express.json()) ici car multer va gérer le multipart/form-data
// et bodyParser (utilisé par express.json()) peut entrer en conflit avec multer.

// Config connexion MySQL (remplace par tes infos)
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',      
  password: 'aurora@2021RDC',
  database: 'c1743910c_aurorardc'
});

db.connect(err => {
  if (err) {
    console.error('Erreur connexion MySQL:', err);
    process.exit(1); // Arrête l'application en cas d'échec de connexion
  }
  console.log('Connecté à la base MySQL');
});

// --- Configuration Multer pour le stockage des fichiers ---
const uploadDir = path.join(__dirname, 'uploads');
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir); // Crée le dossier 'uploads' s'il n'existe pas
}

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, uploadDir); // Dossier de destination pour les fichiers
  },
  filename: (req, file, cb) => {
    // Nom de fichier unique pour éviter les collisions
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const ext = path.extname(file.originalname);
    cb(null, file.fieldname + '-' + uniqueSuffix + ext);
  }
});

const upload = multer({ storage });

// --- Route POST pour la création d'un fournisseur avec contacts, produits/services et documents ---
app.post('/fournisseurs', upload.fields([
  { name: 'documentsDemandes', maxCount: 10 },
  { name: 'documentsFournis', maxCount: 10 }
]), (req, res) => {

  // 1. Extraire les données du formulaire pour t_fournisseur
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
    remarques: req.body.remarques || null
  };

  // Les champs 'contacts' et 'produitsServices' ne sont plus des champs directs de t_fournisseur
  // Ils seront traités séparément pour leurs tables dédiées.

  // 2. Insérer le nouveau fournisseur dans t_fournisseur
  db.query('INSERT INTO t_fournisseur SET ?', fournisseurData, (err, result) => {
    if (err) {
      console.error('Erreur insertion fournisseur:', err);
      // Supprimer les fichiers uploadés si l'insertion principale échoue
      if (req.files) {
        Object.values(req.files).flat().forEach(file => {
          fs.unlink(file.path, (unlinkErr) => {
            if (unlinkErr) console.error('Erreur suppression fichier:', unlinkErr);
          });
        });
      }
      return res.status(500).json({ error: 'Erreur lors de l\'enregistrement du fournisseur principal' });
    }

    const fournisseurId = result.insertId;

    // 3. Gérer l'insertion des contacts dans t_contact_fournisseur
    const typesContact = req.body.typeContact || [];
    const nomsContact = req.body.nomContact || [];
    const telContact = req.body.telContact || [];
    const mailContact = req.body.mailContact || [];

    // Fonction utilitaire pour s'assurer que les données sont des tableaux
    const ensureArray = (data) => Array.isArray(data) ? data : (data ? [data] : []);

    const contactsToInsert = [];
    const _typesContact = ensureArray(typesContact);
    const _nomsContact = ensureArray(nomsContact);
    const _telContact = ensureArray(telContact);
    const _mailContact = ensureArray(mailContact);

    for (let i = 0; i < _nomsContact.length; i++) { // Itérer sur le nombre de noms de contact
      // S'assurer qu'au moins le nom du contact n'est pas vide
      if (_nomsContact[i] && _nomsContact[i].trim() !== '') {
        contactsToInsert.push([
          fournisseurId,
          _typesContact[i] || null, // Type de contact (principale, facturation, etc.)
          _nomsContact[i],          // Nom du contact
          _telContact[i] || null,   // Téléphone du contact
          _mailContact[i] || null   // Email du contact
        ]);
      }
    }

    // 4. Gérer l'insertion des produits/services dans t_produit_service
    let produitsServicesList = [];
    if (req.body.produitsServices && req.body.produitsServices.trim() !== '') {
      // Sépare par saut de ligne, nettoie les espaces et filtre les lignes vides
      produitsServicesList = req.body.produitsServices.split(/\r?\n/)
                                      .map(p => p.trim())
                                      .filter(p => p !== "");
    }
    const produitsToInsert = produitsServicesList.map(desc => [fournisseurId, desc]);

    // 5. Gérer l'insertion des documents dans t_document_fournisseur
    const documentsToInsert = [];
    if (req.files) {
      // Les fichiers Multer sont dans req.files sous forme d'objet {fieldname: [file objects]}
      ['documentsDemandes', 'documentsFournis'].forEach(typeDoc => {
        if (req.files[typeDoc]) {
          req.files[typeDoc].forEach(file => {
            documentsToInsert.push([
              fournisseurId,
              file.originalname, // Nom original du fichier
              typeDoc,           // Type de document ('documentsDemandes' ou 'documentsFournis')
              file.filename,     // Nom de fichier généré par Multer (pour l'accès futur)
              file.path          // Chemin complet du fichier sur le serveur
            ]);
          });
        }
      });
    }

    // --- Exécution séquentielle des insertions dans les tables liées ---
    // (Utilisation de promesses ou de callbacks en cascade pour s'assurer de l'ordre)

    // Callback pour gérer la fin d'une insertion (simplifie le chaînage)
    const processNext = (err, callback) => {
      if (err) {
        console.error('Erreur lors de l\'insertion d\'une table liée:', err);
        // Ici, on pourrait envisager un rollback ou un nettoyage des insertions précédentes
        // Pour cet exemple, nous renvoyons simplement une erreur au client
        return res.status(500).json({ error: 'Erreur lors de l\'enregistrement des données liées' });
      }
      callback();
    };

    // Insertion des contacts
    const insertContacts = (cb) => {
      if (contactsToInsert.length === 0) return cb();
      const sql = 'INSERT INTO t_contact_fournisseur (fournisseur_id, type_contact, nom, telephone, email) VALUES ?';
      db.query(sql, [contactsToInsert], (err) => processNext(err, cb));
    };

    // Insertion des produits/services
    const insertProduits = (cb) => {
      if (produitsToInsert.length === 0) return cb();
      const sql = 'INSERT INTO t_produit_service (fournisseur_id, description) VALUES ?';
      db.query(sql, [produitsToInsert], (err) => processNext(err, cb));
    };

    // Insertion des documents
    const insertDocuments = (cb) => {
      if (documentsToInsert.length === 0) return cb();
      // On insère le nom original, le type de doc, le nom généré par multer, et le chemin
      const sql = 'INSERT INTO t_document_fournisseur (fournisseur_id, nom_original, type_document, nom_genere, chemin_fichier) VALUES ?';
      db.query(sql, [documentsToInsert], (err) => processNext(err, cb));
    };

    // Chaîne d'exécution: contacts -> produits -> documents
    insertContacts(() => {
      insertProduits(() => {
        insertDocuments(() => {
          // Tout est inséré, renvoyer une réponse de succès
          res.status(201).json({ message: 'Fournisseur, contacts, produits et documents enregistrés avec succès', fournisseurId });
        });
      });
    });
  });
});


// --- Exemple de route GET pour récupérer les fournisseurs (à compléter) ---
// Cette route est cruciale pour le "Cannot GET /fournisseurs"
app.get('/fournisseurs', (req, res) => {
  const sql = 'SELECT * FROM t_fournisseur ORDER BY id DESC';
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Erreur lors de la récupération des fournisseurs:', err);
      return res.status(500).json({ error: 'Erreur lors de la récupération des fournisseurs' });
    }
    // Pour chaque fournisseur, tu pourrais récupérer ses contacts, produits et documents associés
    // C'est souvent mieux de faire des requêtes séparées ou des JOINs complexes si nécessaire
    // ou d'avoir des endpoints dédiés pour les contacts/produits/docs d'un fournisseur spécifique.
    res.json(results);
  });
});

// --- Démarrer le serveur ---
app.listen(port, () => {
  console.log(`Serveur démarré sur http://localhost:${port}`);
});
