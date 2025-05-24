<div class="content">
     <!-- content nav -->
     <?php include_once "./content_nav.php" ?>
<!-- Modal -->
    <?php include_once "add_fourn.php"; ?>
    <?php include_once "fiche_fourn.php" ?>
    <?php include_once "historique_fourn.php" ?>

     <!-- conetent  end -->
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
                        <h5 class="mt-3">Gestion des Fournisseurs</h5>
                        </div>
                    </div>
                    </div>
                </div>
                </div>
            </div>
        <div class="row mb-4">
         
           
        </div>
        <!-- Exemple d'alerte critique -->
        <div class="alert alert-danger mt-4 d-flex align-items-center" role="alert">
                    <span class="fas fa-exclamation-triangle me-2"></span>
                    Évaluation urgente à faire pour 2 fournisseurs à risque élevé !
                    <a href="#" class="btn btn-sm btn-outline-danger ms-auto">Voir</a>
                    </div>
        <!-- table -->
        <div class="row">
            <div class="col-12 col-lg-12 col-xl-12">
                <div class="card mb-4">
                <div class="card-body">
                    <div id="tableFournisseurs" data-list='{"valueNames":["nom","type","statut","contact","score","risque"],"page":5,"pagination":true}'>
                    <div class="row justify-content-between align-items-center g-0 mb-3">
                        <div class="col-auto col-sm-5">
                        <form>
                            <div class="input-group">
                            <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher un fournisseur..." aria-label="search" />
                            <div class="input-group-text bg-transparent"><span class="fa fa-search fs--1 text-600"></span></div>
                            </div>
                        </form>
                        </div>
                        <div class="col-auto">
                        <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addSupplierModal" type="button"><span class="fa fa-plus me-1"></span>Ajouter un fournisseur</button>
                        </div>
                    </div>
                    <div class="table-responsive scrollbar">
                        <table class="table table-bordered table-striped fs--1 mb-0">
                        <thead class="bg-200 text-900">
                            <tr>
                            <th class="sort" data-sort="nom">Nom</th>
                            <th class="sort" data-sort="type">Type</th>
                            <th class="sort" data-sort="statut">Statut</th>
                            <th class="sort" data-sort="contact">Contact principal</th>
                            <th class="sort" data-sort="score">Score</th>
                            <th class="sort" data-sort="risque">Risque</th>
                            <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody class="list">
                            <tr>
                            <td class="nom">Société Alpha</td>
                            <td class="type">Transport</td>
                            <td class="statut"><span class="badge bg-success">Actif</span></td>
                            <td class="contact">Jean Kalume</td>
                            <td class="score">92%</td>
                            <td class="risque"><span class="badge bg-success">Faible</span></td>
                            <td>
                                <a data-bs-toggle="modal" data-bs-target="#ficheFournisseur" class="btn btn-sm btn-info" title="Voir fiche"><span class="fa fa-eye"></span></a>
                                <a data-bs-toggle="modal" class="btn btn-sm btn-warning" title="Évaluer"><span class="fa fa-star"></span></a>
                                <a data-bs-toggle="modal" class="btn btn-sm btn-secondary" data-bs-target="#HistoFournisseur" title="Historique"><span class="fa fa-history"></span></a>
                                <a data-bs-toggle="modal" class="btn btn-sm btn-dark" title="Documents"><span class="fa fa-file-alt"></span></a>
                            </td>
                            </tr>
                            <tr>
                            <td class="nom">Logistix SARL</td>
                            <td class="type">Fourniture</td>
                            <td class="statut"><span class="badge bg-warning text-dark">En attente</span></td>
                            <td class="contact">Marie Nyota</td>
                            <td class="score">78%</td>
                            <td class="risque"><span class="badge bg-danger">Élevé</span></td>
                            <td>
                                <a href="#" class="btn btn-sm btn-info" title="Voir fiche"><span class="fa fa-eye"></span></a>
                                <a href="#" class="btn btn-sm btn-warning" title="Évaluer"><span class="fa fa-star"></span></a>
                                <a href="#" class="btn btn-sm btn-secondary" title="Historique"><span class="fa fa-history"></span></a>
                                <a href="#" class="btn btn-sm btn-dark" title="Documents"><span class="fa fa-file-alt"></span></a>
                            </td>
                            </tr>
                            <tr>
                            <td class="nom">TransExpress</td>
                            <td class="type">Transport</td>
                            <td class="statut"><span class="badge bg-danger">Suspendu</span></td>
                            <td class="contact">Ali Mbafuniepaka</td>
                            <td class="score">60%</td>
                            <td class="risque"><span class="badge bg-warning text-dark">Moyen</span></td>
                            <td>
                                <a href="#" class="btn btn-sm btn-info" title="Voir fiche"><span class="fa fa-eye"></span></a>
                                <a href="#" class="btn btn-sm btn-warning" title="Évaluer"><span class="fa fa-star"></span></a>
                                <a href="#" class="btn btn-sm btn-secondary" title="Historique"><span class="fa fa-history"></span></a>
                                <a href="#" class="btn btn-sm btn-dark" title="Documents"><span class="fa fa-file-alt"></span></a>
                            </td>
                            </tr>
                            <!-- Ajoute d'autres fournisseurs ici -->
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
        </div>

</div>