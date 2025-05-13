
  // Données simulées
  let alertsData = [
    { id: 'AO-2025-001', label: 'Clôture dans 2 jours', type: 'warning' },
    { id: 'AO-2025-002', label: 'Aucune réponse reçue', type: 'danger' }
  ];

  let documentsData = [
    { id: 1, name: 'Cahier des charges', url: '#' },
    { id: 2, name: 'Réponse Société Alpha', url: '#' },
    { id: 3, name: 'Réponse Fournisseur Beta', url: '#' }
  ];

  let offersData = [
    {
      fournisseur: 'Société Alpha',
      prix: 85,
      delai: 90,
      qualite: 95,
      garantie: 80,
      remarque: 'Meilleure offre globale'
    },
    {
      fournisseur: 'Fournisseur Beta',
      prix: 70,
      delai: 65,
      qualite: 80,
      garantie: 55,
      remarque: 'Bon rapport qualité/prix'
    }
  ];

  // Rafraîchir la liste des alertes
  function refreshAlerts() {
    const ul = document.getElementById('alertsList');
    ul.innerHTML = '';
    alertsData.forEach(alert => {
      const li = document.createElement('li');
      li.className = 'list-group-item d-flex justify-content-between align-items-center';
      li.innerHTML = `
        ${alert.id} <span class="badge bg-${alert.type} text-dark">${alert.label}</span>
        <button class="btn btn-sm btn-outline-${alert.type === 'warning' ? 'danger' : 'primary'} ms-2" 
                aria-label="${alert.type === 'warning' ? 'Clôturer' : 'Relancer'} l'appel d'offres ${alert.id}"
                onclick="${alert.type === 'warning' ? `closeAO('${alert.id}')` : `remindAO('${alert.id}')`}">
          ${alert.type === 'warning' ? 'Clôturer' : 'Relancer'}
        </button>
      `;
      ul.appendChild(li);
    });
  }

  // Clôturer un appel d'offres
  function closeAO(id) {
    if (confirm(`Confirmez-vous la clôture de l'appel d'offres ${id} ?`)) {
      alertsData = alertsData.filter(a => a.id !== id);
      refreshAlerts();
      alert(`Appel d'offres ${id} clôturé.`);
    }
  }

  // Relancer un appel d'offres
  function remindAO(id) {
    alert(`Relance envoyée pour l'appel d'offres ${id}.`);
    // Ici tu peux ajouter la logique d'envoi réel
  }

  // Rafraîchir la liste des documents
  function refreshDocuments() {
    const ul = document.getElementById('documentsList');
    ul.innerHTML = '';
    documentsData.forEach(doc => {
      const li = document.createElement('li');
      li.className = 'list-group-item d-flex justify-content-between align-items-center';
      li.innerHTML = `
        ${doc.name}
        <div>
          <a href="${doc.url}" class="btn btn-sm btn-outline-primary" title="Télécharger ${doc.name}" aria-label="Télécharger ${doc.name}">
            <i class="fas fa-download"></i>
          </a>
          <button class="btn btn-sm btn-outline-danger ms-1" title="Supprimer ${doc.name}" aria-label="Supprimer ${doc.name}" onclick="deleteDocument(${doc.id})">
            <i class="fas fa-trash-alt"></i>
          </button>
        </div>
      `;
      ul.appendChild(li);
    });
  }

  // Supprimer un document
  function deleteDocument(id) {
    if (confirm("Confirmez-vous la suppression de ce document ?")) {
      documentsData = documentsData.filter(doc => doc.id !== id);
      refreshDocuments();
      alert("Document supprimé.");
    }
  }

  // Upload document
  function uploadDocument(event) {
    event.preventDefault();
    const input = event.target.querySelector('input[type="file"]');
    if (input.files.length === 0) {
      alert("Veuillez sélectionner un fichier.");
      return;
    }
    const file = input.files[0];
    // Simuler ajout
    documentsData.push({
      id: documentsData.length + 1,
      name: file.name,
      url: '#' // Remplacer par URL réelle après upload
    });
    alert(`Document "${file.name}" ajouté.`);
    refreshDocuments();
    input.value = '';
  }

  // Exporter les offres au format CSV
  function exportOffersCSV() {
    let csvContent = "data:text/csv;charset=utf-8,";
    csvContent += "Fournisseur,Prix (40%),Délai (20%),Qualité (30%),Garantie (10%),Score total,Rang,Remarque\n";

    const offersWithScore = offersData.map(o => {
      const score = o.prix * 0.4 + o.delai * 0.2 + o.qualite * 0.3 + o.garantie * 0.1;
      return {...o, score};
    }).sort((a,b) => b.score - a.score);

    offersWithScore.forEach((o, i) => {
      const row = [
        o.fournisseur,
        o.prix,
        o.delai,
        o.qualite,
        o.garantie,
        o.score.toFixed(1),
        i + 1,
        o.remarque
      ].join(",");
      csvContent += row + "\n";
    });

    const encodedUri = encodeURI(csvContent);
    const link = document.createElement("a");
    link.setAttribute("href", encodedUri);
    link.setAttribute("download", "offres_comparatives.csv");
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }

  // Afficher le tableau des offres
  function refreshOffersTable() {
    const tbody = document.getElementById('offersTableBody');
    tbody.innerHTML = '';

    const offersWithScore = offersData.map(o => {
      const score = o.prix * 0.4 + o.delai * 0.2 + o.qualite * 0.3 + o.garantie * 0.1;
      return {...o, score};
    }).sort((a,b) => b.score - a.score);

    offersWithScore.forEach((o, i) => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${o.fournisseur}</td>
        <td>${o.prix}</td>
        <td>${o.delai}</td>
        <td>${o.qualite}</td>
        <td>${o.garantie}</td>
        <td><strong>${o.score.toFixed(1)}</strong></td>
        <td><span class="badge bg-${i === 0 ? 'success' : 'secondary'}">${i + 1}</span></td>
        <td>${o.remarque}</td>
      `;
      tbody.appendChild(tr);
    });
  }

  // Initialiser le graphique radar ECharts
  function initRadarChart() {
    const radarDom = document.getElementById('offersRadar');
    const radarChart = echarts.init(radarDom);

    const option = {
      // title: { text: 'Comparaison des Offres', left: 'center' },
      tooltip: {},
      legend: {
        data: offersData.map(o => o.fournisseur),
        bottom: 0
      },
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
        data: offersData.map(o => ({
          value: [o.prix, o.delai, o.qualite, o.garantie],
          name: o.fournisseur,
          areaStyle: { opacity: 0.2 }
        }))
      }]
    };

    radarChart.setOption(option);
    window.addEventListener('resize', () => radarChart.resize());
  }

  // Initialisation complète au chargement
  document.addEventListener('DOMContentLoaded', () => {
    refreshAlerts();
    refreshDocuments();
    refreshOffersTable();
    initRadarChart();
  });
