// projetManager.js
$(function () {
  const container = $('#kanbanProjetsContainer');
  const btnAdd = $('#btnAjouterProjet');
  const projectsCountSpan = $('#projectsCount');

  const formAjoutProjetHtml = `
    <div class="kanban-item kanban-item-new">
      <div class="card kanban-item-card hover-actions-trigger">
        <div class="card-body">
          <form id="formAjouterProjet" class="mt-3">
            <div class="mb-2">
              <label>Nom du projet</label>
              <input class="form-control form-control-sm" type="text" name="nom" required placeholder="Nom du projet">
            </div>
            <div class="mb-2">
              <label>Bailleur</label>
              <input class="form-control form-control-sm" type="text" name="bailleur" required placeholder="Bailleur">
            </div>
            <div class="mb-2">
              <label>Date début</label>
              <input class="form-control form-control-sm" type="date" name="date_debut" required>
            </div>
            <div class="mb-2">
              <label>Date fin</label>
              <input class="form-control form-control-sm" type="date" name="date_fin" required>
            </div>
            <div class="mb-3">
              <label>Budget (U$)</label>
              <input class="form-control form-control-sm" type="number" name="budget" min="0" step="0.01" required placeholder="Budget (U$)">
            </div>
            <button class="btn btn-primary btn-sm" type="submit">Ajouter</button>
            <button type="button" class="btn btn-secondary btn-sm btn-annuler">Annuler</button>
          </form>
        </div>
      </div>
    </div>
  `;

  function createKanbanProjectItem(projet) {
    return $(`
      <div class="kanban-item"
        data-id="${projet.id}"
        data-nom="${projet.nom ? String(projet.nom).replace(/"/g, '&quot;') : ''}"
        data-bailleur="${projet.bailleur ? String(projet.bailleur).replace(/"/g, '&quot;') : ''}"
        data-date_debut="${projet.date_debut ? String(projet.date_debut) : ''}"
        data-date_fin="${projet.date_fin ? String(projet.date_fin) : ''}"
        data-budget="${projet.budget !== undefined ? projet.budget : ''}"
        data-description="${projet.description ? String(projet.description).replace(/"/g, '&quot;') : ''}"
      >
        <div class="card kanban-item-card hover-actions-trigger">
          <div class="card-body">
            <div class="position-relative">
              <div class="dropdown font-sans-serif">
                <button class="btn btn-sm btn-falcon-default kanban-item-dropdown-btn hover-actions" type="button"
                        data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span class="fas fa-ellipsis-h" data-fa-transform="shrink-2"></span>
                </button>
                <div class="dropdown-menu dropdown-menu-end py-0">
                  <a class="dropdown-item btn-edit-project" href="#">Modifier</a>
                  <a class="dropdown-item btn-copy" href="#">Copier le lien</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item text-danger btn-remove" href="#">Supprimer</a>
                </div>
              </div>
            </div>
            <div class="mb-2">
              <span class="badge py-1 me-1 mb-1 badge-soft-primary"><i class="fas fa-project-diagram"></i> ${projet.nom}</span>
            </div>
            <p class="mb-1 fw-medium stretched-link"></p>
            <div class="text-500 mb-2">
              <i class="fas fa-hand-holding-usd me-1"></i> Bailleur : <strong>${projet.bailleur}</strong><br>
              <i class="fas fa-calendar-alt me-1"></i> Du <strong>${projet.date_debut}</strong> au <strong>${projet.date_fin}</strong><br>
              <i class="fas fa-dollar-sign me-1"></i> Budget : <strong>$${parseFloat(projet.budget).toFixed(2)}</strong>
            </div>
          </div>
        </div>
      </div>
    `);
  }

  function updateProjectCount(count) {
    projectsCountSpan.text(`(${count})`);
  }

  function loadProjets() {
    container.empty();
    $.ajax({
      url: 'http://localhost:3000/api/projets',
      method: 'GET',
      success: function(data) {
        data.forEach(projet => container.append(createKanbanProjectItem(projet)));
        updateProjectCount(data.length);
      },
      error: function() {
        showFormAlert('Erreur lors du chargement des projets');
        updateProjectCount(0);
      }
    });
  }

  btnAdd.click(function () {
    if (container.find('.kanban-item-new').length === 0) {
      container.prepend(formAjoutProjetHtml);
      container.find('.kanban-item-new input[name="nom"]').focus();
    }
  });

  container.on('click', '.btn-annuler', function () {
    $(this).closest('.kanban-item-new').remove();
  });

  container.on('submit', '#formAjouterProjet', function (e) {
    e.preventDefault();
    const form = $(this);
    const projet = {
      nom: form.find('[name="nom"]').val().trim(),
      bailleur: form.find('[name="bailleur"]').val().trim(),
      date_debut: form.find('[name="date_debut"]').val(),
      date_fin: form.find('[name="date_fin"]').val(),
      budget: parseFloat(form.find('[name="budget"]').val())
    };
    const description = form.find('[name="description"]').val();
    if (description) projet.description = description;

    // Validation simple
    if (!projet.nom || !projet.bailleur || !projet.date_debut || !projet.date_fin || isNaN(projet.budget) || projet.budget < 0) {
      alert('Veuillez remplir correctement tous les champs obligatoires.');
      return;
    }

    $.ajax({
      url: 'http://localhost:3000/api/projets',
      method: 'POST',
      contentType: 'application/json',
      data: JSON.stringify(projet),
      success: function (createdProjet) {
        form.closest('.kanban-item-new').replaceWith(createKanbanProjectItem(createdProjet));
        updateProjectCount(container.children('.kanban-item').length);
      },
      error: function (xhr) {
        alert(xhr.responseJSON?.error || 'Erreur lors de la création du projet');
      }
    });
  });

  container.on('click', '.btn-edit-project', function (e) {
    e.preventDefault();
    const kanbanItem = $(this).closest('.kanban-item');

    const projetId = kanbanItem.data('id');
    const nom = kanbanItem.data('nom') || '';
    const bailleur = kanbanItem.data('bailleur') || '';
    const dateDebut = kanbanItem.data('date_debut') || '';
    const dateFin = kanbanItem.data('date_fin') || '';
    const budget = kanbanItem.data('budget') || 0;

    const formEditHtml = $(`
      <form class="form-edit-projet mt-3">
        <div class="mb-2">
          <label>Nom du projet</label>
          <input type="text" name="nom" class="form-control form-control-sm" value="${nom}" required>
        </div>
        <div class="mb-2">
          <label>Bailleur</label>
          <input type="text" name="bailleur" class="form-control form-control-sm" value="${bailleur}" required>
        </div>
        <div class="mb-2">
          <label>Date début</label>
          <input type="date" name="date_debut" class="form-control form-control-sm" value="${dateDebut}" required>
        </div>
        <div class="mb-2">
          <label>Date fin</label>
          <input type="date" name="date_fin" class="form-control form-control-sm" value="${dateFin}" required>
        </div>
        <div class="mb-3">
          <label>Budget (U$)</label>
          <input type="number" name="budget" class="form-control form-control-sm" min="0" step="0.01" value="${budget}" required>
        </div>
        <button type="submit" class="btn btn-primary btn-sm">Sauvegarder</button>
        <button type="button" class="btn btn-secondary btn-sm btn-annuler-edit">Annuler</button>
      </form>
    `);

    kanbanItem.find('.card-body').html(formEditHtml);
  });

  container.on('submit', '.form-edit-projet', function (e) {
    e.preventDefault();
    const form = $(this);
    const kanbanItem = form.closest('.kanban-item');
    const projetId = kanbanItem.data('id');
    const projet = {
      nom: form.find('[name="nom"]').val(),
      bailleur: form.find('[name="bailleur"]').val(),
      date_debut: form.find('[name="date_debut"]').val(),
      date_fin: form.find('[name="date_fin"]').val(),
      budget: parseFloat(form.find('[name="budget"]').val())
    };
    $.ajax({
      url: `http://localhost:3000/api/projets/${projetId}`,
      method: 'PUT',
      contentType: 'application/json',
      data: JSON.stringify(projet),
      success: function (updatedProjet) {
        kanbanItem.find('.card-body').html(createKanbanProjectItem(updatedProjet).find('.card-body').html());
        showFormAlert('Projet modifié avec succès.', 'success');
      },
      error: function () {
        showFormAlert('Erreur lors de la mise à jour du projet', 'danger');
      }
    });
  });

  container.on('click', '.btn-annuler-edit', function () {
    loadProjets();
  });

  container.on('click', '.btn-remove', function (e) {
    e.preventDefault();
    const kanbanItem = $(this).closest('.kanban-item');
    const projetId = kanbanItem.data('id');
    if ($('#confirmDeleteProjetModal').length === 0) {
      $('body').append(`
        <div class="modal fade" id="confirmDeleteProjetModal" tabindex="-1" aria-labelledby="confirmDeleteProjetLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="confirmDeleteProjetLabel"><i class="bi bi-trash me-2"></i>Confirmer la suppression du projet</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
              </div>
              <div class="modal-body">Voulez-vous vraiment supprimer ce projet ? Cette action est irréversible.</div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-danger" id="btnConfirmDeleteProjet">Supprimer</button>
              </div>
            </div>
          </div>
        </div>
      `);
    }
    $('#confirmDeleteProjetModal').modal('show');
    $('#btnConfirmDeleteProjet').off('click').on('click', function () {
      $.ajax({
        url: `http://localhost:3000/api/projets/${projetId}`,
        method: 'DELETE',
        success: function () {
          kanbanItem.remove();
          updateProjectCount(container.children('.kanban-item').length);
          $('#confirmDeleteProjetModal').modal('hide');
          showFormAlert('Projet supprimé.', 'success');
        },
        error: function () {
          showFormAlert('Erreur lors de la suppression du projet', 'danger');
        }
      });
    });
  });

  loadProjets();
});
