<!-- Modal Détail / Modification Livraison -->
<div class="modal fade" id="livraisonModal" tabindex="-1" aria-labelledby="livraisonModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
         <div class="modal-header">
          <h5 class="modal-title" id="livraisonModalLabel">Détails de la livraison</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
        <form id="formLivraison">           
            <!-- Champs du formulaire -->
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="numeroLivraison" class="form-label">Numéro de livraison</label>
                    <input type="text" class="form-control" id="numeroLivraison" name="numero" readonly />
                </div>
                <div class="col-md-6 mb-3">
                    <label for="clientLivraison" class="form-label">Client</label>
                    <input type="text" class="form-control" id="clientLivraison" name="client" required />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="adresseLivraison" class="form-label">Adresse de livraison</label>
                    <textarea class="form-control" id="adresseLivraison" name="adresse" rows="2" required></textarea>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="datePrevueLivraison" class="form-label">Date prévue</label>
                    <input type="date" class="form-control" id="datePrevueLivraison" name="datePrevue" required />
                </div>
            </div>
            <div class="mb-3">
                <label for="statutLivraison" class="form-label">Statut</label>
                <select class="form-select" id="statutLivraison" name="statut" required>
                <option value="En cours">En cours</option>
                <option value="Livré">Livré</option>
                <option value="Retard">Retard</option>
                <option value="Annulé">Annulé</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="commentaireLivraison" class="form-label">Commentaire</label>
                <textarea class="form-control" id="commentaireLivraison" name="commentaire" rows="3" placeholder="Ajouter un commentaire..."></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                <button type="submit" class="btn btn-primary">Enregistrer</button>
            </div>
        </form>
    </div>

    </div>
  </div>
</div>
