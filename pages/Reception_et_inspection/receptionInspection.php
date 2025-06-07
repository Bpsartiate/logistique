<div class="content">
  <!-- content nav -->
  <?php include_once "content_nav.php" ?>
    <!-- Modal pour ajouter une nouvelle réception -->
    <?php include_once "Nouvelle_reception.php"; ?>
    <!-- Modal pour afficher les détails d'une réception -->
    <?php include_once "reception_modal.php"; ?>
  <div class="container-fluid py-4">

  <!-- tittre -->
  <div class="row">
    <div class="col-md-612">
      <div class="card mb-3">
        <div class="bg-holder d-none d-lg-block bg-card" style="background-image:url(assets/img/icons/spot-illustrations/corner-4.png);">
        </div>
        <!--/.bg-holder-->

        <div class="card-body position-relative">
          <div class="row">
            <!-- En-tête avec titre et bouton "Nouvelle réception" -->
            <div class="d-flex justify-content-between mt-4 align-items-center mb-4">
                <h3 class="mb-0"><i class="fas fa-truck-loading me-2"></i>Réception & Inspection</h3>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalNouvelleReception">
                <i class="fas fa-plus me-1"></i> Nouvelle réception
                </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
       <!-- 1. Filtres et outils de recherche -->
      <div class="card shadow-sm mb-4">
        <div class="card-body">
          <div class="row g-3 align-items-center">
                <div class="col-md-3">
                    <label for="filtreCommande" class="form-label">Bon de commande</label>
                    <input type="text" class="form-control" id="filtreCommande" placeholder="Recherche par bon de commande">
                </div>
                <div class="col-md-3">
                    <label for="filtreFournisseur" class="form-label">Fournisseur</label>
                    <input type="text" class="form-control" id="filtreFournisseur" placeholder="Recherche par fournisseur">
                </div>
                <div class="col-md-3">
                    <label for="filtreEtat" class="form-label">État Inspection</label>
                    <select class="form-select" id="filtreEtat">
                    <option value="">Tous</option>
                    <option value="En attente">En attente</option>
                    <option value="Conforme">Conforme</option>
                    <option value="Non conforme">Non conforme</option>
                    <option value="Partiellement conforme">Partiellement conforme</option>
                    </select>
                </div>
                <div class="col-md-3 d-flex gap-2 mt-5">
                    <button title="search" id="btnFiltrer" class="btn btn-outline-secondary flex-grow">
                    <i class="fas fa-search"></i>
                    </button>
                    <button title="actualiser" id="btnReinitialiser" class="btn btn-outline-danger flex-grow">
                    <i class="fas fa-undo"></i>
                    </button>
                </div>
            </div>

            <!-- 2. Tableau des réceptions -->
            <div class="row mt-4">
                <div class="col-md-12">
      
                <div id="tableReceptions" data-list='{"valueNames":["id","commande","fournisseur","date","transporteur","quantite","etat","comite"],"page":5,"pagination":true}'>
                  <div class="row">
                    <div class="col-md-6">
                    <input class="search form-control mb-3" placeholder="Recherche globale..." />
                    </div>
                  </div>
                  <div class="table-responsive scrollbar">
                    <table class="table responsive table-bordered table-striped">
                    <thead>
                      <tr>
                       <th class="sort" data-sort="numeroOfficiel">Numéro officiel</th>
                        <th class="sort" data-sort="commande">Bon de commande</th>
                        <th class="sort" data-sort="fournisseur">Fournisseur</th>
                        <th class="sort" data-sort="date">Date réception</th>
                        <th class="sort" data-sort="transporteur">Transporteur</th>
                        <th class="sort" data-sort="quantite">Quantité</th>
                        <th class="sort" data-sort="etat">État inspection</th>
                        <th class="sort" data-sort="comite">Comité</th>
                        <th class="sort" data-sort="statut">Statut</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody class="list"></tbody>
                  </table>
                  </div>
                  
                  <div class="d-flex justify-content-center mt-3">
                    <button class="btn btn-sm btn-secondary me-1" type="button" data-list-pagination="prev"><i class="fas fa-chevron-left"></i></button>
                    <ul class="pagination mb-0"></ul>
                    <button class="btn btn-sm btn-secondary ms-1" type="button" data-list-pagination="next"><i class="fas fa-chevron-right"></i></button>
                  </div>
                </div>

          </div>


        </div>
      </div>