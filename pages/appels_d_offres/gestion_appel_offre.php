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

    <!-- Widget: Appels d'offres à clôturer ou relancer -->
    <div class="col-md-12 col-xxl-3">
      <div class="card h-md-100">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h6 class="mb-0 mt-2">Alertes Appels d’Offres</h6>
          <button class="btn btn-sm btn-outline-secondary" title="Actualiser" onclick="refreshAlerts()">
            <i class="fas fa-sync-alt"></i>
          </button>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex justify-content-between align-items-center">
              AO-2025-001 <span class="badge bg-warning text-dark">Clôture dans 2 jours</span>
              <button class="btn btn-sm btn-outline-danger ms-2" onclick="closeAO('AO-2025-001')">Clôturer</button>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              AO-2025-002 <span class="badge bg-danger">Aucune réponse reçue</span>
              <button class="btn btn-sm btn-outline-primary ms-2" onclick="remindAO('AO-2025-002')">Relancer</button>
            </li>
          </ul>
        </div>
      </div>
    </div>
    
    <!-- Widget: Documents liés aux appels d'offres -->
    <div class="col-md-12 col-xxl-3">
      <div class="card h-md-100">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h6 class="mb-0 mt-2">Documents liés aux appels d’offres</h6>
          <button class="btn btn-sm btn-outline-secondary" title="Actualiser" onclick="refreshDocuments()">
            <i class="fas fa-sync-alt"></i>
          </button>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush mb-3" style="max-height: 250px; overflow-y:auto;">
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Cahier des charges
              <a href="#" class="btn btn-sm btn-outline-primary" title="Télécharger">
                <i class="fas fa-download"></i>
              </a>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Réponse Société Alpha
              <a href="#" class="btn btn-sm btn-outline-primary" title="Télécharger">
                <i class="fas fa-download"></i>
              </a>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Réponse Fournisseur Beta
              <a href="#" class="btn btn-sm btn-outline-primary" title="Télécharger">
                <i class="fas fa-download"></i>
              </a>
            </li>
          </ul>
          <form class="d-flex gap-2" onsubmit="uploadDocument(event)">
            <input type="file" class="form-control form-control-sm" aria-label="Ajouter un document" required />
            <button class="btn btn-primary btn-sm" type="submit">
              <i class="fas fa-upload me-1"></i>Ajouter
            </button>
          </form>
        </div>
      </div>
    </div>


    <!-- Widget: Analyse comparative des offres -->
    <div class="col-md-12 col-xxl-6">
      <div class="card h-md-100">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h6 class="mb-0 mt-2">Analyse comparative des offres reçues</h6>
          <button class="btn btn-sm btn-outline-primary" onclick="exportOffersCSV()">
            <i class="fas fa-file-export me-1"></i>Exporter
          </button>
        </div>
        <div class="card-body">
          <div class="table-responsive" style="max-height: 300px; overflow-y:auto;">
            <table id="offersTable" class="table table-bordered table-striped align-middle mb-0">
              <thead class="bg-200 text-900">
                <tr>
                  <th>Fournisseur</th>
                  <th>Prix (40%)</th>
                  <th>Délai (20%)</th>
                  <th>Qualité (30%)</th>
                  <th>Garantie (10%)</th>
                  <th>Score total</th>
                  <th>Rang</th>
                  <th>Remarque</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Société Alpha</td>
                  <td>85</td>
                  <td>90</td>
                  <td>95</td>
                  <td>80</td>
                  <td><strong>89.5</strong></td>
                  <td><span class="badge bg-success">1</span></td>
                  <td>Meilleure offre globale</td>
                </tr>
                <tr>
                  <td>Fournisseur Beta</td>
                  <td>80</td>
                  <td>85</td>
                  <td>90</td>
                  <td>85</td>
                  <td>86.5</td>
                  <td><span class="badge bg-secondary">2</span></td>
                  <td>Bon rapport qualité/prix</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div id="offersRadar" style="width:100%; max-width:600px; height: 350px; margin: 20px auto 0;"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="vendors/echarts/echarts.min.js"></script>
<script>
  // Initialiser graphique radar des offres
  const offersRadar = echarts.init(document.getElementById('offersRadar'));
  const radarOption = {
    title: { text: 'Comparaison des Offres', left: 'center' },
    tooltip: {},
    legend: { data: ['Société Alpha', 'Fournisseur Beta'], top: 30 },
    radar: {
      indicator: [
        { name: 'Prix', max: 100 },
        { name: 'Délai', max: 100 },
        { name: 'Qualité', max: 100 },
        { name: 'Garantie', max: 100 }
      ]
    },
    series: [{
      type: 'radar',
      data: [
        { value: [85, 90, 95, 80], name: 'Société Alpha' },
        { value: [80, 85, 90, 85], name: 'Fournisseur Beta' }
      ],
      areaStyle: { opacity: 0.2 }
    }]
  };
  offersRadar.setOption(radarOption);

  // Fonction export CSV tableau offres
  function exportOffersCSV() {
    let csv = [];
    const rows = document.querySelectorAll("#offersTable tr");
    rows.forEach(row => {
      const cols = row.querySelectorAll("td, th");
      const rowData = Array.from(cols).map(td => `"${td.innerText.replace(/"/g, '""')}"`).join(",");
      csv.push(rowData);
    });
    const csvFile = new Blob([csv.join("\n")], { type: "text/csv" });
    const downloadLink = document.createElement("a");
    downloadLink.href = URL.createObjectURL(csvFile);
    downloadLink.download = "analyse_comparative_offres.csv";
    downloadLink.style.display = "none";
    document.body.appendChild(downloadLink);
    downloadLink.click();
    document.body.removeChild(downloadLink);
  }

  // Simuler rafraîchissement alertes
  function refreshAlerts() {
    alert("Données d'alertes mises à jour (simulation).");
  }

  // Simuler clôture appel d'offres
  function closeAO(aoId) {
    alert(`Appel d'offres ${aoId} clôturé (simulation).`);
  }

  // Simuler relance appel d'offres
  function remindAO(aoId) {
    alert(`Relance envoyée pour l'appel d'offres ${aoId} (simulation).`);
  }

  // Simuler rafraîchissement documents
  function refreshDocuments() {
    alert("Liste des documents mise à jour (simulation).");
  }

  // Simuler upload document
  function uploadDocument(event) {
    event.preventDefault();
    const fileInput = event.target.querySelector('input[type="file"]');
    if (fileInput.files.length === 0) {
      alert("Veuillez sélectionner un fichier.");
      return;
    }
    alert(`Document "${fileInput.files[0].name}" ajouté (simulation).`);
    fileInput.value = "";
  }
</script>
sss