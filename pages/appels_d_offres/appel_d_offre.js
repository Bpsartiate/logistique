// Données
  let alertsData = [
    { id: 'AO-001', label: 'Clôture dans 2 jours', type: 'warning' },
    { id: 'AO-002', label: 'Aucune réponse reçue', type: 'danger' }
  ];
  let documentsData = [
    { id: 1, name: 'Cahier des charges', url: '#' },
    { id: 2, name: 'Réponse Alpha', url: '#' }
  ];
  let appelsOffres = [
    { ref: 'AO-001', type: 'Ouvert', statut: 'En cours', echeance: '2025-05-20', fournisseurs: 'Alpha, Beta' },
    { ref: 'AO-002', type: 'Restreint', statut: 'Clôturé', echeance: '2025-04-15', fournisseurs: 'Gamma' }
  ];
  let offersData = [
    { fournisseur: 'Alpha', prix: 85, delai: 90, qualite: 95, garantie: 80, remarque: 'Meilleure offre' },
    { fournisseur: 'Beta', prix: 80, delai: 85, qualite: 90, garantie: 85, remarque: 'Bon rapport qualité/prix' }
  ];

  // Alertes
  function refreshAlerts() {
    const ul = document.getElementById('alertsList');
    ul.innerHTML = '';
    alertsData.forEach(a => {
      const li = document.createElement('li');
      li.className = 'list-group-item d-flex justify-content-between align-items-center';
      li.innerHTML = `
        ${a.id} <span class="badge bg-${a.type} text-dark">${a.label}</span>
        <button class="btn btn-sm btn-outline-${a.type === 'warning' ? 'danger' : 'primary'} ms-2" onclick="${a.type === 'warning' ? `closeAO('${a.id}')` : `remindAO('${a.id}')`}">
          ${a.type === 'warning' ? 'Clôturer' : 'Relancer'}
        </button>
      `;
      ul.appendChild(li);
    });
  }
  function closeAO(id) {
    alertsData = alertsData.filter(a => a.id !== id);
    refreshAlerts();
    alert(`Appel d'offres ${id} clôturé.`);
  }
  function remindAO(id) {
    alert(`Relance envoyée pour l'appel d'offres ${id}.`);
  }

  // Documents
  function refreshDocuments() {
    const ul = document.getElementById('documentsList');
    ul.innerHTML = '';
    documentsData.forEach(d => {
      const li = document.createElement('li');
      li.className = 'list-group-item d-flex justify-content-between align-items-center';
      li.innerHTML = `
        ${d.name}
        <div>
          <a href="${d.url}" class="btn btn-sm btn-outline-primary" title="Télécharger ${d.name}">
            <i class="fas fa-download"></i>
          </a>
          <button class="btn btn-sm btn-outline-danger ms-1" onclick="deleteDocument(${d.id})">
            <i class="fas fa-trash-alt"></i>
          </button>
        </div>
      `;
      ul.appendChild(li);
    });
  }
  function deleteDocument(id) {
    documentsData = documentsData.filter(d => d.id !== id);
    refreshDocuments();
  }
  function uploadDocument(event) {
    event.preventDefault();
    const input = event.target.querySelector('input[type="file"]');
    if (!input.files.length) return alert('Sélectionnez un fichier');
    const file = input.files[0];
    documentsData.push({ id: documentsData.length + 1, name: file.name, url: '#' });
    refreshDocuments();
    input.value = '';
  }

  // List.js appels d'offres
  const aoList = new List('aoTable', {
    valueNames: ['ref', 'type', 'statut', 'echeance', 'fournisseurs', 'actions'],
    page: 5,
    pagination: true,
    item: `<tr>
      <td class="ref"></td>
      <td class="type"></td>
      <td class="statut"></td>
      <td class="echeance"></td>
      <td class="fournisseurs"></td>
      <td class="actions"></td>
    </tr>`
  }, appelsOffres);

  function addAOActions() {
    document.querySelectorAll('#aoTable tbody.list tr').forEach((tr, i) => {
      const td = tr.querySelector('td.actions');
      if (!td) return;
      td.innerHTML = `
        <button class="btn btn-sm btn-success me-1" onclick="alert('Réception confirmée pour ${appelsOffres[i].ref}')">
          <i class="fas fa-check"></i>
        </button>
        <button class="btn btn-sm btn-danger" onclick="alert('Problème signalé pour ${appelsOffres[i].ref}')">
          <i class="fas fa-exclamation-triangle"></i>
        </button>
      `;
    });
  }
  aoList.on('updated', addAOActions);
  addAOActions();

  // List.js offres
  const offersList = new List('offersTable', {
    valueNames: ['fournisseur', 'prix', 'delai', 'qualite', 'garantie', 'score', 'rang', 'remarque', 'actions'],
    page: 5,
    pagination: true,
    item: `<tr>
      <td class="fournisseur"></td>
      <td class="prix"></td>
      <td class="delai"></td>
      <td class="qualite"></td>
      <td class="garantie"></td>
      <td class="score"></td>
      <td class="rang"></td>
      <td class="remarque"></td>
      <td class="actions"></td>
    </tr>`
  });

  function refreshOffers() {
    offersList.clear();
    const scored = offersData.map(o => {
      const score = o.prix * 0.4 + o.delai * 0.2 + o.qualite * 0.3 + o.garantie * 0.1;
      return {...o, score};
    }).sort((a,b) => b.score - a.score);

    scored.forEach((o, i) => {
      offersList.add({
        fournisseur: o.fournisseur,
        prix: o.prix,
        delai: o.delai,
        qualite: o.qualite,
        garantie: o.garantie,
        score: o.score.toFixed(1),
        rang: i + 1,
        remarque: o.remarque,
        actions: ''
      });
    });
    addOfferActions();
  }

  function addOfferActions() {
    document.querySelectorAll('#offersTable tbody.list tr').forEach((tr, i) => {
      const td = tr.querySelector('td.actions');
      if (!td) return;
      td.innerHTML = `
        <button class="btn btn-sm btn-primary me-1" onclick="alert('Détail ${offersData[i].fournisseur}')">
          <i class="fas fa-info-circle"></i>
        </button>
        <button class="btn btn-sm btn-success" onclick="alert('Sélectionné ${offersData[i].fournisseur}')">
          <i class="fas fa-check"></i>
        </button>
      `;
    });
  }

  // Export CSV
  function exportOffersCSV() {
    let csv = "Fournisseur,Prix,Délai,Qualité,Garantie,Score,Rang,Remarque\n";
    offersData.forEach(o => {
      const score = o.prix*0.4 + o.delai*0.2 + o.qualite*0.3 + o.garantie*0.1;
      csv += `${o.fournisseur},${o.prix},${o.delai},${o.qualite},${o.garantie},${score.toFixed(1)},,${o.remarque}\n`;
    });
    const link = document.createElement('a');
    link.href = 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv);
    link.download = 'offres.csv';
    link.click();
  }

  // Graphique ECharts
  function initBarChart() {
    const chartDom = document.getElementById('offersRadar');
    const myChart = echarts.init(chartDom);

    const fournisseurs = offersData.map(o => o.fournisseur);
    const prix = offersData.map(o => o.prix);
    const delai = offersData.map(o => o.delai);
    const qualite = offersData.map(o => o.qualite);
    const garantie = offersData.map(o => o.garantie);

    const option = {
      title: { text: 'Analyse des critères', left: 'center' },
      tooltip: { trigger: 'axis', axisPointer: { type: 'shadow' } },
      legend: { data: ['Prix', 'Délai', 'Qualité', 'Garantie'], bottom: 0 },
      grid: { left: '3%', right: '4%', bottom: '15%', containLabel: true },
      xAxis: { type: 'category', data: fournisseurs, axisLabel: { rotate: 30 } },
      yAxis: { type: 'value', max: 100 },
      series: [
        { name: 'Prix', type: 'bar', data: prix, itemStyle: { color: '#5470C6' } },
        { name: 'Délai', type: 'bar', data: delai, itemStyle: { color: '#91CC75' } },
        { name: 'Qualité', type: 'bar', data: qualite, itemStyle: { color: '#FAC858' } },
        { name: 'Garantie', type: 'bar', data: garantie, itemStyle: { color: '#EE6666' } }
      ]
    };

    myChart.setOption(option);
    window.addEventListener('resize', () => myChart.resize());
  }

  // Initialisation au chargement
  document.addEventListener('DOMContentLoaded', () => {
    refreshAlerts();
    refreshDocuments();
    refreshOffers();
    initBarChart();
  });