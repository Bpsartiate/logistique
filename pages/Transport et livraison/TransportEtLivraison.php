<div class="content">
  <!-- content nav -->
  <?php include_once "content_nav.php" ?>
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
            <div class="col-lg-8">
                <h4 >
                Dashboard Transport & Livraison
                </h4>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- Cartes KPI (indicateurs clés) -->
  <div class="row g-4 mb-4">
    <!-- Expéditions aujourd’hui -->
    <div class="col-md-6">
      <div class="card text-white h-100" role="region" aria-label="Expéditions aujourd’hui">
        <div class="card-body d-flex align-items-center">
          <!-- Icône rapide -->
          <i class="fas text-primary fa-shipping-fast fa-3x me-6" aria-hidden="true"></i>
          <div class="">
            <h5 class="card-title  mt-2">Expéditions aujourd’hui</h5>
            <h3>128</h3>
            <small class="text-primary" >+5% par rapport à hier</small>
          </div>
        </div>
      </div>
    </div>

    <!-- Livraisons à temps -->
    <div class="col-md-6">
      <div class="card text-white h-100" role="region" aria-label="Livraisons à temps">
        <div class="card-body d-flex align-items-center">
          <!-- Icône check -->
          <i class="fas text-success fa-check-circle fa-3x me-6" aria-hidden="true"></i>
          <div>
            <h5 class="card-title mt-2">Livraisons à temps</h5>
            <h3>115</h3>
            <small class="text-success">90% de ponctualité</small>
          </div>
        </div>
      </div>
    </div>

    <!-- Retards -->
    <div class="col-md-6">
      <div class="card text-white h-100" role="region" aria-label="Retards">
        <div class="card-body d-flex align-items-center">
          <!-- Icône alerte -->
          <i class="fas text-warning fa-exclamation-triangle fa-3x me-6" aria-hidden="true"></i>
          <div>
            <h5 class="card-title mt-2">Retards</h5>
            <h3>8</h3>
            <small class="text-warning">6% des livraisons</small>
          </div>
        </div>
      </div>
    </div>

    <!-- Livraisons annulées -->
    <div class="col-md-6">
      <div class="card text-white h-100" role="region" aria-label="Livraisons annulées">
        <div class="card-body d-flex align-items-center">
          <!-- Icône croix -->
          <i class="fas text-danger fa-times-circle fa-3x me-6" aria-hidden="true"></i>
          <div>
            <h5 class="card-title mt-2">Livraisons annulées</h5>
            <h3>5</h3>
            <small  class="text-danger" >3% des commandes</small>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ===================== -->
  <!-- Navigation par onglets -->
  <!-- ===================== -->
  <ul class="nav nav-tabs mb-4" id="dashboardTabs" role="tablist" aria-label="Navigation du dashboard">
    <li class="nav-item" role="presentation">
      <button class="nav-link active" id="suivi-tab" data-bs-toggle="tab" data-bs-target="#suivi" type="button" role="tab" aria-controls="suivi" aria-selected="true">
        <i class="fas fa-map-marker-alt me-1" aria-hidden="true"></i> Suivi en temps réel
      </button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link" id="statistiques-tab" data-bs-toggle="tab" data-bs-target="#statistiques" type="button" role="tab" aria-controls="statistiques" aria-selected="false">
        <i class="fas fa-chart-bar me-1" aria-hidden="true"></i> Statistiques & Rapports
      </button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link" id="livraisons-tab" data-bs-toggle="tab" data-bs-target="#livraisons" type="button" role="tab" aria-controls="livraisons" aria-selected="false">
        <i class="fas fa-list me-1" aria-hidden="true"></i> Livraisons récentes
      </button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link" id="documents-tab" data-bs-toggle="tab" data-bs-target="#documents" type="button" role="tab" aria-controls="documents" aria-selected="false">
        <i class="fas fa-file-alt me-1" aria-hidden="true"></i> Gestion documents
      </button>
    </li>
  </ul>

  <!-- ===================== -->
  <!-- Contenu des onglets -->
  <!-- ===================== -->
  <div class="tab-content" id="dashboardTabsContent">

    <!-- Onglet Suivi en temps réel -->
    <div class="tab-pane fade show active" id="suivi" role="tabpanel" aria-labelledby="suivi-tab">
      <div class="card mb-4">
        <div class="card-header d-flex align-items-center">
          <i class="fas fa-map-marker-alt me-2" aria-hidden="true"></i>
          <h5 class="mb-0">Carte des livreurs</h5>
        </div>
        <div class="card-body p-0">
          <!-- Placeholder pour carte interactive -->
          <div id="map" style="height: 350px; background-color: #e9ecef; display: flex; justify-content: center; align-items: center; color: #6c757d; font-style: italic; font-size: 1.2rem; border-radius: 0.25rem;">
            Carte interactive en cours d'intégration
          </div>
        </div>
      </div>
    </div>

    <!-- Onglet Statistiques & Rapports -->
    <div class="tab-pane fade" id="statistiques" role="tabpanel" aria-labelledby="statistiques-tab">
      <div class="card">
        <div class="card-header d-flex align-items-center">
          <i class="fas fa-chart-bar me-2" aria-hidden="true"></i>
          <h5 class="mb-0">Statistiques de livraison</h5>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush" role="list">
            <!-- Chaque item affiche un indicateur clé avec badge coloré -->
            <li class="list-group-item d-flex justify-content-between align-items-center" role="listitem">
              Délais moyens de livraison
              <span class="badge bg-primary rounded-pill" aria-label="2.4 jours">2.4 jours</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center" role="listitem">
              Taux de respect des délais
              <span class="badge bg-success rounded-pill" aria-label="90 pour cent">90%</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center" role="listitem">
              Taux de retours
              <span class="badge bg-warning rounded-pill" aria-label="4.5 pour cent">4.5%</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center" role="listitem">
              Taux de litiges
              <span class="badge bg-danger rounded-pill" aria-label="1.2 pour cent">1.2%</span>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Onglet Livraisons récentes -->
    <div class="tab-pane fade" id="livraisons" role="tabpanel" aria-labelledby="livraisons-tab">
      <div class="card">
        <div class="card-header d-flex align-items-center">
          <i class="fas fa-list me-2" aria-hidden="true"></i>
          <h5 class="mb-0">Livraisons récentes</h5>
        </div>
        <div class="card-body py-4">
            <div id="livraisonsList" data-list='{"valueNames":["numero","type","adresse","statut","pagination":true}'>
                <div class="row">
                    <div class="col-md-6">
                        <input class="search form-control mb-3" placeholder="Rechercher une livraison" />

                    </div>
                </div>
                <table class="table table-striped align-middle">
                    <thead class="bg-200 text-900">
                    <tr>
                        <th><button class="sort btn btn-link p-0" data-sort="numero">Numéro</button></th>
                        <th><button class="sort btn btn-link p-0" data-sort="client">Client</button></th>
                        <th><button class="sort btn btn-link p-0" data-sort="adresse">Adresse</button></th>
                        <th><button class="sort btn btn-link p-0" data-sort="datePrevue">Date prévue</button></th>
                        <th><button class="sort btn btn-link p-0" data-sort="statut">Statut</button></th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody class="list">
                    <!-- Les lignes seront générées par JS -->
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
    <!-- modal livraison -->
     <?php include_once "livraisonModal.php"; ?>

    <!-- Onglet Gestion documents -->
    <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab">
      <div class="card">
        <div class="card-header d-flex align-items-center">
          <i class="fas fa-file-alt me-2" aria-hidden="true"></i>
          <h5 class="mb-0">Documents et preuves de livraison</h5>
        </div>
        <div class="card-body">
          <!-- Formulaire upload fichiers -->
          <form id="uploadDocumentsForm" class="mb-3" aria-label="Formulaire d'ajout de documents">
            <div class="mb-3">
              <label for="fileInput" class="form-label">Ajouter une preuve (photo, PDF)</label>
              <input class="form-control" type="file" id="fileInput" multiple accept="image/*,.pdf" aria-describedby="fileHelp" />
              <div id="fileHelp" class="form-text">Formats acceptés : images et PDF.</div>
            </div>
            <button type="submit" class="btn btn-primary">Uploader</button>
          </form>
          <!-- Aperçu des documents uploadés -->
          <div id="documentsPreview" class="d-flex flex-wrap gap-3" aria-live="polite" aria-atomic="true"></div>
        </div>
      </div>
    </div>

  </div> <!-- fin tab-content -->

  <!-- Styles spécifiques pour aperçu documents -->
  <style>
    .doc-preview {
      max-height: 150px;
      object-fit: contain;
      border: 1px solid #ddd;
      border-radius: 0.25rem;
      margin-bottom: 0.5rem;
    }
    /* Style pour aperçu PDF */
    .doc-preview.pdf {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 150px;
      height: 150px;
      background-color: #f8d7da;
      color: #842029;
      font-weight: bold;
      border: 1px solid #f5c2c7;
      border-radius: 0.25rem;
      text-align: center;
      padding: 0.5rem;
      word-break: break-word;
    }
  </style>

  <!-- Script JS pour gestion upload et aperçu -->
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const uploadForm = document.getElementById('uploadDocumentsForm');
      const fileInput = document.getElementById('fileInput');
      const documentsPreview = document.getElementById('documentsPreview');

      uploadForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const files = fileInput.files;
        if (!files.length) {
          alert('Veuillez sélectionner au moins un fichier.');
          return;
        }
        for (const file of files) {
          const reader = new FileReader();
          reader.onload = (event) => {
            if (file.type.startsWith('image/')) {
              const img = document.createElement('img');
              img.src = event.target.result;
              img.alt = file.name;
              img.classList.add('doc-preview');
              documentsPreview.appendChild(img);
            } else if (file.type === 'application/pdf') {
              const pdfDiv = document.createElement('div');
              pdfDiv.classList.add('doc-preview', 'pdf');
              pdfDiv.textContent = file.name;
              documentsPreview.appendChild(pdfDiv);
            }
          };
          reader.readAsDataURL(file);
        }
        uploadForm.reset();
      });
    });
  </script>

</div>

</div>
   