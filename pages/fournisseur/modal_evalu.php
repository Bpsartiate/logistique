<div class="modal modal-dialog-scrollable fade  " id="panelEvaluationFournisseur" tabindex="-1" aria-labelledby="panelEvaluationFournisseur" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content">
      <form id="formPanelEvaluation" novalidate>
        <div class="modal-header">
          <h5 class="modal-title" id="panelEvaluationModalLabel">Panel d’évaluation des fournisseurs</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>Fournisseur</th>
                                    <!-- Colonnes membres du panel -->
                                    <th class="text-center" style="min-width:100px;">Membre 1</th>
                                    <th class="text-center" style="min-width:100px;">Membre 2</th>
                                    <th class="text-center" style="min-width:100px;">Membre 3</th>
                                    <th class="text-center" style="min-width:100px;">Total</th>
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

  fournisseursSoumissionnaires.forEach(fournisseur => {
    const tr = document.createElement('tr');
    tr.dataset.fournisseurId = fournisseur.id;

    // Nom fournisseur
    const tdNom = document.createElement('td');
    tdNom.textContent = fournisseur.nom;
    tr.appendChild(tdNom);

    // Colonnes notes membres
    membresPanel.forEach(membre => {
      const tdNote = document.createElement('td');
      tdNote.classList.add('text-center');

      const input = document.createElement('input');
      input.type = 'number';
      input.min = 0;
      input.max = 100;
      input.value = 0;
      input.classList.add('form-control', 'form-control-sm', 'text-center');
      input.dataset.membreId = membre.id;
      input.dataset.fournisseurId = fournisseur.id;

      // Mise à jour du total à chaque changement
      input.addEventListener('input', () => {
        if (input.value < 0) input.value = 0;
        if (input.value > 100) input.value = 100;
        calculerTotalFournisseur(fournisseur.id);
      });

      tdNote.appendChild(input);
      tr.appendChild(tdNote);
    });

    // Colonne total
    const tdTotal = document.createElement('td');
    tdTotal.classList.add('text-center', 'fw-bold');
    tdTotal.id = `totalFournisseur_${fournisseur.id}`;
    tdTotal.textContent = '0';
    tr.appendChild(tdTotal);

    tbody.appendChild(tr);
  });
}

// Calcul du total des notes pour un fournisseur
function calculerTotalFournisseur(fournisseurId) {
  const inputs = document.querySelectorAll(`input[data-fournisseur-id="${fournisseurId}"]`);
  let total = 0;
  inputs.forEach(input => {
    const val = parseInt(input.value, 10);
    if (!isNaN(val)) total += val;
  });
  document.getElementById(`totalFournisseur_${fournisseurId}`).textContent = total;
}

// Gestion du submit du formulaire
document.getElementById('formPanelEvaluation').addEventListener('submit', e => {
  e.preventDefault();

  // Validation simple : toutes les notes doivent être entre 0 et 100
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
    const evalFournisseur = { fournisseurId: fournisseur.id, notes: {}, total: 0 };
    membresPanel.forEach(membre => {
      const input = document.querySelector(`input[data-fournisseur-id="${fournisseur.id}"][data-membre-id="${membre.id}"]`);
      const note = parseInt(input.value, 10);
      evalFournisseur.notes[membre.id] = note;
      evalFournisseur.total += note;
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
