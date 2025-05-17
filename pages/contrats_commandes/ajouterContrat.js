document.addEventListener('DOMContentLoaded', () => {
  // Récupère le formulaire et le modal
  const form = document.getElementById('formAjouterContrat');
  const modalElement = document.getElementById('ajouterContratModal');
  const modal = new bootstrap.Modal(modalElement);

  // Trouve la liste List.js des contrats déjà initialisée ailleurs
  // Si elle n'est pas globale, rends-la accessible (exemple : window.contratsList)
  let contratsList = window.contratsList;

  // Si tu as stocké tes contrats dans un tableau JS, récupère-le aussi
  let contrats = window.contrats;

  form.addEventListener('submit', function(event) {
    event.preventDefault();
    event.stopPropagation();

    // Validation Bootstrap native
    if (!form.checkValidity()) {
      form.classList.add('was-validated');
      return;
    }

    // Création du nouveau contrat à partir du formulaire
    const nouveauContrat = {
      id: Date.now(), // ID temporaire unique
      numero: form.numero.value.trim(),
      fournisseur: form.fournisseur.value.trim(),
      dateDebut: form.dateDebut.value,
      dateFin: form.dateFin.value,
      montant: parseFloat(form.montant.value),
      statut: form.statut.value,
      description: form.description.value.trim()
    };

    // Ajout dans le tableau JS (optionnel, utile si tu utilises ce tableau ailleurs)
    if (contrats) {
      contrats.push(nouveauContrat);
    }

    // Ajout dynamique dans List.js (affiche dans le tableau)
    if (contratsList) {
      contratsList.add({
        numero: nouveauContrat.numero,
        fournisseur: nouveauContrat.fournisseur,
        dateDebut: nouveauContrat.dateDebut,
        dateFin: nouveauContrat.dateFin,
        montant: nouveauContrat.montant.toLocaleString(),
        statut: nouveauContrat.statut,
        actions: ''
      });
      // Tu peux aussi re-déclencher l'ajout des boutons d'action si besoin
      if (typeof window.addContratActions === 'function') {
        window.addContratActions();
      }
    }

    // Réinitialise le formulaire
    form.reset();
    form.classList.remove('was-validated');

    // Ferme le modal
    modal.hide();

    // Optionnel : message de succès
    // alert(`Contrat "${nouveauContrat.numero}" ajouté avec succès !`);
  });

  // (Optionnel) Réinitialise le formulaire à l'ouverture du modal
  modalElement.addEventListener('show.bs.modal', () => {
    form.reset();
    form.classList.remove('was-validated');
  });
});
