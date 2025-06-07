// Initialisation des modals Bootstrap
const afficherModal = new bootstrap.Modal(document.getElementById('afficherCommandeModal'));
const modifierModal = new bootstrap.Modal(document.getElementById('modifierCommandeModal'));

// Remplir le select transporteur du modal modifier (même liste que pour l’ajout)
const modifierTransporteurSelect = document.getElementById('modifierTransporteur');
transporteurs.forEach(t => {
  const option = document.createElement('option');
  option.value = t;
  option.textContent = t;
  modifierTransporteurSelect.appendChild(option);
});

// Fonction pour afficher les détails dans le modal afficher
window.voirCommande = function(numero) {
  const cmd = commandes.find(c => c.numero === numero);
  if (!cmd) return alert('Commande non trouvée');

  document.getElementById('detailNumero').textContent = cmd.numero;
  document.getElementById('detailClient').textContent = cmd.client;
  document.getElementById('detailProduits').textContent = cmd.produits;
  document.getElementById('detailQuantite').textContent = cmd.quantite;
  document.getElementById('detailAdresse').textContent = cmd.adresse;
  document.getElementById('detailStatut').innerHTML = getStatutBadge(cmd.statut);
  document.getElementById('detailTransporteur').textContent = cmd.transporteur;

  afficherModal.show();
};

// Fonction pour ouvrir modal modifier avec données pré-remplies
window.modifierCommande = function(numero) {
  const cmd = commandes.find(c => c.numero === numero);
  if (!cmd) return alert('Commande non trouvée');

  document.getElementById('modifierNumero').value = cmd.numero;
  document.getElementById('modifierClient').value = cmd.client;
  document.getElementById('modifierProduits').value = cmd.produits;
  document.getElementById('modifierQuantite').value = cmd.quantite;
  document.getElementById('modifierAdresse').value = cmd.adresse;
  document.getElementById('modifierStatut').value = cmd.statut;
  document.getElementById('modifierTransporteur').value = cmd.transporteur;

  modifierModal.show();
};

// Gestion du formulaire de modification
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
  if (index === -1) return alert('Commande non trouvée');

  commandes[index] = { numero, client, produits, quantite, adresse, statut, transporteur };

  updateCommandesList();

  formModifier.classList.remove('was-validated');
  modifierModal.hide();
});
