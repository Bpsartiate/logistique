<!-- Modal Confirmation Suppression -->
<div class="modal fade" id="confirmationSuppressionModal" tabindex="-1" aria-labelledby="confirmationSuppressionModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmationSuppressionModalLabel">Confirmer la suppression</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">
        <p>Êtes-vous sûr de vouloir supprimer cette commande ? Cette action est irréversible.</p>
        <p><strong id="commandeASupprimer"></strong></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <button type="button" class="btn btn-danger" id="btnConfirmerSuppression">Supprimer</button>
      </div>
    </div>
  </div>
</div>
