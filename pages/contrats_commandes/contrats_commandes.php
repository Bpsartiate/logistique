<div class="content">
  <!-- content nav -->
  <?php include_once "content_nav.php" ?>

  <!-- tittre -->
  <div class="row">
    <div class="col-md-12">
      <div class="card mb-3">
        <div class="bg-holder d-none d-lg-block bg-card" style="background-image:url(assets/img/icons/spot-illustrations/corner-4.png);">
        </div>
        <!--/.bg-holder-->

        <div class="card-body position-relative">
          <div class="row">
            <div class="col-lg-8">
              <h5 class="mt-3">Contrats et commandes</h5>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
   
  <div class="row">
    <div class="col-md-12">
           <!-- Contrats -->
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Contrats</h5>
        <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#ajouterContratModal">+ Nouveau contrat</button>
      </div>
      <!-- modal ajouter un contract -->
       <?php include_once "ajouterContrat.php"; ?>
      
      <div class="card-body p-3">
        <div id="contratsTable" data-list='{"valueNames":["numero","fournisseur","dateDebut","dateFin","montant","statut"],"page":5,"pagination":true}'>
          <div class="row">
            <div class="col-md-4">
                        <input class=" search form-control mb-3" placeholder="Rechercher un contrat" aria-label="Recherche contrats" />

            </div>
          </div>
          
          <div class="table-responsive">
            <table class="table table-bordered table-striped align-middle mb-0">
              <thead>
                <tr>
                  <th><button class="sort btn btn-link p-0" data-sort="numero" type="button">Numéro</button></th>
                  <th><button class="sort btn btn-link p-0" data-sort="fournisseur" type="button">Fournisseur</button></th>
                  <th><button class="sort btn btn-link p-0" data-sort="dateDebut" type="button">Date début</button></th>
                  <th><button class="sort btn btn-link p-0" data-sort="dateFin" type="button">Date fin</button></th>
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
  <!-- Modal Détail Contrat et Commandes -->
  <?php include_once "afficherContrat.php"; ?>
   </div>