document.addEventListener('DOMContentLoaded', () => {
  const livraisonModal = new bootstrap.Modal(document.getElementById('livraisonModal'));
  const formLivraison = document.getElementById('formLivraison');

  let livraisons = [
    { numero: '#LD1234', client: 'Jean Dupont', adresse: '10 rue de la Paix, Paris', datePrevue: '2025-05-17', statut: 'Livré', commentaire: '' },
    { numero: '#LD1235', client: 'Marie Curie', adresse: '25 avenue des Champs, Lyon', datePrevue: '2025-05-18', statut: 'En cours', commentaire: '' },
    { numero: '#LD1236', client: 'Paul Martin', adresse: '5 boulevard Saint-Michel, Paris', datePrevue: '2025-05-19', statut: 'Retard', commentaire: '' }
  ];

  function getBadgeWithIcon(statut) {
    switch(statut) {
      case 'Livré':
        return `<span class="badge bg-success"><i class="fas fa-check-circle me-1"></i>Livré</span>`;
      case 'En cours':
        return `<span class="badge bg-warning text-dark"><i class="fas fa-spinner fa-spin me-1"></i>En cours</span>`;
      case 'Retard':
        return `<span class="badge bg-danger"><i class="fas fa-exclamation-triangle me-1"></i>Retard</span>`;
      case 'Annulé':
        return `<span class="badge bg-secondary"><i class="fas fa-ban me-1"></i>Annulé</span>`;
      default:
        return `<span class="badge bg-light text-dark">${statut}</span>`;
    }
  }

  window.ouvrirModalLivraison = function(numero) {
    const livraison = livraisons.find(l => l.numero === numero);
    if (!livraison) {
      alert('Livraison non trouvée');
      return;
    }
    formLivraison.numero.value = livraison.numero;
    formLivraison.client.value = livraison.client;
    formLivraison.adresse.value = livraison.adresse;
    formLivraison.datePrevue.value = livraison.datePrevue;
    formLivraison.statut.value = livraison.statut;
    formLivraison.commentaire.value = livraison.commentaire;
    livraisonModal.show();
  };

  window.annulerLivraison = function(numero) {
    if (confirm(`Voulez-vous vraiment annuler la livraison ${numero} ?`)) {
      const index = livraisons.findIndex(l => l.numero === numero);
      if (index !== -1) {
        livraisons[index].statut = 'Annulé';
        livraisons[index].commentaire += '\nLivraison annulée par l\'utilisateur.';
        alert(`Livraison ${numero} annulée.`);
        updateList();
      }
    }
  };

  formLivraison.addEventListener('submit', (e) => {
    e.preventDefault();
    const numero = formLivraison.numero.value;
    const index = livraisons.findIndex(l => l.numero === numero);
    if (index === -1) {
      alert('Erreur : livraison non trouvée');
      return;
    }
    livraisons[index] = {
      numero,
      client: formLivraison.client.value.trim(),
      adresse: formLivraison.adresse.value.trim(),
      datePrevue: formLivraison.datePrevue.value,
      statut: formLivraison.statut.value,
      commentaire: formLivraison.commentaire.value.trim()
    };
    alert('Livraison mise à jour avec succès !');
    livraisonModal.hide();
    updateList();
  });

  let options = {
    valueNames: ['numero', 'client', 'adresse', 'datePrevue', 'statut'],
    page: 5,
    pagination: true,
    item: `<tr>
      <td class="numero"></td>
      <td class="client"></td>
      <td class="adresse"></td>
      <td class="datePrevue"></td>
      <td class="statut"></td>
      <td class="actions"></td>
    </tr>`
  };

  let livraisonsList = new List('livraisonsList', options);

  function updateList() {
    livraisonsList.clear();
    livraisons.forEach(l => {
      livraisonsList.add({
        numero: l.numero,
        client: l.client,
        adresse: l.adresse,
        datePrevue: l.datePrevue,
        statut: getBadgeWithIcon(l.statut),
        actions: '' // On gère manuellement après
      });
    });

    // Maintenant on ajoute manuellement les boutons dans la colonne Actions
    document.querySelectorAll('#livraisonsList tbody tr').forEach((tr, i) => {
      const actionTd = tr.querySelector('.actions');
      const livraison = livraisons[i];
      actionTd.innerHTML = `
        <button class="btn btn-sm btn-primary" title="Détails" aria-label="Voir détails livraison ${livraison.numero}" onclick="ouvrirModalLivraison('${livraison.numero}')">
          <i class="fas fa-eye"></i>
        </button>
        <button class="btn btn-sm btn-warning" title="Modifier" aria-label="Modifier livraison ${livraison.numero}" onclick="ouvrirModalLivraison('${livraison.numero}')">
          <i class="fas fa-edit"></i>
        </button>
        <button class="btn btn-sm btn-danger" title="Annuler" aria-label="Annuler livraison ${livraison.numero}" onclick="annulerLivraison('${livraison.numero}')">
          <i class="fas fa-times"></i>
        </button>
      `;
    });
  }

  updateList();
});
