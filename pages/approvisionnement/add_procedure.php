 <!-- Modal -->
  <div class="modal fade" id="addProcedureModal" tabindex="-1" aria-labelledby="addProcedureLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <form id="procedureForm">
          <div class="modal-header">
            <h5 class="modal-title" id="addProcedureLabel">Ajouter une procédure</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
          </div>
          <div class="modal-body">

            <div class="mb-3">
              <label for="categorie" class="form-label">Catégorie</label>
                <select class="form-select" id="categorie" required>
                <option disabled selected value="">Sélectionnez une catégorie</option>
                <option value="Biens/Provisions">Biens/Provisions</option>
                <option value="Services">Services</option>
                <option value="Travaux">Travaux</option>
              </select>
            </div>

            <div class="mb-3">
              <label for="montant_min" class="form-label">Montant min</label>
              <input type="text" class="form-control" id="montant_min" placeholder="Ex: £101" required pattern="£?\d+" title="Entrez un montant valide, ex: £101" />
            </div>

            <div class="mb-3">
              <label for="montant_max" class="form-label">Montant max</label>
              <input type="text" class="form-control" id="montant_max" placeholder="Ex: £1000" required pattern="£?\d+" title="Entrez un montant valide, ex: £1000" />
            </div>

            <div class="mb-3">
              <label for="description" class="form-label">Type de procédure</label>
              <select id="type_procedure" class="form-select" required>
                <option value="" selected>--Sélectionnez une procédure--</option>
                <option value="Achat direct">Achat direct</option>
                <option value="Procédure d'une seule quotation (pro forma)">Procédure d'une seule quotation (pro forma)</option>
                <option value="Procédure négociée minimum 3 pro forma">Procédure négociée minimum 3 pro forma</option>
                <option value="Appel d'offre ouvert local">Appel d'offre ouvert local</option>
                <option value="Appel d'offre ouvert international">Appel d'offre ouvert international</option>
              </select>
            </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
            <button type="submit" class="btn btn-primary">Ajouter</button>
          </div>
        </form>
      </div>
    </div>
  </div>


