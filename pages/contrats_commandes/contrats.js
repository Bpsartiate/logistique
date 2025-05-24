document.addEventListener('DOMContentLoaded', () => {
  // --- Toast Bootstrap ---
  function showToast(message, type = 'primary') {
    const toastEl = document.getElementById('mainToast');
    const toastBody = document.getElementById('mainToastBody');
    toastBody.textContent = message;
    toastEl.className = `toast align-items-center text-bg-${type} border-0`;
    toastBody.setAttribute('role', 'status');
    toastBody.setAttribute('aria-live', 'polite');
    const toast = new bootstrap.Toast(toastEl, { delay: 3500 });
    toast.show();
  }

  // --- Données transporteurs et commandes ---
  const transporteurs = [
    'TransExpress',
    'LogiFast',
    'Speedy Delivery'
  ];

  let commandes = [
    {
      numero: '#CMD001',
      client: 'Alice Dupont',
      produits: 'Produit A, Produit B',
      quantite: 10,
      adresse: '123 rue Exemple, Goma',
      statut: 'En attente',
      transporteur: 'TransExpress'
    },
    {
      numero: '#CMD002',
      client: 'Bob Martin',
      produits: 'Produit C',
      quantite: 5,
      adresse: '456 avenue Exemple, Goma',
      statut: 'Expédiée',
      transporteur: 'LogiFast'
    }
  ];

  // --- Remplir les selects transporteur (ajout et modification) ---
  const selectTransporteur = document.getElementById('transporteurCommande');
  transporteurs.forEach(t => {
    const option = document.createElement('option');
    option.value = t;
    option.textContent = t;
    selectTransporteur.appendChild(option);
  });
  const modifierTransporteurSelect = document.getElementById('modifierTransporteur');
  transporteurs.forEach(t => {
    const option = document.createElement('option');
    option.value = t;
    option.textContent = t;
    modifierTransporteurSelect.appendChild(option);
  });

  // --- Initialisation List.js avec template ---
  const commandesList = new List('commandesTable', {
    valueNames: ['numero', 'client', 'produits', 'quantite', 'adresse', 'statut', 'transporteur'],
    page: 5,
    pagination: true,
    item: `<tr>
      <td class="numero"></td>
      <td class="client"></td>
      <td class="produits"></td>
      <td class="quantite"></td>
      <td class="adresse"></td>
      <td class="statut"></td>
      <td class="transporteur"></td>
      <td class="actions"></td>
    </tr>`
  });

  // --- Badge statut avec icône ---
  function getStatutBadge(statut) {
    switch (statut) {
      case 'En attente':
        return '<span class="badge bg-warning text-dark"><i class="fas fa-hourglass-half me-1"></i>En attente</span>';
      case 'En préparation':
        return '<span class="badge bg-info text-white"><i class="fas fa-tools me-1"></i>En préparation</span>';
      case 'Expédiée':
        return '<span class="badge bg-primary"><i class="fas fa-truck me-1"></i>Expédiée</span>';
      case 'Livrée':
        return '<span class="badge bg-success"><i class="fas fa-check-circle me-1"></i>Livrée</span>';
      default:
        return `<span class="badge bg-secondary">${statut}</span>`;
    }
  }

  // --- Mise à jour du tableau ---
  function updateCommandesList() {
    commandesList.clear();
    commandes.forEach(c => {
      commandesList.add({
        numero: c.numero,
        client: c.client,
        produits: c.produits,
        quantite: c.quantite,
        adresse: c.adresse,
        statut: c.statut, // on injectera le badge manuellement
        transporteur: c.transporteur,
        actions: '' // on gère manuellement
      });
    });

    // Injection manuelle des badges et actions
    document.querySelectorAll('#commandesTable tbody tr').forEach((tr, i) => {
      const tds = tr.querySelectorAll('td');
      if (tds.length && commandes[i]) {
        tds[5].innerHTML = getStatutBadge(commandes[i].statut);
        tds[7].innerHTML = `
          <button class="btn btn-sm btn-primary" title="Voir" onclick="voirCommande('${commandes[i].numero}')"><i class="fas fa-eye"></i></button>
          <button class="btn btn-sm btn-warning" title="Modifier" onclick="modifierCommande('${commandes[i].numero}')"><i class="fas fa-edit"></i></button>
          <button class="btn btn-sm btn-danger" title="Supprimer" onclick="confirmerSuppressionCommande('${commandes[i].numero}')"><i class="fas fa-trash"></i></button>
        `;
      }
    });
  }

  // --- Formulaire d'ajout ---
  const formCommande = document.getElementById('formAjouterCommande');
  formCommande.addEventListener('submit', e => {
    e.preventDefault();
    if (!formCommande.checkValidity()) {
      formCommande.classList.add('was-validated');
      return;
    }
    const client = document.getElementById('clientCommande').value.trim();
    const produits = document.getElementById('produitsCommande').value.trim();
    const quantite = parseInt(document.getElementById('quantiteCommande').value, 10);
    const adresse = document.getElementById('adresseCommande').value.trim();
    const statut = document.getElementById('statutCommande').value;
    const transporteur = document.getElementById('transporteurCommande').value;
    const numero = '#CMD' + String(commandes.length + 1).padStart(3, '0');

    commandes.push({ numero, client, produits, quantite, adresse, statut, transporteur });
    updateCommandesList();

    formCommande.reset();
    formCommande.classList.remove('was-validated');
    bootstrap.Modal.getInstance(document.getElementById('ajouterCommandeModal')).hide();
    showToast('Commande ajoutée avec succès !', 'success');
  });

  // --- Modals Bootstrap ---
  const afficherModal = new bootstrap.Modal(document.getElementById('afficherCommandeModal'));
  const modifierModal = new bootstrap.Modal(document.getElementById('modifierCommandeModal'));

  // --- Afficher commande ---
  window.voirCommande = function(numero) {
    const cmd = commandes.find(c => c.numero === numero);
    if (!cmd) {
      showToast('Commande non trouvée.', 'warning');
      return;
    }
    document.getElementById('detailNumero').textContent = cmd.numero;
    document.getElementById('detailClient').textContent = cmd.client;
    document.getElementById('detailProduits').textContent = cmd.produits;
    document.getElementById('detailQuantite').textContent = cmd.quantite;
    document.getElementById('detailAdresse').textContent = cmd.adresse;
    document.getElementById('detailStatut').innerHTML = getStatutBadge(cmd.statut);
    document.getElementById('detailTransporteur').textContent = cmd.transporteur;
    afficherModal.show();
  };

  // --- Modifier commande ---
  window.modifierCommande = function(numero) {
    const cmd = commandes.find(c => c.numero === numero);
    if (!cmd) {
      showToast('Commande non trouvée.', 'warning');
      return;
    }
    document.getElementById('modifierNumero').value = cmd.numero;
    document.getElementById('modifierClient').value = cmd.client;
    document.getElementById('modifierProduits').value = cmd.produits;
    document.getElementById('modifierQuantite').value = cmd.quantite;
    document.getElementById('modifierAdresse').value = cmd.adresse;
    document.getElementById('modifierStatut').value = cmd.statut;
    document.getElementById('modifierTransporteur').value = cmd.transporteur;
    modifierModal.show();
  };

  // --- Formulaire de modification ---
  const formModifier = document.getElementById('formModifierCommande');
  formModifier.addEventListener('submit', e => {
    e.preventDefault();
    if (!formModifier.checkValidity()) {
      formModifier.classList.add('was-validated');
      return;
    }
    const numero = document.getElementById('modifierNumero').value;
    const client = document.getElementById('modifierClient').value.trim();
    const produits = document.getElementById('modifierProduits').value.trim();
    const quantite = parseInt(document.getElementById('modifierQuantite').value, 10);
    const adresse = document.getElementById('modifierAdresse').value.trim();
    const statut = document.getElementById('modifierStatut').value;
    const transporteur = document.getElementById('modifierTransporteur').value;

    const index = commandes.findIndex(c => c.numero === numero);
    if (index === -1) {
      showToast('Commande non trouvée.', 'danger');
      return;
    }
    commandes[index] = { numero, client, produits, quantite, adresse, statut, transporteur };
    updateCommandesList();

    formModifier.classList.remove('was-validated');
    modifierModal.hide();
    showToast('Commande modifiée avec succès !', 'info');
  });

  // --- Modal confirmation suppression ---
  const confirmationModal = new bootstrap.Modal(document.getElementById('confirmationSuppressionModal'));
  const commandeASupprimerText = document.getElementById('commandeASupprimer');
  const btnConfirmerSuppression = document.getElementById('btnConfirmerSuppression');
  let numeroCommandeASupprimer = null;

  window.confirmerSuppressionCommande = function(numero) {
    numeroCommandeASupprimer = numero;
    commandeASupprimerText.textContent = `Commande ${numero}`;
    confirmationModal.show();
  };

  btnConfirmerSuppression.addEventListener('click', () => {
    if (!numeroCommandeASupprimer) return;
    commandes = commandes.filter(c => c.numero !== numeroCommandeASupprimer);
    updateCommandesList();
    confirmationModal.hide();
    showToast(`La commande ${numeroCommandeASupprimer} a été supprimée.`, 'danger');
    numeroCommandeASupprimer = null;
  });

  // --- Initialisation de la liste au chargement ---
  updateCommandesList();
});
