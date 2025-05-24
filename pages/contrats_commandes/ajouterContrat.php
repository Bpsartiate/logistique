<div class="modal fade" id="ajouterCommandeModal" tabindex="-1" aria-labelledby="ajouterCommandeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
       <div class="modal-header">
          <h5 class="modal-title" id="ajouterCommandeModalLabel">Ajouter une nouvelle commande</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
          <form id="formAjouterCommande" novalidate>
            <div class="mb-3">
              <label for="clientCommande" class="form-label"><i class="fas fa-user me-1"></i>Client <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="clientCommande" name="client" required />
              <div class="invalid-feedback">Le nom du client est obligatoire.</div>
            </div>
            <div class="mb-3">
              <label for="produitsCommande" class="form-label"><i class="fas fa-box-open me-1"></i>Produits <span class="text-danger">*</span></label>
              <textarea class="form-control" id="produitsCommande" name="produits" rows="2" placeholder="Liste des produits séparés par des virgules" required></textarea>
              <div class="invalid-feedback">Veuillez indiquer au moins un produit.</div>
            </div>
            <div class="mb-3">
              <label for="quantiteCommande" class="form-label"><i class="fas fa-sort-numeric-up me-1"></i>Quantité <span class="text-danger">*</span></label>
              <input type="number" min="1" class="form-control" id="quantiteCommande" name="quantite" required />
              <div class="invalid-feedback">La quantité doit être au moins 1.</div>
            </div>
            <div class="mb-3">
              <label for="adresseCommande" class="form-label"><i class="fas fa-map-marker-alt me-1"></i>Adresse de livraison <span class="text-danger">*</span></label>
              <textarea class="form-control" id="adresseCommande" name="adresse" rows="2" required></textarea>
              <div class="invalid-feedback">L'adresse est obligatoire.</div>
            </div>
            <div class="mb-3">
              <label for="statutCommande" class="form-label"><i class="fas fa-info-circle me-1"></i>Statut <span class="text-danger">*</span></label>
              <select class="form-select" id="statutCommande" name="statut" required>
                <option value="">Sélectionnez un statut</option>
                <option value="En attente">En attente</option>
                <option value="En préparation">En préparation</option>
                <option value="Expédiée">Expédiée</option>
                <option value="Livrée">Livrée</option>
              </select>
              <div class="invalid-feedback">Le statut est obligatoire.</div>
            </div>
            <div class="mb-3">
              <label for="transporteurCommande" class="form-label"><i class="fas fa-truck me-1"></i>Transporteur <span class="text-danger">*</span></label>
              <select class="form-select" id="transporteurCommande" name="transporteur" required>
                <!-- Options ajoutées dynamiquement via JS -->
              </select>
              <div class="invalid-feedback">Le transporteur est obligatoire.</div>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
          <button type="submit" class="btn btn-primary">Enregistrer la commande</button>
          </div>
      </form>
    </div>
  </div>
</div>