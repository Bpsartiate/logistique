
<div class="modal fade" id="modalDocsFournisseur" tabindex="-1" aria-labelledby="modalDocsFournisseurLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalDocsFournisseurLabel">
          Documents Fournisseur — <span id="nomFournisseurDocs"></span>
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">

        <!-- Filtres avancés -->
        <form id="formFiltreDoc" class="mb-3 row g-3 align-items-end">
          <div class="col-md-4">
            <label class="form-label">Type de document</label>
            <select class="form-select" id="filtreTypeDoc">
              <option value="">Tous</option>
              <option>Contrat</option>
              <option>Assurance</option>
              <option>Certification</option>
              <option>Pièce d'identité</option>
              <!-- ... -->
            </select>
          </div>
          <div class="col-md-3">
            <label class="form-label">Validité</label>
            <select class="form-select" id="filtreValiditeDoc">
              <option value="">Tous</option>
              <option value="valide">Valide</option>
              <option value="expire_bientot">Expire bientôt</option>
              <option value="expire">Expiré</option>
            </select>
          </div>
          <div class="col-md-3">
            <label class="form-label">Recherche texte</label>
            <input class="form-control" id="filtreTexteDoc" type="search" placeholder="Nom, référence...">
          </div>
          <div class="col-md-2">
            <button type="button" class="btn btn-secondary w-100" onclick="resetFiltreDocs()">Réinitialiser</button>
          </div>
        </form>

        <!-- Tableau des documents -->
        <div class="table-responsive">
          <table class="table table-bordered table-hover align-middle" id="tableDocumentsFournisseur">
            <thead class="table-light">
              <tr>
                <th class="sortable" data-col="type_document">Type <span class="sort-indicator"></span></th>
                <th class="sortable" data-col="nom_original">Nom du document <span class="sort-indicator"></span></th>
                <th class="sortable" data-col="date_emission">Date d’émission <span class="sort-indicator"></span></th>
                <th class="sortable" data-col="date_expiration">Date d’expiration <span class="sort-indicator"></span></th>
                <th class="sortable" data-col="statut_validite">Statut validité <span class="sort-indicator"></span></th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <!-- Les lignes sont remplies dynamiquement via JS -->
            </tbody>
          </table>
        </div>
        <div id="paginationDocuments" class="my-2"></div>

      </div>
      <div class="modal-footer">
        <button class="btn btn-outline-primary" type="button" data-bs-toggle="modal" data-bs-target="#modalAjouterDocument">
          <span class="fa fa-plus me-1"></span> Ajouter un document
        </button>
        <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>
<!-- add doc -->
 <div class="modal fade" id="modalAjouterDocument" tabindex="-1" aria-labelledby="modalAjouterDocumentLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form class="modal-content" id="formAjouterDocument" enctype="multipart/form-data" novalidate>
      <div class="modal-header">
        <h5 class="modal-title" id="modalAjouterDocumentLabel">Ajouter un document</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" name="id_fournisseur" value="">
        <div class="mb-3">
          <label class="form-label">Type</label>
          <select class="form-select" name="type" required>
            <option value="">Sélectionner</option>
            <option>Contrat</option>
            <option>Assurance</option>
            <option>Certification</option>
            <option>Pièce d'identité</option>
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label">Nom du document</label>
          <input type="text" class="form-control" name="nom" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Date d’émission</label>
          <input type="date" class="form-control" name="date_emission" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Date d’expiration</label>
          <input type="date" class="form-control" name="date_expiration" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Fichier</label>
          <input type="file" class="form-control" name="fichier" required accept=".pdf,.doc,.docx,.jpg,.png">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" type="submit">Ajouter</button>
        <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Annuler</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal modification document -->
<div class="modal fade" id="modalEditDocument" tabindex="-1" aria-labelledby="modalEditDocumentLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form class="modal-content" id="formEditDocument" enctype="multipart/form-data" novalidate>
      <div class="modal-header">
        <h5 class="modal-title" id="modalEditDocumentLabel">Modifier le document</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" name="id_document" value="">
        <div class="mb-3">
          <label class="form-label">Type</label>
          <select class="form-select" name="type" required>
            <option value="">Sélectionner</option>
            <option>Contrat</option>
            <option>Assurance</option>
            <option>Certification</option>
            <option>Pièce d'identité</option>
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label">Nom du document</label>
          <input type="text" class="form-control" name="nom" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Date d’émission</label>
          <input type="date" class="form-control" name="date_emission" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Date d’expiration</label>
          <input type="date" class="form-control" name="date_expiration" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Remplacer le fichier (optionnel)</label>
          <input type="file" class="form-control" name="fichier" accept=".pdf,.doc,.docx,.jpg,.png">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" type="submit">Enregistrer</button>
        <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Annuler</button>
      </div>
    </form>
  </div>
</div>
<!-- Toastr CSS/JS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script>
  // ---- VARIABLES GLOBALES ----
let fournisseurDocsSelectionneId = null;
let docsFournisseurList = [];

// --- Initialisation globale ---
$(function() {

  // ---- 1. OUVERTURE DU MODAL DOCUMENTS ----
  $(document).on('click', '.btn-docs-fournisseur', function() {
    fournisseurDocsSelectionneId = $(this).data('fournisseur-id');
    const nom = $(this).data('fournisseur-nom');
    $('#nomFournisseurDocs').text(nom);
    chargerDocsFournisseur(fournisseurDocsSelectionneId);
    // Ouvre la modale principale
    $('#modalDocsFournisseur').modal('show');
  });

  // ---- 2. FILTRES ----
  $('#filtreTypeDoc, #filtreValiditeDoc').on('change', renderTableDocuments);
  $('#filtreTexteDoc').on('input', renderTableDocuments);

  // ---- 3. TRI PAR CLIQUE SUR HEADER ----
  $('#tableDocumentsFournisseur').on('click', 'th.sortable', function(){
    let col = $(this).data('col');
    let sort = window.currentDocSort || {col: null, dir: 'asc'};
    if(sort.col === col){
      sort.dir = (sort.dir === 'asc') ? 'desc' : 'asc';
    } else {
      sort.col = col;
      sort.dir = 'asc';
    }
    window.currentDocSort = sort;
    renderTableDocuments();
  });


  // ---- 4. MODALE AJOUT DOCUMENT ----
  $('#modalAjouterDocument').on('show.bs.modal', function () {
    $('#modalDocsFournisseur').modal('hide');
    $('#formAjouterDocument input[name="id_fournisseur"]').val(fournisseurDocsSelectionneId);
  });
  $('#modalAjouterDocument').on('hidden.bs.modal', function () {
    $('#modalDocsFournisseur').modal('show');
  });

  $('#formAjouterDocument').on('submit', function(e){
    e.preventDefault();
    let form = this;
    let fd = new FormData(form);
    fd.set('id_fournisseur', fournisseurDocsSelectionneId);

    $.ajax({
      url: 'http://localhost:3000/documents',
      method: 'POST',
      data: fd,
      contentType: false,
      processData: false,
      success: function(){ 
        $('#modalAjouterDocument').modal('hide');
        toastr.success('Document ajouté');
        form.reset();
        chargerDocsFournisseur(fournisseurDocsSelectionneId);
      },
      error: function(xhr){
        toastr.error(xhr.responseJSON?.error || 'Erreur lors de l\'envoi');
      }
    });
  });


  // ---- 5. MODALE MODIFICATION DOCUMENT ----
  $('#modalEditDocument').on('show.bs.modal', function () {
    $('#modalDocsFournisseur').modal('hide');
    // reset champ fichier à l'ouverture
    $(this).find('input[name="fichier"]').val('');
  });
  $('#modalEditDocument').on('hidden.bs.modal', function () {
    $('#modalDocsFournisseur').modal('show');
  });

  $(document).on('click', '.btn-edit-doc', function() {
    let $tr = $(this).closest('tr');
    let id = $tr.data('id');
    let doc = docsFournisseurList.find(d => d.id == id);
    if(!doc) return;

    let $modal = $('#modalEditDocument');
    $modal.find('input[name="id_document"]').val(id);
    $modal.find('select[name="type"]').val(doc.type_document);
    $modal.find('input[name="nom"]').val(doc.nom_original);
    $modal.find('input[name="date_emission"]').val(doc.date_emission);
    $modal.find('input[name="date_expiration"]').val(doc.date_expiration);
    $modal.find('input[name="fichier"]').val('');
    
    $modal.modal('show');
  });

  $('#formEditDocument').on('submit', function(e){
    e.preventDefault();
    let form = this;
    let id = $(form).find('input[name="id_document"]').val();
    let fd = new FormData(form);
    fd.delete('id_document');
    $.ajax({
      url: 'http://localhost:3000/documents/' + id,
      method: 'PUT',
      data: fd,
      contentType: false,
      processData: false,
      success: function() {
        toastr.success('Document modifié');
        $('#modalEditDocument').modal('hide');
        chargerDocsFournisseur(fournisseurDocsSelectionneId);
      },
      error: function(xhr){
        toastr.error(xhr.responseJSON?.error || 'Erreur mise à jour');
      }
    });
  });


  // ---- 6. SUPPRESSION DOCUMENT ----
  $(document).on('click', '.btn-delete-doc', function() {
    let $tr = $(this).closest('tr');
    let id = $tr.data('id');
    if(!confirm("Supprimer ce document ?")) return;
    $.ajax({
      url: 'http://localhost:3000/documents/' + id,
      method: 'DELETE',
      success: function(){
        toastr.success('Document supprimé');
        chargerDocsFournisseur(fournisseurDocsSelectionneId);
      },
      error: function(xhr){
        toastr.error(xhr.responseJSON?.error || 'Erreur suppression');
      }
    });
  });

});

// ---- 7. CHARGEMENT ET AFFICHAGE DES DOCUMENTS ----
function chargerDocsFournisseur(idFournisseur) {
  $('#tableDocumentsFournisseur tbody').html('<tr><td colspan="6" class="text-center">Chargement...</td></tr>');
  $.get('http://localhost:3000/documents/' + idFournisseur, function(docs) {
    docsFournisseurList = docs; 
    renderTableDocuments();
  }).fail(function(){
    $('#tableDocumentsFournisseur tbody').html('<tr><td colspan="6" class="text-danger text-center">Erreur lors du chargement</td></tr>');
  });
}

// ---- 8. AFFICHAGE TABLEAU FILTRÉ, TRI ET PAGINATION ----
window.currentDocSort = {col: null, dir: 'asc'};
window.currentDocPage = 1;

function renderTableDocuments() {
  let type = $('#filtreTypeDoc').val().toLowerCase();
  let validite = $('#filtreValiditeDoc').val();
  let texte = ($('#filtreTexteDoc').val() || '').toLowerCase();

  let docs = docsFournisseurList.filter(doc => {
    let ok = true;
    if(type && doc.type_document.toLowerCase() !== type) ok = false;
    if(validite) {
      let statut = doc.statut_validite || '';
      if     (validite==='valide' && statut.toLowerCase() !== 'valide') ok = false;
      else if(validite==='expire' && statut.toLowerCase() !== 'expiré') ok = false;
      else if(validite==='expire_bientot' && statut.toLowerCase() !== 'expire bientôt') ok = false;
    }
    if(texte) {
      let haystack = [doc.nom_original, doc.type_document].join(' ').toLowerCase();
      if(!haystack.includes(texte)) ok = false;
    }
    return ok;
  });

  let sort = window.currentDocSort || {col: null, dir: 'asc'};
  if(sort.col) {
    docs = docs.slice().sort((a, b) => {
      let va = a[sort.col], vb = b[sort.col];
      if(sort.col === 'date_emission' || sort.col === 'date_expiration') {
        va = va || '';
        vb = vb || '';
        return (va.localeCompare(vb, 'fr')) * (sort.dir==='asc'?1:-1);
      }
      if(sort.col === 'statut_validite') {
        const order = {'valide':1, 'expire bientôt':2, 'expiré':3};
        let oa = order[(va||'').toLowerCase()]||99, ob = order[(vb||'').toLowerCase()]||99;
        return (oa-ob)*(sort.dir==='asc'?1:-1);
      }
      va = (va||'').toString().toLowerCase();
      vb = (vb||'').toString().toLowerCase();
      return va.localeCompare(vb, 'fr') * (sort.dir==='asc'?1:-1);
    });
  }

  const $tbody = $('#tableDocumentsFournisseur tbody').empty();
  const $pagination = $('#paginationDocuments');
  const pageSize = 10;
  let page = window.currentDocPage || 1;
  let totalPages = Math.ceil(docs.length / pageSize) || 1;
  if (page > totalPages) page = totalPages;
  window.currentDocPage = page;

  if(docs.length === 0) {
    $tbody.append('<tr><td colspan="6" class="text-center text-muted">Aucun document trouvé</td></tr>');
    $pagination.html('');
    $('#tableDocumentsFournisseur th.sortable .sort-indicator').html('');
    return;
  }

  let start = (page-1)*pageSize;
  let docsList = docs.slice(start, start + pageSize);
  docsList.forEach(doc => {
    let badge = statutToBadge(doc.statut_validite);
    let urlAbs = doc.url_public ? ('http://localhost:3000' + doc.url_public) : ('/uploads/' + (doc.nom_genere || ''));
    let urlRel = doc.url_public || ('/uploads/' + (doc.nom_genere || ''));
    let fileExists = urlRel && urlRel !== '/uploads/' && urlRel !== '/uploads/';
    $tbody.append(`
      <tr data-id="${doc.id}">
        <td>${doc.type_document}</td>
        <td>
          ${fileExists ? `<a href="${urlAbs}" target="_blank">${escapeHtml(doc.nom_original)}</a>` : `<span class='text-muted'>Fichier manquant</span>`}
        </td>
        <td>${doc.date_emission || ''}</td>
        <td>${doc.date_expiration || ''}</td>
        <td>${badge}</td>
        <td>
          <button class="btn btn-sm btn-primary btn-edit-doc" title="Éditer"><i class="fa fa-edit"></i></button>
          ${fileExists ? `<a class="btn btn-sm btn-success" href="${urlRel}" download title="Télécharger"><i class="fa fa-download"></i></a>` : `<span class='text-muted small'>Aucun fichier</span>`}
          <button class="btn btn-sm btn-danger btn-delete-doc" title="Supprimer"><i class="fa fa-trash"></i></button>
        </td>
      </tr>
    `);
  });

  let pagHtml = `<nav><ul class="pagination justify-content-center pagination-sm">`;
  pagHtml += `<li class="page-item${page===1?' disabled':''}"><a class="page-link" href="#" data-page="${page-1}">&laquo;</a></li>`;
  for(let i=1;i<=totalPages;i++) {
    if(i===1||i===totalPages||Math.abs(i-page)<=2) {
      pagHtml += `<li class="page-item${i===page?' active':''}"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
    } else if(i===page-3||i===page+3) {
      pagHtml += `<li class="page-item disabled"><span class="page-link">…</span></li>`;
    }
  }
  pagHtml += `<li class="page-item${page===totalPages?' disabled':''}"><a class="page-link" href="#" data-page="${page+1}">&raquo;</a></li>`;
  pagHtml += `</ul></nav>`;
  $pagination.html(pagHtml);

  $pagination.off('click').on('click', 'a.page-link', function(e){
    e.preventDefault();
    let p = Number($(this).data('page'));
    if(p>=1 && p<=totalPages && p!==page) {
      window.currentDocPage = p;
      renderTableDocuments();
    }
  });

  $('#tableDocumentsFournisseur th.sortable').each(function(){
    let col = $(this).data('col');
    let $ind = $(this).find('.sort-indicator');
    if(sort.col === col) {
      $ind.html(sort.dir==='asc' ? '&uarr;' : '&darr;');
    } else {
      $ind.html('');
    }
  });
}

function statutToBadge(statut) {
  if(!statut) return '-';
  let color = "secondary", txt = statut;
  if(statut.toLowerCase()==='valide')       color="success";
  else if(statut.toLowerCase()==='expire bientôt') color="warning text-dark";
  else if(statut.toLowerCase()==='expiré')   color="danger";
  return `<span class="badge bg-${color}">${txt}</span>`;
}

function escapeHtml(str){
  return (str||'').replace(/[<>"'&]/g, s => ({
    '<': '&lt;','>': '&gt;','"':'&quot;',"'":'&#39;','&':'&amp;'
  })[s]);
}

// Fonction pour réinitialiser les filtres
function resetFiltreDocs() {
  $('#filtreTypeDoc').val('');
  $('#filtreValiditeDoc').val('');
  $('#filtreTexteDoc').val('');
  renderTableDocuments();
}

</script>