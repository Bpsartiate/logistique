<!-- Modal Réception -->
<div class="modal fade" id="modalReception" tabindex="-1" aria-labelledby="modalReceptionLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form id="formReception" novalidate>
        <div class="modal-header">
          <h5 class="modal-title" id="modalReceptionLabel">Réception de marchandises</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="refReception" class="form-label">Référence <span class="text-danger">*</span></label>
            <input type="text" id="refReception" class="form-control" required />
            <div class="invalid-feedback">Référence obligatoire</div>
          </div>
          <div class="mb-3">
            <label for="designationReception" class="form-label">Désignation <span class="text-danger">*</span></label>
            <input type="text" id="designationReception" class="form-control" required />
            <div class="invalid-feedback">Désignation obligatoire</div>
          </div>
          <div class="mb-3">
            <label for="categorieReception" class="form-label">Catégorie</label>
            <input type="text" id="categorieReception" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="quantiteReception" class="form-label">Quantité <span class="text-danger">*</span></label>
            <input type="number" id="quantiteReception" class="form-control" min="1" required />
            <div class="invalid-feedback">Quantité obligatoire et ≥ 1</div>
          </div>
          <div class="mb-3">
            <label for="fournisseurReception" class="form-label">Fournisseur</label>
            <input type="text" id="fournisseurReception" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="lotReception" class="form-label">Numéro de lot</label>
            <input type="text" id="lotReception" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="dateReception" class="form-label">Date de réception</label>
            <input type="date" id="dateReception" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="emplacementReception" class="form-label">Emplacement</label>
            <select id="emplacementReception" class="form-select">
              <option value="">Sélectionner un emplacement</option>
              <option>Zone A - Rayonnage 1</option>
              <option>Zone A - Rayonnage 2</option>
              <option>Zone B - Rayonnage 1</option>
              <option>Zone B - Rayonnage 2</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="statutReception" class="form-label">Statut entrée</label>
            <select id="statutReception" class="form-select">
              <option value="En attente">En attente</option>
              <option value="Contrôlé">Contrôlé</option>
              <option value="Stocké">Stocké</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="observationsReception" class="form-label">Observations</label>
            <textarea id="observationsReception" class="form-control" rows="2"></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
          <button type="submit" class="btn btn-primary">Enregistrer la réception</button>
        </div>
      </form>
    </div>
  </div>
</div>
