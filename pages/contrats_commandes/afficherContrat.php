<!-- Modal Afficher Commande -->
<div class="modal fade" id="afficherCommandeModal" tabindex="-1" aria-labelledby="afficherCommandeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="afficherCommandeModalLabel">Détails de la commande</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">
        <dl class="row">
          <dt class="col-sm-4">Numéro</dt>
          <dd class="col-sm-8" id="detailNumero"></dd>

          <dt class="col-sm-4">Client</dt>
          <dd class="col-sm-8" id="detailClient"></dd>

          <dt class="col-sm-4">Produits</dt>
          <dd class="col-sm-8" id="detailProduits"></dd>

          <dt class="col-sm-4">Quantité</dt>
          <dd class="col-sm-8" id="detailQuantite"></dd>

          <dt class="col-sm-4">Adresse de livraison</dt>
          <dd class="col-sm-8" id="detailAdresse"></dd>

          <dt class="col-sm-4">Statut</dt>
          <dd class="col-sm-8" id="detailStatut"></dd>

          <dt class="col-sm-4">Transporteur</dt>
          <dd class="col-sm-8" id="detailTransporteur"></dd>
        </dl>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Modifier Commande -->
<div class="modal fade" id="modifierCommandeModal" tabindex="-1" aria-labelledby="modifierCommandeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modifierCommandeModalLabel">Modifier la commande</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
          <!-- form -->
        <form id="formModifierCommande" novalidate>
          <input type="hidden" id="modifierNumero" name="numero" />
          <div class="mb-3">
            <label for="modifierClient" class="form-label">Client <span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="modifierClient" name="client" required />
            <div class="invalid-feedback">Le nom du client est obligatoire.</div>
          </div>
          <div class="mb-3">
            <label for="modifierProduits" class="form-label">Produits <span class="text-danger">*</span></label>
            <textarea class="form-control" id="modifierProduits" name="produits" rows="2" required></textarea>
            <div class="invalid-feedback">Veuillez indiquer au moins un produit.</div>
          </div>
          <div class="mb-3">
            <label for="modifierQuantite" class="form-label">Quantité <span class="text-danger">*</span></label>
            <input type="number" min="1" class="form-control" id="modifierQuantite" name="quantite" required />
            <div class="invalid-feedback">La quantité doit être au moins 1.</div>
          </div>
          <div class="mb-3">
            <label for="modifierAdresse" class="form-label">Adresse de livraison <span class="text-danger">*</span></label>
            <textarea class="form-control" id="modifierAdresse" name="adresse" rows="2" required></textarea>
            <div class="invalid-feedback">L'adresse est obligatoire.</div>
          </div>
          <div class="mb-3">
            <label for="modifierStatut" class="form-label">Statut <span class="text-danger">*</span></label>
            <select class="form-select" id="modifierStatut" name="statut" required>
              <option value="">Sélectionnez un statut</option>
              <option value="En attente">En attente</option>
              <option value="En préparation">En préparation</option>
              <option value="Expédiée">Expédiée</option>
              <option value="Livrée">Livrée</option>
            </select>
            <div class="invalid-feedback">Le statut est obligatoire.</div>
          </div>
          <div class="mb-3">
            <label for="modifierTransporteur" class="form-label">Transporteur <span class="text-danger">*</span></label>
            <select class="form-select" id="modifierTransporteur" name="transporteur" required>
              <!-- Options ajoutées dynamiquement via JS -->
            </select>
            <div class="invalid-feedback">Le transporteur est obligatoire.</div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
          <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
        </div>
      </form>
    </div>
  </div>
</div>
