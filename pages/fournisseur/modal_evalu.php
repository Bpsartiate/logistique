<div class="modal modal-dialog-scrollable fade  " id="panelEvaluationFournisseur" tabindex="-1" aria-labelledby="panelEvaluationFournisseur" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="panelEvaluationModalLabel">Panel d’évaluation des fournisseurs</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                            <form id="formPanelEvaluation" novalidate>

                        <table class="table table-bordered table-hover align-middle">
                            <thead>
                                <tr>
                                    <th rowspan="2">Fournisseur</th>
                                    <th colspan="3" class="text-center">Qualité</th>
                                    <th colspan="3" class="text-center">Délai</th>
                                    <th colspan="3" class="text-center">Conformité</th>
                                    <th colspan="3" class="text-center">Service</th>
                                    <th colspan="3" class="text-center">Communication</th>
                                    <th colspan="5" class="text-center">Totaux par critère</th>
                                </tr>
                                <tr>
                                    <th class="text-center">M1</th>
                                    <th class="text-center">M2</th>
                                    <th class="text-center">M3</th>
                                    <th class="text-center">M1</th>
                                    <th class="text-center">M2</th>
                                    <th class="text-center">M3</th>
                                    <th class="text-center">M1</th>
                                    <th class="text-center">M2</th>
                                    <th class="text-center">M3</th>
                                    <th class="text-center">M1</th>
                                    <th class="text-center">M2</th>
                                    <th class="text-center">M3</th>
                                    <th class="text-center">M1</th>
                                    <th class="text-center">M2</th>
                                    <th class="text-center">M3</th>
                                    <th class="text-center">Qualité</th>
                                    <th class="text-center">Délai</th>
                                    <th class="text-center">Conformité</th>
                                    <th class="text-center">Service</th>
                                    <th class="text-center">Communication</th>
                                </tr>
                            </thead>
                            <tbody id="evaluationTableBody">
                                <!-- Généré dynamiquement -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Enregistrer les évaluations</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
    // Exemple de données
const membresPanel = [
  { id: 1, nom: 'Alice' },
  { id: 2, nom: 'Bob' },
  { id: 3, nom: 'Charlie' }
];

const fournisseursSoumissionnaires = [
  { id: 101, nom: 'Fournisseur A' },
  { id: 102, nom: 'Fournisseur B' },
  { id: 103, nom: 'Fournisseur C' }
];

// Fonction pour générer le tableau d’évaluation
function genererTableauEvaluation() {
  const tbody = document.getElementById('evaluationTableBody');
  tbody.innerHTML = '';

  const criteres = ['Qualité', 'Délai', 'Conformité', 'Service', 'Communication'];
  fournisseursSoumissionnaires.forEach(fournisseur => {
    const tr = document.createElement('tr');
    tr.dataset.fournisseurId = fournisseur.id;

    // Nom fournisseur
    const tdNom = document.createElement('td');
    tdNom.textContent = fournisseur.nom;
    tr.appendChild(tdNom);

    // Pour chaque critère, pour chaque membre, ajouter une cellule
    criteres.forEach(critere => {
      membresPanel.forEach(membre => {
        const tdCritere = document.createElement('td');
        tdCritere.classList.add('text-center');
        const input = document.createElement('input');
        input.type = 'number';
        input.min = 0;
        input.max = 100;
        input.value = 0;
        input.classList.add('form-control', 'form-control-sm', 'text-center');
        input.dataset.membreId = membre.id;
        input.dataset.fournisseurId = fournisseur.id;
        input.dataset.critere = critere;
        input.placeholder = critere;
        input.addEventListener('input', () => {
          if (input.value < 0) input.value = 0;
          if (input.value > 100) input.value = 100;
          calculerTotalFournisseur(fournisseur.id);
        });
        tdCritere.appendChild(input);
        tr.appendChild(tdCritere);
      });
    });

    // Colonnes totaux par critère
    criteres.forEach(critere => {
      const tdTotalCritere = document.createElement('td');
      tdTotalCritere.classList.add('text-center', 'fw-bold');
      tdTotalCritere.id = `totalFournisseur_${fournisseur.id}_${critere}`;
      tdTotalCritere.textContent = '0';
      tr.appendChild(tdTotalCritere);
    });

    tbody.appendChild(tr);
  });
}

// Calcul du total des notes pour un fournisseur
function calculerTotalFournisseur(fournisseurId) {
  const criteres = ['Qualité', 'Délai', 'Conformité', 'Service', 'Communication'];
  let totalGlobal = 0;
  criteres.forEach(critere => {
    const inputs = document.querySelectorAll(`input[data-fournisseur-id="${fournisseurId}"][data-critere="${critere}"]`);
    let totalCritere = 0;
    inputs.forEach(input => {
      const val = parseInt(input.value, 10);
      if (!isNaN(val)) totalCritere += val;
    });
    document.getElementById(`totalFournisseur_${fournisseurId}_${critere}`).textContent = totalCritere;
    totalGlobal += totalCritere;
  });
}

// Gestion du submit du formulaire
document.getElementById('formPanelEvaluation').addEventListener('submit', e => {
  e.preventDefault();

  // Validation : toutes les notes doivent être entre 0 et 100
  const inputs = document.querySelectorAll('#formPanelEvaluation input[type="number"]');
  for (const input of inputs) {
    const val = parseInt(input.value, 10);
    if (isNaN(val) || val < 0 || val > 100) {
      alert('Veuillez saisir des notes valides entre 0 et 100.');
      input.focus();
      return;
    }
  }

  // Récupérer les évaluations
  const evaluations = [];
  fournisseursSoumissionnaires.forEach(fournisseur => {
    const evalFournisseur = { fournisseurId: fournisseur.id, membres: {}, total: 0 };
    membresPanel.forEach(membre => {
      evalFournisseur.membres[membre.id] = {};
      let totalMembre = 0;
      ['Qualité', 'Délai', 'Conformité', 'Service', 'Communication'].forEach(critere => {
        const input = document.querySelector(`input[data-fournisseur-id="${fournisseur.id}"][data-membre-id="${membre.id}"][data-critere="${critere}"]`);
        const note = parseInt(input.value, 10);
        evalFournisseur.membres[membre.id][critere] = note;
        if (!isNaN(note)) totalMembre += note;
      });
      evalFournisseur.total += totalMembre;
    });
    evaluations.push(evalFournisseur);
  });

  console.log('Évaluations enregistrées:', evaluations);

  alert('Évaluations enregistrées avec succès !');

  // Ici tu peux envoyer les données au backend via AJAX ou autre
  // Fermer modal si besoin
  const modalEl = document.getElementById('panelEvaluationModal');
  const modal = bootstrap.Modal.getInstance(modalEl);
  modal.hide();
});

// Initialisation
document.addEventListener('DOMContentLoaded', () => {
  genererTableauEvaluation();
});

</script>
