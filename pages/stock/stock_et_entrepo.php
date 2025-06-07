<div class="content">
  <!-- content nav -->
  <?php include_once "content_nav.php" ?>
    <!-- Modal pour ajouter produit -->
    <?php include_once "add_prod.php"; ?>
    <!-- Modal pour la réception -->
    <?php include_once "modal_reception.php"; ?>
   

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
                <h3 class="mb-0"><i class="fas fa-truck-loading me-2"></i>Stock & Entreposage</h3>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalProduit">
                <i class="fas fa-plus me-1"></i>  Ajouter un produit
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-body">
            <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#modalReception">
  <i class="fas fa-truck-loading me-1"></i> Nouvelle réception
</button>

        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
        <div class="card">
        <div class="card-body">
            <div class="row g-3 align-items-center">
                <div class="col-md-3">
                    <label for="filtreProduit" class="form-label">Produit</label>
                    <input type="text" class="form-control" id="filtreProduit" placeholder="Recherche par produit">
                </div>
                <div class="col-md-3">
                    <label for="filtreCategorie" class="form-label">Catégorie</label>
                    <input type="text" class="form-control" id="filtreCategorie" placeholder="Recherche par catégorie">
                </div>
                <div class="col-md-3">
                    <label for="filtreEtatStock" class="form-label">État du stock</label>
                    <select class="form-select" id="filtreEtatStock">
                        <option value="">Tous</option>
                        <option value="Disponible">Disponible</option>
                        <option value="En rupture">En rupture</option>
                        <option value="En commande">En commande</option>
                    </select>
                </div>
                <div class="col-md-3 d-flex gap-2 mt-5">
                    <button title="search" id="btnFiltrerStock" class="btn btn-outline-secondary flex-grow">
                        <i class="fas fa-search"></i>
                    </button>
                    <button title="actualiser" id="btnReinitialiserStock" class="btn btn-outline-danger flex-grow">
                        <i class="fas fa-undo"></i>
                    </button>
                </div>
            </div>
        <div class="row">
            <div class="col-md-12">
                <div class="row mt-2">
                    <div class="col-md-5">
                        <input class="search form-control mb-3" placeholder="Recherche globale..." />
                    </div>
                </div>
                <!-- tableau -->
               <div id="tableReceptions">
                <div data-list='{"valueNames":["id", "reference", "designation", "categorie", "quantite", "emplacement", "etat", "dateEntree", "actions"],"page":5,"pagination":true}'>
                    <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                        <th style="display:none;">ID</th>
                        <th class="sort" data-sort="reference">Référence</th>
                        <th class="sort" data-sort="designation">Désignation</th>
                        <th class="sort" data-sort="quantite">Quantité</th>
                        <th class="sort" data-sort="emplacement">Emplacement</th>
                        <th class="sort" data-sort="etat">État</th>
                        <th class="sort" data-sort="dateEntree">Date entrée</th>
                        <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody class="list">
                        <tr>
                        <td style="display:none;" class="id"></td>
                        <td class="reference"></td>
                        <td class="designation"></td>
                        <td class="quantite"></td>
                        <td class="emplacement"></td>
                        <td class="etat"></td>
                        <td class="dateEntree"></td>
                        <td class="actions"></td>
                        </tr>
                    </tbody>
                    </table>
                    <div class="d-flex justify-content-center mt-3">
                    <button class="btn btn-sm btn-secondary me-1" type="button" data-list-pagination="prev"><i class="fas fa-chevron-left"></i></button>
                    <ul class="pagination mb-0"></ul>
                    <button class="btn btn-sm btn-secondary ms-1" type="button" data-list-pagination="next"><i class="fas fa-chevron-right"></i></button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    </div>
    
  </div>
