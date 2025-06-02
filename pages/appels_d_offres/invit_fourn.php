<div class="modal fade" id="modalFournisseursInvites" tabindex="-1" aria-labelledby="modalFournisseursInvitesLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalFournisseursInvitesLabel">Gestion des fournisseurs invités</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
        <form id="formFournisseursInvites">
          <input type="hidden" id="aoRef" name="aoRef" value="">
          <div class="mb-3">
            <label for="selectFournisseursInvites" class="form-label">Ajouter des fournisseurs invités</label>
           <select id="selectFournisseursInvites" class="form-select selectpicker w-100" multiple data-live-search="true" title="Sélectionner un ou plusieurs fournisseurs">
            <!-- options dynamiques -->
            </select>
            <div class="form-text">Sélectionnez un ou plusieurs fournisseurs à inviter.</div>
          </div>
          <hr>
          <h6>Fournisseurs invités actuels</h6>
          <table class="table table-sm table-bordered">
            <thead>
              <tr>
                <th>Fournisseur</th>
                <th>Statut</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody id="listeFournisseursInvites">
              <!-- Liste dynamique -->
            </tbody>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" id="btnAjouterFournisseurs" class="btn btn-success">Ajouter</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
        </div>
      </form>
    </div>
  </div>
</div>
