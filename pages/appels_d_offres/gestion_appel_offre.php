<div class="content">
  <!-- content nav -->
  <?php include_once "content_nav.php" ?>

  <!-- Dashboard Widgets -->
  <div class="row mb-4">
            <div class="col-12 col-lg-12 col-xl-12 d-flex">
                <h5 class="mt-3">Gestion des Appels d'Offres</h5>
            </div>
    </div>
   
   <div class="row g-3 mb-3">

    <!-- Alertes Appels d’Offres -->
    <div class="col-md-12 col-xxl-3">
      <div class="card h-md-100">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h6 class="mb-0 mt-2">Alertes Appels d’Offres</h6>
          <button class="btn btn-sm btn-outline-secondary" title="Actualiser" onclick="refreshAlerts()" aria-label="Actualiser les alertes">
            <i class="fas fa-sync-alt"></i>
          </button>
        </div>
        <div class="card-body">
          <ul id="alertsList" class="list-group list-group-flush" aria-live="polite" aria-relevant="all"></ul>
        </div>
      </div>
    </div>

    <!-- Documents liés aux appels d’offres -->
    <div class="col-md-12 col-xxl-3">
      <div class="card h-md-100">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h6 class="mb-0 mt-2">Documents liés aux appels d’offres</h6>
          <button class="btn btn-sm btn-outline-secondary" title="Actualiser" onclick="refreshDocuments()" aria-label="Actualiser les documents">
            <i class="fas fa-sync-alt"></i>
          </button>
        </div>
        <div class="card-body d-flex flex-column">
          <ul id="documentsList" class="list-group list-group-flush mb-3 scrollable-list" aria-live="polite" aria-relevant="all"></ul>
          <form class="d-flex gap-2" onsubmit="uploadDocument(event)" aria-label="Formulaire d'ajout de document">
            <input type="file" class="form-control form-control-sm" aria-label="Ajouter un document" required />
            <button class="btn btn-primary btn-sm" type="submit" aria-label="Ajouter un document">
              <i class="fas fa-upload me-1"></i>Ajouter
            </button>
          </form>
        </div>
      </div>
    </div>

    <!-- Analyse comparative des offres -->
    <div class="col-md-12 col-xxl-6">
      <div class="card h-md-100">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h6 class="mb-0 mt-2">Analyse comparative des offres reçues</h6>
        </div>
        <div class="card-body">
          <div id="offersComparison" data-list='{"valueNames":["fournisseur","prix","delai","qualite","garantie","score","rang","remarque"],"page":5,"pagination":true}'>
    <div class="row justify-content-between align-items-center g-0 mb-3">
      <div class="col-auto col-sm-5">
        <!-- <form>
          <div class="input-group">
            <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher une offre..." aria-label="Rechercher une offre" />
            <div class="input-group-text bg-transparent"><span class="fa fa-search fs--1 text-600"></span></div>
          </div>
        </form> -->
      </div>
     
    </div>
    <div id="offersComparison" data-list='{"valueNames":["fournisseur","prix","delai","qualite","garantie","score","rang","remarque"],"page":5,"pagination":true}'>
    <div class="row justify-content-between align-items-center g-0 mb-3">
      <div class="col-auto col-sm-5">
        <form>
          <div class="input-group">
            <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher une offre..." aria-label="Rechercher une offre" />
            <div class="input-group-text bg-transparent"><span class="fa fa-search fs--1 text-600"></span></div>
          </div>
        </form>
      </div>
      <div class="col-auto">
        <button class="btn btn-sm btn-outline-primary" onclick="exportOffersCSV()" aria-label="Exporter les offres au format CSV">
          <i class="fas fa-file-export me-1"></i>Exporter
        </button>
      </div>
    </div>
    <div class="table-responsive scrollbar">
      <table class="table table-bordered table-striped fs--1 mb-0" aria-describedby="offersTableCaption">
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
          </tr>
        </thead>
        <tbody class="list" id="offersTableBody">
          <!-- Lignes générées dynamiquement -->
        </tbody>
      </table>
    </div>
    <div class="d-flex justify-content-center mt-3">
      <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Précédent" data-list-pagination="prev">
        <span class="fas fa-chevron-left"></span>
      </button>
      <ul class="pagination mb-0"></ul>
      <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Suivant" data-list-pagination="next">
        <span class="fas fa-chevron-right"></span>
      </button>
    </div>
  </div>
  </div>
          <div class="text-center mt-4">
            <h6>Comparaison des Offres</h6>
            <p>Analyse des critères de sélection</p>
<div id="offersRadar" style="width:100%; max-width:600px; height: 350px; margin: 0 auto;"></div>          </div>
        </div>
      </div>
    </div>

  </div>
</div>


<!-- Scripts -->
<script src="vendors/echarts/echarts.min.js"></script>