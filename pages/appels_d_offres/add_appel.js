document.addEventListener('DOMContentLoaded', () => {
  // Liste exemple des fournisseurs (à remplacer par ta source réelle)
  const fournisseurs = [
    { id: 1, nom: 'Fournisseur A' },
    { id: 2, nom: 'Fournisseur B' },
    { id: 3, nom: 'Fournisseur C' }
  ];

  // Remplissage du select multiple fournisseurs invités
  const selectFournisseurs = document.getElementById('fournisseursInvitesAO');
  fournisseurs.forEach(f => {
    const option = document.createElement('option');
    option.value = f.id;
    option.textContent = f.nom;
    selectFournisseurs.appendChild(option);
  });

  // Éléments du formulaire
  const montantInput = document.getElementById('montantEstime');
  const typeSelect = document.getElementById('typeAO');
  const procedureInput = document.getElementById('procedureRecommandee');
  const form = document.getElementById('formLancerAO');

  // Critères de sélection
  const criterePrix = document.getElementById('criterePrix');
  const critereDelai = document.getElementById('critereDelai');
  const critereQualite = document.getElementById('critereQualite');
  const critereGarantie = document.getElementById('critereGarantie');
  const critereInputs = [criterePrix, critereDelai, critereQualite, critereGarantie];

  // Création d'un élément pour afficher la somme des critères
  const sommeDisplay = document.createElement('div');
  sommeDisplay.classList.add('mb-3', 'fw-bold');
  criterePrix.parentElement.parentElement.appendChild(sommeDisplay);

  // Fonction pour calculer et afficher la procédure recommandée
  function calculerProcedure() {
    const montant = parseFloat(montantInput.value);
    const type = typeSelect.value;

    if (isNaN(montant) || montant < 125 || !type) {
      procedureInput.value = '';
      return;
    }

    let procedure = '';

    if (type === 'Travaux') {
      if (montant >= 87500 && montant <= 3125000) {
        procedure = "Appel d'offre ouvert international";
      } else if (montant < 87500) {
        procedure = "Montant insuffisant pour appel d'offre ouvert international";
      } else {
        procedure = "Montant hors plage définie";
      }
    } else if (type === 'Fourniture' || type === 'Service') {
      if (montant >= 125 && montant < 1250) {
        procedure = "Procédure d'une seule quotation (pro forma)";
      } else if (montant >= 1250 && montant < 75000) {
        procedure = "Procédure négociée - minimum 3 pro forma";
      } else if (montant >= 75000 && montant < 187500) {
        procedure = "Appel d'offre ouvert local";
      } else if (montant >= 187500 && montant <= 3125000) {
        procedure = "Appel d'offre ouvert international";
      } else {
        procedure = "Montant hors plage définie";
      }
    } else {
      procedure = "Type non reconnu";
    }

    procedureInput.value = procedure;
  }

  // Fonction pour mettre à jour la somme des critères et afficher un indicateur
  function majSomme() {
    let somme = 0;
    critereInputs.forEach(input => {
      somme += parseFloat(input.value) || 0;
    });
    sommeDisplay.textContent = `Somme actuelle : ${somme.toFixed(2)}%` + (Math.abs(somme - 100) > 0.01 ? ' ❌ La somme doit être égale à 100%' : ' ✅');
  }

  // Ajout des écouteurs d'événements
  montantInput.addEventListener('input', () => {
    calculerProcedure();
  });
  typeSelect.addEventListener('change', () => {
    calculerProcedure();
  });
  critereInputs.forEach(input => {
    input.addEventListener('input', majSomme);
  });

  // Validation et soumission du formulaire
  form.addEventListener('submit', function(e) {
    e.preventDefault();

    if (!form.checkValidity()) {
      form.classList.add('was-validated');
      return;
    }

    // Vérification stricte de la somme des critères
    let somme = 0;
    critereInputs.forEach(input => {
      somme += parseFloat(input.value) || 0;
    });

    if (Math.abs(somme - 100) > 0.01) {
      alert('La somme des critères de sélection doit être égale à 100%.');
      return;
    }

    // Ici, tu peux ajouter l'envoi des données vers le backend via AJAX ou autre

    alert('Appel d\'offre lancé avec succès !');

    // Réinitialisation du formulaire et fermeture du modal
    bootstrap.Modal.getInstance(document.getElementById('modalLancerAO')).hide();
    form.reset();
    form.classList.remove('was-validated');
    procedureInput.value = '';
    majSomme();
  });

  // Initialisation des affichages
  calculerProcedure();
  majSomme();
});
