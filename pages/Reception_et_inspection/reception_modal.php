<div class="modal fade" id="modalDetailReception" tabindex="-1" aria-labelledby="modalDetailReceptionLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalDetailReceptionLabel">Détails de la réception</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">
        <dl class="row">
          <dt class="col-sm-4">ID</dt>
          <dd class="col-sm-8" id="detailId"></dd>

          <dt class="col-sm-4">Numéro officiel</dt>
          <dd class="col-sm-8" id="detailNumeroOfficiel"></dd>

          <dt class="col-sm-4">Bon de commande</dt>
          <dd class="col-sm-8" id="detailCommande"></dd>

          <dt class="col-sm-4">Fournisseur</dt>
          <dd class="col-sm-8" id="detailFournisseur"></dd>

          <dt class="col-sm-4">Date de réception</dt>
          <dd class="col-sm-8" id="detailDate"></dd>

          <dt class="col-sm-4">Transporteur</dt>
          <dd class="col-sm-8" id="detailTransporteur"></dd>

          <dt class="col-sm-4">Quantité</dt>
          <dd class="col-sm-8" id="detailQuantite"></dd>

          <dt class="col-sm-4">État inspection</dt>
          <dd class="col-sm-8" id="detailEtat"></dd>

          <dt class="col-sm-4">Membres du comité</dt>
          <dd class="col-sm-8" id="detailComiteReception"></dd>

          <dt class="col-sm-4">Statut validation</dt>
          <dd class="col-sm-8" id="detailStatutValidation"></dd>

          <dt class="col-sm-4">Remarques</dt>
          <dd class="col-sm-8" id="detailRemarques"></dd>
        </dl>

        <div class="mt-3">
          <button id="btnValiderReception" class="btn btn-success">Valider la réception</button>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>
