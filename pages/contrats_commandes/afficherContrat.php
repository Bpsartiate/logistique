<div class="modal fade" id="contratDetailModal" tabindex="-1" aria-labelledby="contratDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="contratDetailModalLabel">Détail du contrat sélectionné</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <!-- Nav tabs -->
              <ul class="nav nav-tabs mb-3" id="contratDetailTabs" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="infos-tab" data-bs-toggle="tab" data-bs-target="#infos" type="button" role="tab" aria-controls="infos" aria-selected="true">
                    Informations du contrat
                  </button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="commandes-tab" data-bs-toggle="tab" data-bs-target="#commandes" type="button" role="tab" aria-controls="commandes" aria-selected="false">
                    Commandes associées
                  </button>
                </li>
              </ul>
              <!-- Tab panes -->
              <div class="tab-content" id="contratDetailTabsContent">
                <div class="tab-pane fade show active" id="infos" role="tabpanel" aria-labelledby="infos-tab">
                  <div id="contratDetail" class="mb-3">
                    <!-- Infos dynamiques injectées ici -->
                  </div>
                </div>
                <div class="tab-pane fade" id="commandes" role="tabpanel" aria-labelledby="commandes-tab">
                  <div id="commandesTableModal" data-list='{"valueNames":["numero","dateCommande","dateLivraison","montant","statut"],"page":5,"pagination":true}'>
                    <div class="row">
                      <div class="col-md-4">
                        <input class="search form-control mb-3" placeholder="Rechercher une commande" aria-label="Recherche commandes" />
                      </div>
                    </div>
                    <div class="table-responsive">
                      <table class="table table-bordered table-striped align-middle mb-0">
                        <thead>
                          <tr>
                            <th><button class="sort btn btn-link p-0" data-sort="numero" type="button">Numéro</button></th>
                            <th><button class="sort btn btn-link p-0" data-sort="dateCommande" type="button">Date commande</button></th>
                            <th><button class="sort btn btn-link p-0" data-sort="dateLivraison" type="button">Date livraison</button></th>
                            <th><button class="sort btn btn-link p-0" data-sort="montant" type="button">Montant ($)</button></th>
                            <th><button class="sort btn btn-link p-0" data-sort="statut" type="button">Statut</button></th>
                            <th>Actions</th>
                          </tr>
                        </thead>
                        <tbody class="list"></tbody>
                      </table>
                    </div>
                    <div class="d-flex justify-content-center mt-3">
                      <button class="btn btn-sm btn-falcon-default me-1" type="button" data-list-pagination="prev" title="Précédent">
                        <span class="fas fa-chevron-left"></span>
                      </button>
                      <ul class="pagination mb-0"></ul>
                      <button class="btn btn-sm btn-falcon-default ms-1" type="button" data-list-pagination="next" title="Suivant">
                        <span class="fas fa-chevron-right"></span>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>
