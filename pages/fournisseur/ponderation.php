<!-- Modal Pondérations -->
<div class="modal fade" id="modalPonderations" tabindex="-1" aria-labelledby="modalPonderationsLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalPonderationsLabel">Pondérations des critères</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="form-ponderations" novalidate>
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6 mb-2">
                <input id="inputQualite" name="qualite" type="number" min="0" max="100" value="0" class="form-control form-control-sm d-inline-block w-auto" placeholder="Qualité" />
                <label for="inputQualite" class="form-label">Qualité</label>
              </div>
              <div class="col-md-6 mb-2">
                <input id="inputCommunication" name="communication" type="number" min="0" max="100" value="0" class="form-control form-control-sm d-inline-block w-auto" placeholder="Communication" />
                <label for="inputCommunication" class="form-label">Communication</label>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-2">
                <input id="inputCout" name="cout" type="number" min="0" max="100" value="0" class="form-control form-control-sm d-inline-block w-auto" placeholder="Coût" />
                <label for="inputCout" class="form-label">Coût</label>
              </div>
              <div class="col-md-6 mb-2">
                <input id="inputService" name="service" type="number" min="0" max="100" value="0" class="form-control form-control-sm d-inline-block w-auto" placeholder="Service" />
                <label for="inputService" class="form-label">Service</label>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-2">
                <input id="inputDelai" name="delai" type="number" min="0" max="100" value="0" class="form-control form-control-sm d-inline-block w-auto" placeholder="Délai" />
                <label for="inputDelai" class="form-label">Délai</label>
              </div>
              <div class="col-md-6 mb-2">
                <input id="inputConformite" name="conformite" type="number" min="0" max="100" value="0" class="form-control form-control-sm d-inline-block w-auto" placeholder="Conformité" />
                <label for="inputConformite" class="form-label">Conformité</label>
              </div>
            </div>
          </div>
          <div class="mb-3">
            <strong>Somme des pondérations :</strong>
            <span id="sommePonderationsBadge" class="badge bg-secondary">0%</span>
            <span id="sommePonderationsMsg" class="ms-2"></span>
          </div>
          <button type="submit" class="btn btn-primary mt-2">Valider</button>
        </form>
        <div id="msg" class="mt-2"></div>

        <hr />

        <div class="mt-4">
          <div class="d-flex align-items-center mb-2">
            <h5 class="mb-0 me-3">Pondérations enregistrées</h5>
            <button type="button" class="btn btn-warning btn-sm btn-modifier d-none">Modifier</button>
            <button type="button" class="btn btn-danger btn-sm btn-supprimer-all ms-2 d-none">Supprimer</button>
          </div>
          <div class="table-responsive">
            <table class="table table-bordered table-striped" id="tablePonderations">
              <thead>
                <tr>
                    <th>Critère</th>
                    <th>Valeur (%)</th>
                </tr>
              </thead>
              <tbody>
                <tr><td colspan="3" class="text-center text-muted">Chargement...</td></tr>
              </tbody>
            </table>
          </div>
          <div class="mt-3">
            <strong>Score global pondéré :</strong>
            <span id="scoreGlobalPondere" class="badge bg-secondary">Calcul en cours...</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
(() => {
  const idEntreprise = 1; // ADAPTE ici l'id réel de l'entreprise courante !
  const criteres = ['qualite','communication','cout','service','delai','conformite'];

  const form = document.getElementById('form-ponderations');
  const badge = document.getElementById('sommePonderationsBadge');
  const sommeMsg = document.getElementById('sommePonderationsMsg');
  const msgGlobal = document.getElementById('msg');
  const tbody = document.querySelector('#tablePonderations tbody');
  const modalEl = document.getElementById('modalPonderations');

  // Met à jour la somme et le badge couleur
  function updateSommePonderations() {
    let somme = 0;
    criteres.forEach(c => {
      somme += parseFloat(form[c].value) || 0;
    });
    badge.textContent = somme.toFixed(1) + '%';
    if (somme > 100) {
      badge.className = 'badge bg-danger';
      sommeMsg.textContent = 'Dépassement !';
      sommeMsg.className = 'text-danger fw-bold';
    } else if (somme === 100) {
      badge.className = 'badge bg-success';
      sommeMsg.textContent = 'Parfait';
      sommeMsg.className = 'text-success fw-bold';
    } else {
      badge.className = 'badge bg-info';
      sommeMsg.textContent = '';
      sommeMsg.className = '';
    }
  }

  // Charge les pondérations existantes en base et remplit le tableau + pré-remplit le formulaire
  async function chargerPonderations() {
    tbody.innerHTML = '<tr><td colspan="3" class="text-center text-muted">Chargement...</td></tr>';
    msgGlobal.textContent = ''; msgGlobal.className = '';
    try {
      // GET /api/ponderations/:id_entreprise
      const res = await fetch(`http://localhost:3000/api/ponderations/${idEntreprise}`);
      if (!res.ok) throw new Error(`Erreur ${res.status}`);
      const pondList = await res.json();
      // Format attendu : [{ critere: 'qualite', poids: 20 }, ...]
      if (!Array.isArray(pondList) || pondList.length === 0) {
        tbody.innerHTML = '<tr><td colspan="3" class="text-center text-muted">Aucune pondération enregistrée</td></tr>';
        criteres.forEach(c => { form[c].value = 0; });
        updateSommePonderations();
        form.style.display = '';
        document.getElementById('scoreGlobalPondere').textContent = 'N/A';
        document.getElementById('scoreGlobalPondere').className = 'badge bg-secondary';
        return;
      }
      // Pré-remplir le formulaire
      pondList.forEach(p => {
        if (criteres.includes(p.critere)) {
          form[p.critere].value = parseFloat(p.poids);
        }
      });
      criteres.forEach(c => { if (!pondList.find(p=>p.critere===c)) form[c].value = 0; });
      updateSommePonderations();
      // Masquer le formulaire si pondérations existent
      form.style.display = 'none';
      // Afficher les boutons Modifier/Supprimer en haut
      document.querySelector('.btn-modifier').classList.remove('d-none');
      document.querySelector('.btn-supprimer-all').classList.remove('d-none');
      // Remplir le tableau
      tbody.innerHTML = `${criteres.map(c => {
        const p = pondList.find(p=>p.critere===c);
        return p ? `<tr><td>${c.charAt(0).toUpperCase() + c.slice(1)}</td><td>${parseFloat(p.poids).toFixed(1)}%</td><td></td></tr>` : '';
      }).join('')}`;
      // Modifier : affiche le formulaire pré-rempli
      document.querySelector('.btn-modifier').onclick = () => {
        form.style.display = '';
        msgGlobal.textContent = '';
        msgGlobal.className = '';
      };
      // Supprimer : supprime toutes les pondérations de l'entreprise
      document.querySelector('.btn-supprimer-all').onclick = async () => {
        if (!confirm('Supprimer toutes les pondérations ?')) return;
        try {
          // Supprimer chaque critere
          await Promise.all(criteres.map(c => fetch(`http://localhost:3000/api/ponderations/${idEntreprise}/${c}`, { method: 'DELETE' })));
          msgGlobal.textContent = 'Toutes les pondérations ont été supprimées.';
          msgGlobal.className = 'text-success fw-bold';
          form.style.display = '';
          document.querySelector('.btn-modifier').classList.add('d-none');
          document.querySelector('.btn-supprimer-all').classList.add('d-none');
          document.getElementById('scoreGlobalPondere').textContent = 'N/A';
          document.getElementById('scoreGlobalPondere').className = 'badge bg-secondary';
          await chargerPonderations();
        } catch (e) {
          msgGlobal.textContent = 'Erreur lors de la suppression.';
          msgGlobal.className = 'text-danger fw-bold';
        }
      };
      // Récupérer le score global pondéré (moyenne réelle des évaluations)
      await chargerScoreGlobalPondere();
    } catch (e) {
      tbody.innerHTML = `<tr><td colspan="3" class="text-center text-danger">Erreur lors du chargement : ${e.message}</td></tr>`;
      form.style.display = '';
      document.getElementById('scoreGlobalPondere').textContent = 'Erreur';
      document.getElementById('scoreGlobalPondere').className = 'badge bg-danger';
    }
  }

  // Fonction pour charger le score global pondéré (moyenne réelle des évaluations)
  async function chargerScoreGlobalPondere() {
    try {
      // GET /api/score-global-pondere/:id_entreprise
      const res = await fetch(`http://localhost:3000/api/score-global-pondere/${idEntreprise}`);
      if (!res.ok) throw new Error('Erreur API');
      const { score } = await res.json();
      const badge = document.getElementById('scoreGlobalPondere');
      if (score === null || typeof score === 'undefined' || isNaN(score)) {
        badge.textContent = 'Aucune évaluation';
        badge.className = 'badge bg-secondary';
      } else {
        badge.textContent = score.toFixed(2) + ' / 100';
        badge.className = 'badge bg-success';
      }
    } catch (e) {
      const badge = document.getElementById('scoreGlobalPondere');
      badge.textContent = 'Erreur';
      badge.className = 'badge bg-danger';
    }
  }

  // Supprime une pondération spécifique
  async function supprimerPonderation(critere) {
    try {
      // DELETE /api/ponderations/:id_entreprise/:critere
      const res = await fetch(`http://localhost:3000/api/ponderations/${idEntreprise}/${critere}`, { method: 'DELETE' });
      if (!res.ok) throw new Error(`Erreur ${res.status}`);
      alert(`Pondération "${critere}" supprimée.`);
      form[critere].value = 0;
      updateSommePonderations();
    } catch (e) {
      alert(`Erreur suppression: ${e.message}`);
    }
  }

  // Event écoute form input pour mise à jour somme dynamique
  criteres.forEach(c => {
    form[c].addEventListener('input', () => {
      updateSommePonderations();
      msgGlobal.textContent = '';
      msgGlobal.className = '';
    });
  });

  // Soumission formulaire
  form.addEventListener('submit', async e => {
    e.preventDefault();
    let somme = 0;
    const data = {};
    criteres.forEach(c => {
      data[c] = parseFloat(form[c].value) || 0;
      somme += data[c];
    });
    updateSommePonderations();
    if (somme > 100) {
      msgGlobal.textContent = 'La somme des pondérations ne doit pas dépasser 100 %';
      msgGlobal.className = 'text-danger fw-bold';
      form.querySelector('input[name="qualite"]').focus();
      return;
    }
    // POST /api/ponderations
    try {
      msgGlobal.textContent = 'Enregistrement en cours...';
      msgGlobal.className = '';
      const res = await fetch('http://localhost:3000/api/ponderations/', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id_entreprise: idEntreprise, ponderations: data })
      });
      if (!res.ok) throw new Error(`Erreur ${res.status}`);
      msgGlobal.textContent = 'Pondérations sauvegardées avec succès !';
      msgGlobal.className = 'text-success fw-bold';
      await chargerPonderations();
    } catch (ex) {
      msgGlobal.textContent = 'Erreur lors de la sauvegarde.';
      msgGlobal.className = 'text-danger fw-bold';
    }
  });

  // Au chargement de la modal, charger les pondérations
  modalEl.addEventListener('show.bs.modal', () => {
    chargerPonderations();
  });

  // Initialisation au chargement du script (au cas où modal est cachée)
  updateSommePonderations();

})();
</script>
