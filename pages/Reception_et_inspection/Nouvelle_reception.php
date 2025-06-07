<div class="modal fade" id="modalNouvelleReception" tabindex="-1" aria-labelledby="modalNouvelleReceptionLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form id="formNouvelleReception" novalidate>
        <div class="modal-header">
          <h5 class="modal-title" id="modalNouvelleReceptionLabel">Nouvelle réception</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row g-3">
              <div class="col-md-6">
                <label for="commandeReception" class="form-label">Bon de commande <span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="commandeReception" name="commandeReception" required />
                <div class="invalid-feedback">Ce champ est obligatoire.</div>
              </div>
              <div class="col-md-6">
                <label for="fournisseurReception" class="form-label">Fournisseur <span class="text-danger">*</span></label>
                <select id="fournisseurReception" name="fournisseurReception" class="form-select" required>
                  <option value="">Sélectionner un fournisseur</option>
                  <option value="1">Fournisseur A</option>
                  <option value="2">Fournisseur B</option>
                  <option value="3">Fournisseur C</option>
                </select>
                <div class="invalid-feedback">Veuillez sélectionner un fournisseur.</div>
              </div>
              <div class="col-md-6">
                <label for="dateReception" class="form-label">Date de réception <span class="text-danger">*</span></label>
                <input type="date" class="form-control" id="dateReception" name="dateReception" required />
                <div class="invalid-feedback">Ce champ est obligatoire.</div>
              </div>
              <div class="col-md-6">
                <label for="transporteurReception" class="form-label">Transporteur</label>
                <select id="transporteurReception" name="transporteurReception" class="form-select">
                  <option value="">Sélectionner un transporteur</option>
                  <option value="10">Transporteur X</option>
                  <option value="11">Transporteur Y</option>
                  <option value="12">Transporteur Z</option>
                </select>
              </div>
              <div class="col-md-6">
                <label for="quantiteReception" class="form-label">Quantité reçue <span class="text-danger">*</span></label>
                <input type="number" class="form-control" id="quantiteReception" name="quantiteReception" required min="1" />
                <div class="invalid-feedback">Ce champ est obligatoire et doit être supérieur à 0.</div>
              </div>
              <div class="col-md-6">
                <label for="etatInspection" class="form-label">État inspection</label>
                <select class="form-select" id="etatInspection" name="etatInspection">
                  <option value="En attente">En attente</option>
                  <option value="Conforme">Conforme</option>
                  <option value="Non conforme">Non conforme</option>
                  <option value="Partiellement conforme">Partiellement conforme</option>
                </select>
              </div>

              <!-- Nouveau champ comité -->
              <div class="col-md-12">
                <label for="comiteReception" class="form-label">Membres du comité de réception <span class="text-danger">*</span></label>
                <select id="comiteReception" name="comiteReception[]" class="form-select" multiple required>
                  <option value="Chef de département">Chef de département</option>
                  <option value="Assistant spécial">Assistant spécial</option>
                  <option value="Conseiller technique">Conseiller technique</option>
                </select>
                <div class="invalid-feedback">Veuillez sélectionner au moins un membre.</div>
              </div>

              <div class="col-12">
                <label for="remarquesReception" class="form-label">Remarques</label>
                <textarea class="form-control" id="remarquesReception" name="remarquesReception" rows="2"></textarea>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
          <button type="submit" class="btn btn-primary">Enregistrer</button>
        </div>
      </form>
    </div>
  </div>
</div>
