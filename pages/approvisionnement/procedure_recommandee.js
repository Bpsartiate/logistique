// Éléments du formulaire
  const montantInput = document.getElementById('budgetEstime');
  const typeSelect = document.getElementById('typeBesoin');
  const procedureInput = document.getElementById('typeProcedure');
  const form = document.getElementById('formBesoin');

// Fonction pour calculer et afficher la procédure recommandée
  function calculerProcedure() {
    const montant = parseFloat(montantInput.value);
    const type = typeSelect.value;

    if (isNaN(montant) || montant < 101 || !type) {
      procedureInput.value = '';
      return;
    }

    let procedure = '';

    if (type === 'Travaux') {
      if (montant >= 3125000) {
        procedure = "Appel d'offre ouvert international";
      } else if (montant >= 75000 && montant < 3125000) {
        procedure = "Appel d'offre ouvert local";
      } else if (montant >= 1250 && montant < 75000) {
        procedure = "Procédure négociée - minimum 3 pro formas";
      } else if (montant >= 101 && montant < 1250) {
        procedure = "Procédure d'une seule quotation (pro forma)";
      } else {
        procedure = "Montant hors plage définie";
      }
    } else if (type === 'Services') {
      if (montant >= 187500) {
        procedure = "Appel d'offre ouvert international";
      } else if (montant >= 75000 && montant < 187500) {
        procedure = "Appel d'offre ouvert local";
      } else if (montant >= 1250 && montant < 75000) {
        procedure = "Procédure négociée - minimum 3 pro formas";
      } else if (montant >= 101 && montant < 1250) {
        procedure = "Procédure d'une seule quotation (pro forma)";
      } else {
        procedure = "Montant hors plage définie";
      }
    } else if (type === 'Biens') {
      if (montant >= 187500) {
        procedure = "Appel d'offre ouvert international";
      } else if (montant >= 75000 && montant < 187500) {
        procedure = "Appel d'offre ouvert local";
      } else if (montant >= 1250 && montant < 75000) {
        procedure = "Procédure négociée - minimum 3 pro formas";
      } else if (montant >= 101 && montant < 1250) {
        procedure = "Procédure d'une seule quotation (pro forma)";
      } else {
        procedure = "Montant hors plage définie";
      }
    } 
    else {
      procedure = "Type non reconnu";
    }

    procedureInput.value = procedure;
  }

  // Ajout des écouteurs d'événements
  montantInput.addEventListener('input', () => {
    calculerProcedure();
  });
  typeSelect.addEventListener('change', () => {
    calculerProcedure();
  });