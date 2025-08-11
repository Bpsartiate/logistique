window.app = Vue.createApp({
  data() {
    return {
      fournisseur: {},
      fournisseurCopy: {},
      estEnEdition: false,
      // autres données...
    };
  },
  methods: {
    ouvrirModalFournisseur(data) {
      this.fournisseur = JSON.parse(JSON.stringify(data)); // clone profond pour édition
      this.fournisseurCopy = JSON.parse(JSON.stringify(data)); // copie pour annuler
      this.estEnEdition = false;
      // Ouvre la modale Bootstrap
      const modalEl = document.getElementById('ficheFournisseur');
      const modalInstance = bootstrap.Modal.getOrCreateInstance(modalEl);
      modalInstance.show();
      // Optionnel : charger données complémentaires (évaluations, documents...)
      this.chargerDonneesSupplementaires();
    },
    // Ta fonction pour charger évaluations, documents, incidents...
    chargerDonneesSupplementaires() { /* ... */ },
    // autres méthodes...
  }
}).mount('#app');
