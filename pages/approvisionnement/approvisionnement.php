
<div class="content">
     <!-- content nav -->
     <?php include_once "./content_nav.php" ?> <!-- Modal -->
             <?php include_once "add_besoin.php"; ?>
             <?php include_once "fiche_besoin.php" ?>
             <?php include_once "add_procedure.php" ?>
             <?php include_once "projetVue.php" ?>


     <!-- conetent  end -->
          <div class="row mb-3">
                <div class="col-md-12">
                <div class="card">
                    <div class="bg-holder d-none d-lg-block bg-card" style="background-image:url(assets/img/icons/spot-illustrations/corner-4.png);">
                    </div>
                    <!--/.bg-holder-->

                    <div class="card-body position-relative">
                    <div class="row">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="mt-3">Planification des Besoin</h5>
                        <div class="d-flex align-items-center gap-2">
                          <button class="btn mt-2 btn-primary" data-bs-toggle="modal" data-bs-target="#addProcedureModal">
                            <i class="fas fa-plus me-1"></i>Type de procedure
                          </button>
                          <button id="btnToggleProceduresTable" class="btn btn-outline-secondary mt-2" type="button">
                            <i class="fas fa-table me-1"></i><span id="toggleProceduresTableText">Afficher</span> les procédures
                          </button>
                        </div>
                        </div>
                    </div>
                    <div class="row">
                    
          <div id="proceduresTableContainer" data-list='{"valueNames":["id","designation","montant_max","montant_max","type_procedure"],"page":5,"pagination":true}'  class="table-responsive scrollbar" style="display:none;">
            <div class="row justify-content-between align-items-center g-0 mb-3">
                <div class="col-auto col-sm-5">
                <form>
                    <div class="input-group">
                    <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher un besoin..." aria-label="search" />
                    <div class="input-group-text bg-transparent"><span class="fa fa-search fs--1 text-600"></span></div>
                    </div>
                </form>
                </div>
            </div>
            <table class="table table-bordered table-striped fs--1 mb-0">
              <thead class="bg-200 text-900">
                <tr>
                  <th class="sort" data-sort="id">ID</th>
                  <th class="sort" data-sort="categorie">Type d'achat</th>
                  <th class="sort" data-sort="montant_min">Montant min</th>
                  <th class="sort" data-sort="montant_max">Montant max</th>
                  <th class="sort" data-sort="type_procedure">Procédure</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody id="proceduresList" class="list">
              </tbody>
            </table>
             <div class="d-flex justify-content-center mt-3">
                <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Précédent" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                <ul class="pagination mb-0"></ul>
                <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Suivant" data-list-pagination="next"><span class="fas fa-chevron-right"> </span></button>
              </div>
          </div>
                   
                    </div>
                    </div>
                </div>
                </div>
            </div>
        <!-- Exemple d'alerte critique -->
        
        <!-- table -->
        <div class="row">
            <div class="col-8 col-lg-8 col-xl-8">
                <div class="card mb-4">
                <div class="card-body">
                    <div id="tableFournisseurs" data-list='{"valueNames":["nom","type","statut","contact","score","risque"],"page":5,"pagination":true}'>
                    <div class="row justify-content-between align-items-center g-0 mb-3">
                        <div class="col-auto col-sm-5">
                        <form>
                            <div class="input-group">
                            <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher un besoin..." aria-label="search" />
                            <div class="input-group-text bg-transparent"><span class="fa fa-search fs--1 text-600"></span></div>
                            </div>
                        </form>
                        </div>
                        <div class="col-auto">
                            <!-- <a href = ".../type_procedure.php" class="btn btn-sm btn-primary" type="button"></span>Type de procedure</a> -->
                            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addSupplierModal" type="button"><span class="fa fa-plus me-1"></span>Ajouter un besoin</button>
                        </div>
                    </div>
                    <div class="table-responsive scrollbar">
                        <table class="table table-bordered table-striped fs--1 mb-0">
                            <thead class="bg-200 text-900">
                                <tr>
                                    <th class="sort" data-sort="id">ID</th>
                                    <th class="sort" data-sort="designation">Désignation</th>
                                    <th class="sort" data-sort="quantite">Quantité</th>
                                    <th class="sort" data-sort="valeur_budgetisee">Valeur budgétisée ($)</th>
                                    <th class="sort" data-sort="etat">Statut</th>
                                    <th class="sort" data-sort="type_besoin">Type de besoin</th>
                                    <th class="sort" data-sort="type_procedure">Type de procédure</th>
                                    <th class="sort" data-sort="fournisseur">Priorité</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list">
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-center mt-3">
                        <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Précédent" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                        <ul class="pagination mb-0"></ul>
                        <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Suivant" data-list-pagination="next"><span class="fas fa-chevron-right"> </span></button>
                    </div>
                    </div>
                    
                </div>
                </div>
            </div>
            <div class="col-4">
                 <div class="kanban-column">
              <div class="kanban-column-header">
                  <h5 class="fs-0 mb-0">Projects <span id="projectsCount" class="text-500">(0)</span></h5>                <div class="dropdown font-sans-serif btn-reveal-trigger">
                  <button class="btn btn-sm btn-reveal py-0 px-2" type="button" id="kanbanColumn2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
                  <div class="dropdown-menu dropdown-menu-end py-0" aria-labelledby="kanbanColumn2"><button class="dropdown-item" id="btnAjouterProjet">Ajouter un Projet</button>
                  </div>
                </div>
              </div>
              <div class="kanban-items-container scrollbar">
               <div class="kanban-items-container scrollbar" id="kanbanProjetsContainer">
                <!-- Projet cards ici -->
              </div>
              </div>
              <div class="kanban-column-footer">
                <button id="btnAjouterProjet" class="btn btn-link btn-sm d-block w-100 btn-add-card text-decoration-none text-600" type="button"><span class="fas fa-plus me-2"></span>Ajouter un projet</button>
              </div>
            </div>
            </div>
            
        </div>
        <div class="row">
          
        </div>

</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="pages/approvisionnement/js/alerts.js"></script>
<script src="pages/approvisionnement/js/procedures.js"></script>
<script src="pages/approvisionnement/js/kanbanProjets.js"></script>
<script src="pages/approvisionnement/js/articles.js"></script>