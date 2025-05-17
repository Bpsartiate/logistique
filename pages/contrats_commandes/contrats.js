document.addEventListener('DOMContentLoaded', () => {

  // Données simulées
  const contrats = [
    { id: 1, numero: 'C-2025-001', fournisseur: 'Société Alpha', dateDebut: '2025-01-01', dateFin: '2025-12-31', montant: 100000, statut: 'En cours' },
    { id: 2, numero: 'C-2025-002', fournisseur: 'Fournisseur Beta', dateDebut: '2025-03-15', dateFin: '2026-03-14', montant: 50000, statut: 'En cours' }
  ];

  const commandes = [
    { id: 1, contratId: 1, numero: 'CMD-001', dateCommande: '2025-02-01', dateLivraison: '2025-02-28', montant: 20000, statut: 'Livrée' },
    { id: 2, contratId: 1, numero: 'CMD-002', dateCommande: '2025-05-10', dateLivraison: '2025-06-10', montant: 30000, statut: 'En attente' },
    { id: 3, contratId: 2, numero: 'CMD-003', dateCommande: '2025-04-01', dateLivraison: '2025-04-30', montant: 15000, statut: 'Livrée' }
  ];

  // Initialisation List.js contrats (inchangé)
  const contratsList = new List('contratsTable', {
    valueNames: ['numero', 'fournisseur', 'dateDebut', 'dateFin', 'montant', 'statut', 'actions'],
    page: 5,
    pagination: true,
    item: `<tr>
      <td class="numero"></td>
      <td class="fournisseur"></td>
      <td class="dateDebut"></td>
      <td class="dateFin"></td>
      <td class="montant"></td>
      <td class="statut"></td>
      <td class="actions"></td>
    </tr>`
  }, contrats);

  // Ajout des boutons actions dans contrats
 window.addContratActions = function() {
  const rows = document.querySelectorAll('#contratsTable tbody.list tr');
  rows.forEach((tr, i) => {
    const td = tr.querySelector('td.actions');
    if (!td) return;
    // On suppose que tu as un tableau global "contrats" synchronisé avec List.js
    const contrat = window.contrats && window.contrats[i] ? window.contrats[i] : null;
    const id = contrat ? contrat.id : Date.now() + i; // fallback temporaire
    td.innerHTML = `
        <i class="fas text-primary fa-eye me-2" title="Voir détails" aria-label="Voir détails contrat ${contrats[i].numero}" onclick="showContratDetailModal(${contrats[i].id})"></i>
        <i class="fas text-warning fa-edit me-2" title="Modifier" aria-label="Modifier" onclick="modifierContrat(${id})"></i>
        <i class="fas text-danger fa-trash" title="Supprimer" aria-label="Supprimer" onclick="supprimerContrat(${id})"></i>
    `;
  });
};
  contratsList.on('updated', addContratActions);
  addContratActions();

  // Variable pour List.js commandes dans modal
  let commandesListModal;

  // Fonction pour afficher le modal avec détail contrat + commandes
  window.showContratDetailModal = function(id) {
    const contrat = contrats.find(c => c.id === id);
    if (!contrat) {
      alert('Contrat non trouvé');
      return;
    }

    // Injecter les infos contrat dans modal
    const detailDiv = document.getElementById('contratDetail');
    detailDiv.innerHTML = `
      <p><strong><i class="fas text-primary fa-file-contract fs-2 me-2"></i>Numéro :</strong> ${contrat.numero}</p>
      <p><strong><i class="fas  text-danger fa-industry fs-2 me-2"></i>Fournisseur :</strong> ${contrat.fournisseur}</p>
      <p><strong><i class="fas text-success fa-calendar-alt fs-2 me-2"></i>Durée :</strong> ${contrat.dateDebut} à ${contrat.dateFin}</p>
      <p><strong><i class="fas text-warning fa-dollar-sign fs-2 me-2"></i>Montant :</strong> ${contrat.montant.toLocaleString()} $</p>
      <p><strong><i class="fas  text-success fa-info-circle fs-2 me-2"></i>Statut :</strong> ${contrat.statut}</p>
    `;

    // Filtrer commandes associées
    const commandesAssoc = commandes.filter(cmd => cmd.contratId === id);

    // Initialiser ou rafraîchir List.js commandes dans modal
    if (!commandesListModal) {
      commandesListModal = new List('commandesTableModal', {
        valueNames: ['numero', 'dateCommande', 'dateLivraison', 'montant', 'statut', 'actions'],
        page: 5,
        pagination: true,
        item: `<tr>
          <td class="numero"></td>
          <td class="dateCommande"></td>
          <td class="dateLivraison"></td>
          <td class="montant"></td>
          <td class="statut"></td>
          <td class="actions"></td>
        </tr>`
      });
      commandesListModal.on('updated', addCommandeActionsModal);
    }

    commandesListModal.clear();

    if (commandesAssoc.length === 0) {
      const tbody = document.querySelector('#commandesTableModal tbody.list');
      tbody.innerHTML = `<tr><td colspan="6" class="text-center fst-italic">Aucune commande associée</td></tr>`;
    } else {
      commandesAssoc.forEach(cmd => {
        commandesListModal.add({
          numero: cmd.numero,
          dateCommande: cmd.dateCommande,
          dateLivraison: cmd.dateLivraison,
          montant: cmd.montant.toLocaleString(),
          statut: cmd.statut,
          actions: ''
        });
      });
      commandesListModal.sort('numero', { order: "asc" });
      addCommandeActionsModal();
    }

    // Afficher le modal Bootstrap
    const modal = new bootstrap.Modal(document.getElementById('contratDetailModal'));
    modal.show();
  };

  // Ajout des boutons actions dans commandes modal
  function addCommandeActionsModal() {
    const rows = document.querySelectorAll('#commandesTableModal tbody.list tr');
    rows.forEach((tr, i) => {
      const td = tr.querySelector('td.actions');
      if (!td) return;
      const item = commandesListModal.items[i];
      td.innerHTML = `
        <button class="btn btn-sm btn-info" title="Détails commande" aria-label="Détails commande ${item.values().numero}" onclick="alert('Détail commande ${item.values().numero}')">
          <i class="fas fa-info-circle"></i>
        </button>
      `;
    });
  }

});
