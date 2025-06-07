
<!-- Modal ajout/modif produit -->
<div class="modal fade" id="modalProduit" tabindex="-1" aria-labelledby="modalProduitLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form id="formProduit" novalidate>
        <div class="modal-header">
          <h5 class="modal-title" id="modalProduitLabel">Ajouter un produit</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="produitId" />
          <div class="mb-3">
            <label for="reference" class="form-label">Référence <span class="text-danger">*</span></label>
            <input type="text" id="reference" class="form-control" required />
            <div class="invalid-feedback">Référence obligatoire</div>
          </div>
          <div class="mb-3">
            <label for="designation" class="form-label">Désignation <span class="text-danger">*</span></label>
            <input type="text" id="designation" class="form-control" required />
            <div class="invalid-feedback">Désignation obligatoire</div>
          </div>
          <div class="mb-3">
            <label for="quantite" class="form-label">Quantité <span class="text-danger">*</span></label>
            <input type="number" id="quantite" class="form-control" min="0" required />
            <div class="invalid-feedback">Quantité obligatoire et ≥ 0</div>
          </div>
          <div class="mb-3">
            <label for="emplacement" class="form-label">Emplacement <span class="text-danger">*</span></label>
            <select id="emplacement" class="form-select" required>
              <option value="">Sélectionner un emplacement</option>
              <option>Zone A - Rayonnage 1</option>
              <option>Zone A - Rayonnage 2</option>
              <option>Zone B - Rayonnage 1</option>
              <option>Zone B - Rayonnage 2</option>
            </select>
            <div class="invalid-feedback">Emplacement obligatoire</div>
          </div>
          <div class="mb-3">
            <label for="etat" class="form-label">État</label>
            <select id="etat" class="form-select">
              <option>Neuf</option>
              <option>Bon état</option>
              <option>Usagé</option>
              <option>Défectueux</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="dateEntree" class="form-label">Date d'entrée</label>
            <input type="date" id="dateEntree" class="form-control" />
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