<div class="modal modal-dialog-scrollable fade modal-lg" id="ficheFournisseur" tabindex="-1" aria-labelledby="ficheFournisseur" aria-hidden="true">
<div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
         <!-- Fil d'Ariane -->
        <nav aria-label="breadcrumb" class="mb-3">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fas fa-users me-1"></i>Fournisseurs</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-building me-1"></i>Société Alpha</li>
          </ol>
        </nav>

      </div>
      <div class="modal-body">
        <!-- Onglets -->
        <ul class="nav nav-tabs" id="fournisseurTabs" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link active" id="infos-tab" data-bs-toggle="tab" data-bs-target="#infos" type="button" role="tab">Informations</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="evaluations-tab" data-bs-toggle="tab" data-bs-target="#evaluations" type="button" role="tab">Évaluations</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="documents-tab" data-bs-toggle="tab" data-bs-target="#documents" type="button" role="tab">Documents</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="historique-tab" data-bs-toggle="tab" data-bs-target="#historique" type="button" role="tab">Historique</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="conformite-tab" data-bs-toggle="tab" data-bs-target="#conformite" type="button" role="tab">Conformité</button>
          </li>
        </ul>
       <div class="container-fluid">
       <div class="tab-content mt-3">
          <!-- Onglet Informations générales -->
          <div class="tab-pane fade show active" id="infos" role="tabpanel" aria-labelledby="infos-tab">
            <div class="row">
              <div class="col-md-12">
                 <!-- div 1 : Informations de base -->
              <div class="mt-4">
                <h5><i class="fas fa-id-badge me-2 text-secondary"></i>Informations de base</h5>
                <dl class="row">
                  <dt class="col-sm-4"><i class="fas fa-building me-1 text-muted"></i>Nom du fournisseur</dt>
                  <dd class="col-sm-8 fw-semibold"></dd>

                  <dt class="col-sm-4"><i class="fas fa-tag me-1 text-muted"></i>Nom commercial</dt>
                  <dd class="col-sm-8" id="nomCommercial"></dd>

                  <dt class="col-sm-4"><i class="fas fa-file-invoice me-1 text-muted"></i>Numéro d'identification fiscale</dt>
                  <dd class="col-sm-8"><span class="badge bg-info">NIF: <span id="nif"></span></span> <span class="badge bg-info ms-1">TVA: <span id="tva"></span></span></dd>

                  <dt class="col-sm-4"><i class="fas fa-balance-scale me-1 text-muted"></i>Statut juridique</dt>
                  <dd class="col-sm-8" id="statutJuridique"></dd>

                  <dt class="col-sm-4"><i class="fas fa-map-marker-alt me-1 text-muted"></i>Adresse du siège social</dt>
                  <dd class="col-sm-8" id="adresseSiege"></dd>

                  <dt class="col-sm-4"><i class="fas fa-file-invoice-dollar me-1 text-muted"></i>Adresse de facturation</dt>
                  <dd class="col-sm-8" id="adresseFacturation"></dd>

                  <dt class="col-sm-4"><i class="fas fa-truck me-1 text-muted"></i>Adresse de livraison</dt>
                  <dd class="col-sm-8" id="adresseLivraison"></dd>

                  <dt class="col-sm-4"><i class="fas fa-globe me-1 text-muted"></i>Site web</dt>
                  <dd class="col-sm-8"><a href="#" target="_blank" rel="noopener" id="siteWeb"></a></dd>
                </dl>
              </div>
              </div>
              <div class="col-md-12">
                 <!-- div 3 : Informations financières -->
             <div class="mt-4">
              <h5><i class="fas fa-wallet me-2 text-secondary"></i>Informations financières</h5>
              <dl class="row">
                
                <dt class="col-sm-4"><i class="fas fa-university me-1 text-muted"></i>RIB / IBAN</dt>
                <dd class="col-sm-8" id="rib"></dd>

                <dt class="col-sm-4"><i class="fas fa-university me-1 text-muted"></i>Nom de la Banque</dt>
                <dd class="col-sm-8" id="nomBanque"></dd>

                <dt class="col-sm-4"><i class="fas fa-university me-1 text-muted"></i>Address de la Banque</dt>
                <dd class="col-sm-8" id="adresseBanque"></dd>


                <dt class="col-sm-4"><i class="fas fa-clock me-1 text-muted"></i>Conditions de paiement</dt>
                <dd class="col-sm-8" id="conditionsPaiement"></dd>

                <dt class="col-sm-4"><i class="fas fa-coins me-1 text-muted"></i>Devise</dt>
                <dd class="col-sm-8" ><span class="badge text-transform_uppercase bg-info" id="devise"></span></dd>

                <dt class="col-sm-4"><i class="fas fa-chart-line me-1 text-muted"></i>Informations de crédit</dt>
                <dd class="col-sm-8" id="infosCredit"></dd>
              </dl>
              </div>
              </div>
            </div>
            <!-- div 2 : Informations de contact -->
            <div class="mt-4">
              <h5><i class="fas fa-address-book me-2 text-secondary"></i>Informations de contact</h5>
              <table class="table table-bordered table-striped align-middle" id="contactsTable">
                <thead class="table-light">
                  <tr>
                    <th><i class="fas fa-user-tag me-1"></i>Type de contact</th>
                    <th><i class="fas fa-user me-1"></i>Nom & Titre</th>
                    <th><i class="fas fa-phone me-1"></i>Téléphone</th>
                    <th><i class="fas fa-envelope me-1"></i>Email</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- Contacts dynamiques -->
                </tbody>
              </table>
            </div>

           

             <div class="row">
            <!-- div 4 : Produits / Services -->
              <div class="col-md-12">
                <div class="mt-4">
                  <h5><i class="fas fa-boxes me-2 text-secondary"></i>Produits / Services</h5>
                  <ul class="list-unstyled ps-3" id="produitsList">
                    <!-- Produits/services dynamiques -->
                  </ul>
                  <!-- Description -->
                  <div id="descriptionProduit" class="mt-3"></div>
                  <!-- Tarifs -->
                  <div id="tarifsProduit" class="mt-3"></div>
                  <!-- Délai de livraison -->
                  <div id="delaiLivraison" class="mt-3"></div>
                  <!-- Garantie -->
                  <div id="conditionsGarantie" class="mt-3"></div>
                </div>
              </div>
              <!-- div 5 : Informations contractuelles -->
              <div class="col-md-12">
                <div class="mt-4">
                  <h5><i class="fas fa-file-contract me-2 text-secondary"></i>Informations contractuelles</h5>
                  <dl class="row">
                    <dt class="col-sm-4"><i class="fas fa-calendar-alt me-1 text-muted"></i>Date de début de la relation</dt>
                    <dd class="col-sm-8" id="dateDebutRelation"></dd>

                    <dt class="col-sm-4"><i class="fas fa-calendar-times me-1 text-muted"></i>Date de fin de contrat</dt>
                    <dd class="col-sm-8" id="dateFinContrat"></dd>

                    <dt class="col-sm-4"><i class="fas fa-file-alt me-1 text-muted"></i>Conditions générales de vente</dt>
                    <dd class="col-sm-8" id="cgv"></dd>

                    <dt class="col-sm-4"><i class="fas fa-hashtag me-1 text-muted"></i>Référence contrat</dt>
                    <dd class="col-sm-8" id="refContrat"></dd>

                    <dt class="col-sm-4"><i class="fas fa-file-download me-1 text-muted"></i>Documents contractuels</dt>
                    <dd class="col-sm-8">
                    <ul class="list-unstyled mb-0" id="documentsContractuels"></ul>
                    </dd>
                  </dl>
                </div>
              </div>
             </div>
            <!-- div 6 : Performance -->
            <div class="mt-4">
              <h5><i class="fas fa-tachometer-alt me-2 text-secondary"></i>Performance</h5>
              <div class="row text-center">
                <div class="col-md-3">
                  <h3 class="text-success" id="perfQualite"></h3>
                  <p id="perfQualiteTxt"></p>
                </div>
                <div class="col-md-3">
                  <h3 class="text-warning" id="perfDelais"></h3>
                  <p id="perfDelaisTxt"></p>
                </div>
                <div class="col-md-3">
                  <h3 class="text-info" id="perfReactivite"></h3>
                  <p id="perfReactiviteTxt"></p>
                </div>
                <div class="col-md-3">
                  <h3 class="text-primary" id="perfSatisfaction"></h3>
                  <p id="perfSatisfactionTxt"></p>
                </div>
              </div>
              <h6 class="mt-3">Notes internes</h6>
              <p id="notesInternes"></p>
            </div>

            <!-- div 7 : Autres informations -->
            <div class="mt-4">
              <h5><i class="fas fa-info me-2 text-secondary"></i>Autres informations</h5>
              <ul>
                <li id="certifications"></li>
                <li id="remarques"></li>
                <li id="dateMaj"></li>
              </ul>
            </div>
          </div>


          <!-- Onglet Évaluations -->
          <div class="tab-pane fade" id="evaluations" role="tabpanel" aria-labelledby="evaluations-tab">
            <div class="row">
              <div class="col-md-6">
              <div class="mb-3 text-center">
             <!-- Conteneur du graphique avec spinner -->
             <div id="evaluationChartWrapper" style="width:100%;max-width:600px;margin:auto;position:relative;">
              <!-- Spinner unique pour ce composant -->
              <div  class="d-flex justify-content-center align-items-center"
                  style="height:400px;position:absolute;top:0;left:0;right:0;bottom:0;
                          background:rgba(255, 255, 255, 0);z-index:10;">
                <div id="loader2" class="spinner-border" role="status">
                  <span class="visually-hidden">Loading...</span>
                </div>
              </div>
              <div id="evaluationChart" style="width:100%;height:400px; display:none;"></div>
              </div>
              </div>
              </div>
              <div class="col-md-6">
                <div class="mt-4">
              <h6>Critères d'évaluation</h6>
              <table class="table table-bordered table-sm">
                <thead>
                  <tr>
                    <th>Critère</th>
                    <th>Score</th>
                    <th>Commentaire</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- Critères d'évaluation dynamiques -->
                </tbody>
              </table>
              <button class="btn btn-success btn-sm mb-2">Ajouter / Modifier une évaluation</button>
            </div>
              </div>
            </div>
            
            <div class="row justify-content-center ">
              <div class="col-md-10">
                <h6>Historique des évaluations</h6>
                <ul class="list-group" id="historiqueEvaluations"></ul>
              </div>
            </div>
          </div>
          <!-- Onglet Documents -->
          <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab">
            <div class="mb-3">
              <h6>Liste des documents</h6>
              <ul class="list-group mb-2">
                <!-- Documents dynamiques -->
              </ul>
              <form class="d-flex align-items-center gap-2">
                <input type="file" class="form-control form-control-sm" />
                <button class="btn btn-primary btn-sm" type="submit"><i class="fas fa-upload me-1"></i>Ajouter</button>
              </form>
            </div>
          </div>
          <!-- Onglet Historique -->
          <div class="tab-pane fade" id="historique" role="tabpanel" aria-labelledby="historique-tab">
            <h6>Journal d'activité</h6>
               <?php include_once "historique_fourn.php" ?>
          </div>
          <!-- Onglet Conformité -->
          <div class="tab-pane fade" id="conformite" role="tabpanel" aria-labelledby="conformite-tab">
            <h6>Conformité et code de conduite</h6>
            <ul>
              <li id="codeConduite"></li>
              <li id="questionnaireFournisseur"></li>
              <li id="certificationsConformite"></li>
              <li id="dernierAudit"></li>
            </ul>
            <a href="#" class="btn btn-outline-secondary btn-sm"><i class="fas fa-book me-1"></i>Consulter le code de conduite</a>
          </div>
        </div>
       </div>
      </div>
      <div class="modal-footer">
        <span class="me-auto text-muted">Connecté en tant que <strong>Responsable Achats</strong></span>
        <button class="btn btn-outline-secondary" data-bs-dismiss="modal">Fermer</button>
        <button class="btn btn-primary">Modifier</button>
        <button id="btnOuvrirModalEvaluation" class="btn btn-success">Ajouter évaluation</button>
        <button id="btnOuvrirModalIncident" class="btn btn-warning">Signaler incident</button>
        <button class="btn btn-outline-info">Exporter fiche</button>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
let ficheFournisseurId = null;
let ficheFournisseurNom = null;
function chargerFicheFournisseur(id) {
  ficheFournisseurId = id;
  // Infos générales
  $.get('http://localhost:3000/fournisseurs', function(fournisseurs) {
    const f = fournisseurs.find(f => f.id == id);
    if (!f) return;
    ficheFournisseurNom = f.nom || '';
    // Infos générales
    $('#ficheFournisseur .fw-semibold').text(f.nom || '');
    // Fil d'Ariane : nom du fournisseur
    $('#ficheFournisseur .breadcrumb-item.active').html(`<i class="fas fa-building me-1"></i>${f.nom || ''}`);
    $('#ficheFournisseur #nomCommercial').text(f.nom_commercial || '');
    $('#ficheFournisseur #nif').text(f.nif || '');
    $('#ficheFournisseur #tva').text(f.tva || '');
    $('#ficheFournisseur #statutJuridique').text(f.statut_juridique || '');
    $('#ficheFournisseur #adresseSiege').text(f.adresse_siege || '');
    $('#ficheFournisseur #adresseFacturation').text(f.adresse_facturation || '');
    $('#ficheFournisseur #adresseLivraison').text(f.adresse_livraison || '');
    $('#ficheFournisseur #siteWeb').attr('href', f.site_web || '#').text(f.site_web || '');
    // Financières
    $('#ficheFournisseur #rib').text(f.rib_iban || '');
    $('#ficheFournisseur #nomBanque').text(f.banque || '');
    $('#ficheFournisseur #adresseBanque').text(f.adresse_banque || '');
    $('#ficheFournisseur #conditionsPaiement').text(f.conditions_paiement || '');
    $('#ficheFournisseur #devise').text(f.devise || '');
    $('#ficheFournisseur #infosCredit').text(f.credit_info || '');
    // Contacts
    let contactsHtml = '';
    if (f.contacts && f.contacts.length) {
      f.contacts.forEach(function(c) {
        let type = c.type_contact ? c.type_contact.toLowerCase() : '';
        let badgeClass = 'success';
        if (type === 'principal') badgeClass = 'success';
        else if (type === 'facturation') badgeClass = 'primary';
        else if (type === 'technique') badgeClass = 'warning text-dark';
        contactsHtml += `<tr><td><span class="badge bg-${badgeClass}">${c.type_contact}</span></td><td>${c.nom}</td><td><a href="tel:${c.telephone}">${c.telephone}</a></td><td><a href="mailto:${c.email}">${c.email}</a></td></tr>`;
      });
    }
    $('#ficheFournisseur #contactsTable tbody').html(contactsHtml);
    // Produits/services
    let produitsHtml = '';
    if (f.produits && f.produits.length) {
      f.produits.forEach(p => {
        produitsHtml += `<li><i class="fas fa-check-circle text-success me-2"></i>${p.description}</li>`;
      });
    }
    $('#ficheFournisseur #produitsList').html(produitsHtml);
    // Description
    $('#ficheFournisseur #descriptionProduit').html(`<strong>Description :</strong> ${f.description || ''}`);
    // Tarifs
    $('#ficheFournisseur #tarifsProduit').html(`<strong>Tarifs :</strong> ${f.tarifs || ''}`);
    // Délai de livraison
    $('#ficheFournisseur #delaiLivraison').html(`<strong>Délai de livraison standard :</strong> ${f.delai_livraison || ''}`);
    // Garantie
    $('#ficheFournisseur #conditionsGarantie').html(`<strong>Conditions de garantie :</strong> ${f.conditions_garantie || ''}`);
    // Contractuelles
    $('#ficheFournisseur #dateDebutRelation').text(f.date_debut_relation || '');
    $('#ficheFournisseur #dateFinContrat').text(f.date_fin_contrat || '');
    $('#ficheFournisseur #cgv').html(f.conditions_generales_vente ? `<span>${f.conditions_generales_vente}</span>` : (f.cgv ? `<a href="${f.cgv}" target="_blank">Voir CGV</a>` : ''));
    $('#ficheFournisseur #refContrat').text(f.reference_contrat || '');
    let docsContratHtml = '';
    if (f.documents_contractuels && f.documents_contractuels.length) {
      f.documents_contractuels.forEach(doc => {
        docsContratHtml += `<li><a href="${doc.url}" target="_blank"><i class="fas fa-file-alt me-1"></i>${doc.nom}</a></li>`;
      });
    }
    $('#ficheFournisseur #documentsContractuels').html(docsContratHtml);
    // Performance
    $('#ficheFournisseur #perfQualite').html(f.perf_qualite ? `<i class="fas fa-check-circle me-1"></i>${f.perf_qualite}%` : '');
    $('#ficheFournisseur #perfQualiteTxt').text(f.perf_qualite_txt || '');
    $('#ficheFournisseur #perfDelais').html(f.perf_delais ? `<i class="fas fa-clock me-1"></i>${f.perf_delais}%` : '');
    $('#ficheFournisseur #perfDelaisTxt').text(f.perf_delais_txt || '');
    $('#ficheFournisseur #perfReactivite').html(f.perf_reactivite ? `<i class="fas fa-bolt me-1"></i>${f.perf_reactivite}%` : '');
    $('#ficheFournisseur #perfReactiviteTxt').text(f.perf_reactivite_txt || '');
    $('#ficheFournisseur #perfSatisfaction').html(f.perf_satisfaction ? `<i class="fas fa-smile me-1"></i>${f.perf_satisfaction}%` : '');
    $('#ficheFournisseur #perfSatisfactionTxt').text(f.perf_satisfaction_txt || '');
    $('#ficheFournisseur #notesInternes').text(f.notes_internes || '');
    // Autres infos
    $('#ficheFournisseur #certifications').text(f.certifications || '');
    $('#ficheFournisseur #remarques').text(f.remarques || '');
    $('#ficheFournisseur #dateMaj').text(f.date_maj || '');
    // Conformité
    $('#ficheFournisseur #codeConduite').text(f.code_conduite || '');
    $('#ficheFournisseur #questionnaireFournisseur').text(f.questionnaire_fournisseur || '');
    $('#ficheFournisseur #certificationsConformite').text(f.certifications_conformite || '');
    $('#ficheFournisseur #dernierAudit').text(f.dernier_audit || '');
    // Statut utilisateur (footer)
    $('#ficheFournisseur .me-auto.text-muted').html(`Connecté en tant que <strong>${f.role_utilisateur || 'Utilisateur'}</strong>`);
  });

  // Documents
  $.get('http://localhost:3000/documents/' + id, function(docs) {
    let html = '';
    docs.forEach(doc => {
      html += `<li class="list-group-item d-flex justify-content-between align-items-center">
        ${doc.nom_original}
        <span>
          <span class="badge bg-${doc.statut_validite==='Valide'?'success':doc.statut_validite==='Expiré'?'danger':'warning text-dark'} me-2" title="${doc.statut_validite}">${doc.statut_validite}</span>
          ${doc.url_public ? `<a href="${doc.url_public}" class="btn btn-sm btn-outline-primary" download><i class="fas fa-download"></i></a>` : ''}
        </span>
      </li>`;
    });
    $('#documents .list-group').html(html);
  });

  // Evaluations : afficher l'historique et remplir le tableau des critères
  $.get('http://localhost:3000/evaluations/' + id, function(evals) {
    // Historique amélioré avec style et utilisateur
    let evalHtml = '';
    if (evals && evals.length) {
      evals.forEach(ev => {
        // Couleur du score global
        let score = typeof ev.score_global === 'number' ? ev.score_global : null;
        let color = score === null ? 'secondary' : (score * 10 < 50 ? 'danger' : 'success');
        // Utilisateur
        let utilisateur = ev.utilisateur || ev.auteur || '-';
        // Date
        let date = ev.date_evaluation ? ev.date_evaluation.substring(0, 10) : '-';
        evalHtml += `
        <li class="list-group-item p-3 border rounded mb-2 shadow-sm" style="background: #f8fafc;">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <span class="badge bg-primary"><i class="fas fa-calendar-alt me-1"></i> ${date}</span>
               <span class="ms-2 badge bg-${ev.action && ev.action.toLowerCase() === 'modification' ? 'warning text-dark' : 'success'}">
          <i class="fas fa-${ev.action && ev.action.toLowerCase() === 'modification' ? 'edit' : 'plus'} me-1"></i>
          ${(ev.action && (ev.action.toLowerCase() === 'modification' || ev.action.toLowerCase() === 'modifié')) ? 'Modification' : 'Ajout'}
        </span>
            <span class="badge bg-info text-dark"><i class="fas fa-user me-1"></i> ${utilisateur}</span>
          </div>
          <div class="mb-2">
            <span class="fw-bold">Score global :</span> <span class="badge bg-${color} fs-3">${score !== null ? (score * 10).toFixed(1) + ' %' : '-'}</span>
          </div>
          <table class="table table-bordered table-sm table-hover mb-2" style="background: #fff;">
            <thead class="table-light">
              <tr>
                <th>Critère</th>
                <th>Score</th>
                <th>Commentaire</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Qualité</td>
                <td>${ev.qualite !== undefined && ev.qualite !== null ? (ev.qualite * 10) + ' %' : '-'}</td>
                <td>${ev.commentaire_qualite || ''}</td>
              </tr>
              <tr>
                <td>Délai</td>
                <td>${ev.delai !== undefined && ev.delai !== null ? (ev.delai * 10) + ' %' : '-'}</td>
                <td>${ev.commentaire_delai || ''}</td>
              </tr>
              <tr>
                <td>Conformité</td>
                <td>${ev.conformite !== undefined && ev.conformite !== null ? (ev.conformite * 10) + ' %' : '-'}</td>
                <td>${ev.commentaire_conformite || ''}</td>
              </tr>
              <tr>
                <td>Service</td>
                <td>${ev.service !== undefined && ev.service !== null ? (ev.service * 10) + ' %' : '-'}</td>
                <td>${ev.commentaire_service || ''}</td>
              </tr>
              <tr>
                <td>Communication</td>
                <td>${ev.communication !== undefined && ev.communication !== null ? (ev.communication * 10) + ' %' : '-'}</td>
                <td>${ev.commentaire_communication || ''}</td>
              </tr>
              <tr>
                <td>Coût</td>
                <td>${ev.cout !== undefined && ev.cout !== null ? (ev.cout * 10) + ' %' : '-'}</td>
                <td>${ev.commentaire_cout || ''}</td>
              </tr>
            </tbody>
       
          </table>
          <div class="fst-italic text-muted"><i class="fas fa-comment-dots me-1"></i>${ev.commentaire || ''}</div>
        </li>`;
      });
    } else {
      evalHtml = '<li class="list-group-item text-muted text-center">Aucune évaluation</li>';
    }
    $('#historiqueEvaluations').html(evalHtml);

    // Tableau des critères (dernière évaluation)
    let critHtml = '';
    if (evals && evals.length) {
      const last = evals[0];
      const criteres = [
        { label: 'Qualité', val: last.qualite },
        { label: 'Délai', val: last.delai },
        { label: 'Conformité', val: last.conformite },
        { label: 'Service', val: last.service },
        { label: 'Communication', val: last.communication },
        { label: 'Coût', val: last.cout }
      ];
      criteres.forEach(c => {
        let score = (typeof c.val === 'number' && !isNaN(c.val)) ? c.val * 10 : null;
        let color = score === null ? '' : (score < 50 ? 'danger' : 'success');
        critHtml += `<tr><td>${c.label}</td><td><span class='badge bg-${color}'>${score !== null ? score + ' %' : '-'}</span></td><td>${last.commentaire || ''}</td></tr>`;
      });
    } else {
      critHtml = `<tr><td colspan='3' class='text-center text-muted'>Aucune évaluation</td></tr>`;
    }
    $('#evaluations table tbody').html(critHtml);
  });

  // Incidents
  $.get('http://localhost:3000/incidents/' + id, function(incidents) {
    let histHtml = '';
    if (incidents && incidents.length) {
      incidents.forEach(inc => {
        histHtml += `<tr>
          <td>${inc.date_signalement || ''}</td>
          <td>${inc.utilisateur || ''}</td>
          <td><span class="text-danger"><i class="fas fa-exclamation-triangle"></i> Incident</span></td>
          <td>${inc.type_incident || ''}</td>
          <td>${inc.description || ''}</td>
        </tr>`;
      });
    } else {
      histHtml = '<tr><td colspan="5" class="text-center text-muted">Aucun incident</td></tr>';
    }
    $('#historique table tbody').html(histHtml);
  });
}

// Ouvre la fiche fournisseur et charge les données
$(document).on('click', '.btn-fiche-fournisseur', function() {
  const id = $(this).data('fournisseur-id');
  chargerFicheFournisseur(id);
  $('#ficheFournisseur').modal('show');
});

// Bouton Ajouter évaluation : ouvre le modal modal_evalu.php
$(document).on('click', '#btnOuvrirModalEvaluation', function() {
  // Fermer la fiche fournisseur avant d'ouvrir la modale d'évaluation
  const ficheModal = bootstrap.Modal.getOrCreateInstance(document.getElementById('ficheFournisseur'));
  ficheModal.hide();
  setTimeout(function() {
    if (typeof window.ouvrirModaleEvaluation === 'function') {
      window.ouvrirModaleEvaluation(ficheFournisseurId, ficheFournisseurNom);
    } else if ($('#panelEvaluationFournisseur').length) {
      // Si la fonction n'est pas globale, on tente d'ouvrir le modal Bootstrap
      $('#fournisseurNom').text(ficheFournisseurNom);
      const myModal = new bootstrap.Modal(document.getElementById('panelEvaluationFournisseur'));
      myModal.show();
    }
  }, 400); // attendre la fermeture du premier modal
});

// Bouton Signaler incident : ouvre le modal signaler_incident.php
$(document).on('click', '#btnOuvrirModalIncident', function() {
  // Fermer la fiche fournisseur avant d'ouvrir la modale d'incident
  const ficheModal = bootstrap.Modal.getOrCreateInstance(document.getElementById('ficheFournisseur'));
  ficheModal.hide();
  setTimeout(function() {
    if (typeof window.ouvrirModalSignalerIncident === 'function') {
      window.ouvrirModalSignalerIncident(ficheFournisseurId, ficheFournisseurNom);
    } else if ($('#modalIncidentFournisseur').length) {
      // Si la fonction n'est pas globale, on tente d'ouvrir le modal Bootstrap
      $('#incidentFournisseurNom').text(ficheFournisseurNom);
      const myModal = new bootstrap.Modal(document.getElementById('modalIncidentFournisseur'));
      myModal.show();
    }
  }, 400); // attendre la fermeture du premier modal
});
</script>
