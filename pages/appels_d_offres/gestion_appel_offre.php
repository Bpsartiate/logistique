<div class="content">
  <!-- content nav -->
  <?php include_once "content_nav.php" ?>
  <!-- Modal -->
  <?php include_once "add_apple.php"; ?>
  <?php include_once "invit_fourn.php"; ?> 

  <!-- Dashboard Widgets -->
  <!-- <div class="row mb-4">
            <div class="col-12 col-lg-12 col-xl-12 d-flex">
                <h5 class="mt-3">Gestion des Appels d'Offres</h5>
            </div>
    </div> -->
    <div class="card mb-3">
            <div class="bg-holder d-none d-lg-block bg-card" style="background-image:url(assets/img/icons/spot-illustrations/corner-4.png);">
            </div>
            <!--/.bg-holder-->

            <div class="card-body position-relative">
              <div class="row">
                <div class="col-lg-8">
                <h5 class="mt-3">Gestion des Appels d'Offres</h5>
                </div>
              </div>
            </div>
    </div>
   
   <div class="row g-3 mb-3">
    <div class="col-md-12">
    <div class="row">
      <div class="col-md-12">
          <!-- allertes -->
        <div class="card mb-4">
            <div class="card-header ">
              <div class="row">
                <div class="col-md-12">
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Alertes Appels d’Offres</h5>
                    <button class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#modalLancerAO">
                      <i class="fas fa-plus me-1"></i>Lancer un appel d’offre
                    </button>
                  </div>
                </div>
              </div>
              <div class="row pt-3">
                <div class="col-md-6">
                  <div class="d-flex gap-2 justify-content-end">
                    <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher une alerte..." aria-label="Rechercher une alerte" />
                    <button class="btn btn-sm btn-outline-secondary" onclick="refreshAlerts()" title="Actualiser">
                      <i class="fas fa-sync-alt"></i>
                    </button>
                 </div>
               </div>
            <div class="card-body scrollbar">
              <ul id="alertsList" class="list-group list-group-flush"></ul>
            </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
          <!-- Appels d'offres -->
        <div id="aoTable" data-list='{"valueNames":["ref","type","statut","echeance","fournisseurs"],"page":5,"pagination":true}'>
          <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
              <h5 class="mb-0">Tableau des appels d’offres</h5>
              <div class="d-flex gap-2 align-items-center">
                <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher un appel d’offres..." aria-label="Rechercher un appel d’offres" />
                <button class="btn btn-sm btn-outline-secondary" onclick="refreshAO()" title="Actualiser">
                  <i class="fas fa-sync-alt"></i>
                </button>
              </div>
            </div>
            <div class="card-body table-responsive scrollbar">
              <table class="table table-bordered table-striped align-middle mb-0" aria-describedby="aoTableCaption">
                <caption id="aoTableCaption" class="visually-hidden">Liste des appels d’offres</caption>
                <thead class="bg-200 text-900">
                  <tr>
                    <th class="sort" data-sort="ref" scope="col">Référence</th>
                    <th class="sort" data-sort="type" scope="col">Type</th>
                    <th class="sort" data-sort="statut" scope="col">Statut</th>
                    <th class="sort" data-sort="echeance" scope="col">Échéance</th>
                    <th class="sort" data-sort="fournisseurs" scope="col">Fournisseurs</th>
                    <th scope="col">Actions</th>
                  </tr>
                </thead>
                <tbody class="list" id="aoTableBody"></tbody>
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
    <div class="row">
      <div class="col-md-12">
            <!-- Documents -->
        <div class="card mb-4">
          <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Documents liés aux appels d’offres</h5>
            <button class="btn btn-sm btn-outline-secondary" onclick="refreshDocuments()" title="Actualiser les documents">
              <i class="fas fa-sync-alt"></i> Actualiser
            </button>
          </div>
          <div class="card-body d-flex flex-column">
            <ul id="documentsList" class="list-group list-group-flush mb-3 scrollbar"></ul>
            <form class="d-flex gap-2" onsubmit="uploadDocument(event)" aria-label="Formulaire d'ajout de document">
              <input type="file" class="form-control form-control-sm" aria-label="Ajouter un document" required />
              <button class="btn btn-primary btn-sm" type="submit" aria-label="Ajouter un document">
                <i class="fas fa-upload me-1"></i>Ajouter
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  <!-- Offres -->
  <div class="row">
    <div class="col-md-12">
      <div id="offersTable" data-list='{"valueNames":["fournisseur","prix","delai","qualite","garantie","score","rang","remarque"],"page":5,"pagination":true}'>
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Analyse comparative des offres reçues</h5>
        <div>
          <button class="btn btn-sm btn-outline-primary" onclick="exportOffersCSV()" aria-label="Exporter les offres au format CSV">
            <i class="fas fa-file-export me-1"></i>Exporter
          </button>
        </div>
      </div>
      <div class="card-body table-responsive scrollbar">
        <table class="table table-bordered table-striped align-middle mb-0" aria-describedby="offersTableCaption">
          <caption id="offersTableCaption" class="visually-hidden">Tableau comparatif des offres fournisseurs</caption>
          <thead class="bg-200 text-900">
            <tr>
              <th class="sort" data-sort="fournisseur" scope="col">Fournisseur</th>
              <th class="sort" data-sort="prix" scope="col">Prix (40%)</th>
              <th class="sort" data-sort="delai" scope="col">Délai (20%)</th>
              <th class="sort" data-sort="qualite" scope="col">Qualité (30%)</th>
              <th class="sort" data-sort="garantie" scope="col">Garantie (10%)</th>
              <th class="sort" data-sort="score" scope="col">Score total</th>
              <th class="sort" data-sort="rang" scope="col">Rang</th>
              <th class="sort" data-sort="remarque" scope="col">Remarque</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody class="list" id="offersTableBody"></tbody>
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

  <!-- Graphique -->
 <div class="row ">
  <div class="col-md-12">
       <div class="card mb-4">
        <div class="card-header d-flex justify-content-between align-items-center">
              <h5 class="text-center mt-3">Analyse des critères de sélection</h5>
        </div>
        <div class="card-body">
              <div id="offersRadar" style="height: 350px; max-width: 700px; margin: 0 auto;"></div>
        </div>
       </div>

     <div >
  </div>
  </div>
 </div>
    </div>

   </div>
