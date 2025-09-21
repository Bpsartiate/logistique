<!-- Modal Projet Avancé -->
<div class="modal fade" id="modalProjetAvance" tabindex="-1" aria-labelledby="modalProjetAvanceLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content shadow-lg border-0">
      <div class="modal-header bg-gradient-primary text-white align-items-center">
        <div class="d-flex align-items-center">
          <i class="bi bi-folder2-open-fill fs-2 me-3"></i>
          <div>
            <h4 class="modal-title mb-0 fw-bold" id="modalProjetAvanceLabel">
              <span id="projetNom"></span>
              <span id="badgeStatus" class="badge ms-2 fs-6 px-3 py-2 align-middle">
                <i id="iconStatus" class="me-2"></i><span id="textStatus"></span>
              </span>
              <span ><i class="fa fa-solid fa-user-tie me-1"></i>Bailleur : <span class="badge ms-2 fs-2 px-3 py-2 bg-info text-dark ms-2" id="formProjetBailleur"></span></span>

            </h4>
            <div class="small mt-1">
              <span class="me-3"><i class="bi  bi-person-badge me-1"></i><span id="projetBailleur"></span></span>
              <span class="me-3"><i class="bi bi-calendar-event me-1"></i><span id="projetPeriode"></span></span>
              <span class="me-3"><i class="bi bi-cash-coin me-1"></i>$<span id="projetBudget"></span></span>
            </div>
          </div>
        </div>
        <button type="button" class="btn-close btn-close-dark ms-3" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body bg-light">
        <div class="card shadow-sm border-0 mb-4">
          <div class="card-header bg-white d-flex align-items-center justify-content-between">
            <h5 class="mb-0"><i class="bi bi-list-ul me-2"></i>Articles du plan d'achat</h5>
            <div class="d-flex align-items-center gap-2">
              <input class="form-control form-control-sm search" style="width:200px;" type="search" placeholder="Rechercher..." aria-label="search" />
            </div>
          </div>
          <div class="card-body p-0">
            <div class="table-responsive" id="articlesList" data-list='{"valueNames":["id","article_nom","categorie","montant","procedure_achat","date_creation"],"page":5,"pagination":true}'>
              <table class="table table-hover align-middle mb-0" id="articlesListTable">
                <thead class="table-light">
                  <tr>
                    <th class="sort" data-sort="id">#</th>
                    <th class="sort" data-sort="article_nom">Article</th>
                    <th class="sort" data-sort="categorie">Catégorie</th>
                    <th class="sort" data-sort="montant">Montant</th>
                    <th class="sort" data-sort="procedure_achat">Procédure</th>
                    <th class="sort" data-sort="date_limite_achat">Priorité (Date limite)</th>
                    <th class="text-center">Actions</th>
                  </tr>
                </thead>
                <tbody class="list">
                  <!-- Dynamically loaded -->
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
        <div class="card shadow-sm border-0">
          <div class="card-header bg-white">
            <h5 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Ajouter un article</h5>
          </div>
          <div class="card-body">
            
            <form id="formAjouterPlanAchat" autocomplete="off">
              <div class="row g-3 align-items-end">
                <div class="col-md-3">
                  <label for="articleNom" class="form-label">Nom de l'article</label>
                  <input type="text" class="form-control" id="articleNom" name="article_nom" required placeholder="Ex: Ordinateur portable">
                </div>
                <div class="col-md-3">
                  <label for="categorieArticle" class="form-label">Catégorie</label>
                  <select class="form-select" id="categorieArticle" required>
                    <option disabled selected value="">Sélectionnez une catégorie</option>
                    <option value="Biens/Provisions">Biens/Provisions</option>
                    <option value="Services">Services</option>
                    <option value="Travaux">Travaux</option>
                  </select>
                </div>
                <div class="col-md-3">
                  <label for="montantArticle" class="form-label">Montant (U$)</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                    <input type="number" step="0.01" min="0" class="form-control" id="montantArticle" name="montant" required placeholder="0.00">
                  </div>
                </div>
                <div class="col-md-3">
                <label for="dateLimiteAchat" class="form-label">Date limite d'achat</label>
                <input type="date" class="form-control" id="dateLimiteAchat" name="date_limite_achat" required>
              </div>

                <div class="col-md-2">
                  <button type="submit" class="btn btn-success w-100">
                    <i class="bi bi-check-lg me-2"></i>Ajouter
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- List.js -->
<script src="vendors/list.js/list.min.js"></script>
<script>
// Affiche un message Bootstrap (type: 'danger', 'success', etc.) dans la zone d'alerte du formulaire

</script>
