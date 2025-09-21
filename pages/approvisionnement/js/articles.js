// planAchatManager.js
$(function () {
  window.currentProjetId = null;
  window.currentProjetData = null;
  let lastArticlesList = [];

  function getEtatProjet(dateDebut, dateFin) {
    const now = new Date();
    const debut = new Date(dateDebut);
    const fin = new Date(dateFin);

    if (now < debut)
      return { text: 'À venir', class: 'bg-secondary', icon: 'bi-hourglass-split' };
    if (now >= debut && now <= fin) {
      const diffDays = Math.ceil((fin - now) / (1000 * 60 * 60 * 24));
      if (diffDays <= 15) return { text: 'Se termine bientôt', class: 'bg-warning text-dark', icon: 'bi-exclamation-triangle-fill' };
      return { text: 'En cours', class: 'bg-success', icon: 'bi-check-circle-fill' };
    }
    if (now > fin) return { text: 'Terminé', class: 'bg-danger', icon: 'bi-x-circle-fill' };
    return { text: 'Statut inconnu', class: 'bg-secondary', icon: 'bi-question-circle' };
  }

  function getUrgenceArticle(dateLimiteAchat) {
    if (!dateLimiteAchat) return { text: 'Date inconnue', class: 'bg-secondary' };
    const now = new Date();
    const limite = new Date(dateLimiteAchat);
    const diffTime = limite - now;
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    if (diffDays > 30) return { text: 'Non urgent', class: 'bg-success' };
    if (diffDays > 15) return { text: 'Moyennement urgent', class: 'bg-warning text-dark' };
    if (diffDays >= 0) return { text: 'Très urgent', class: 'bg-danger' };
    return { text: 'Date dépassée', class: 'bg-secondary' };
  }

  function renderArticlesList(articles) {
    lastArticlesList = articles || [];
    const $tbody = $('#articlesList .list');
    $tbody.html(''); // Remplace .empty() pour éviter d'effacer la structure du tableau
    if (window.articlesListObj) {
      window.articlesListObj.clear();
      // Ne pas supprimer l'objet, juste le vider
    }

    // Calcul du budget restant
    const budgetProjet = window.currentProjetData?.budget ? parseFloat(window.currentProjetData.budget) : 0;
    const totalUtilise = articles.reduce((sum, art) => sum + (parseFloat(art.montant) || 0), 0);
    const budgetRestant = budgetProjet - totalUtilise;


    // Barre de progression du budget
    $('#budgetRestantBadge').remove();
    // Barre de progression : une seule logique fiable
    let progressPercent = 0;
    let montantUtilise = budgetProjet - budgetRestant;
    let progressClass = 'bg-success';
    let progressText = '';
    let progressTextClasse = '';
    if (budgetProjet === 0) {
      progressClass = 'bg-secondary';
      progressText = 'Aucun budget';
      progressPercent = 0;
      montantUtilise = 0;
    } else if (budgetRestant <= 0) {
      progressClass = 'bg-danger';
      progressText = 'Budget épuisé';
      progressTextClasse = 'text-danger';
      progressPercent = 100;
      montantUtilise = budgetProjet;
    } else {
      progressPercent = Math.max(0, Math.min(100, ((budgetRestant) / budgetProjet) * 100));
      if (progressPercent < 20) {
        progressClass = 'bg-danger';
        progressText = 'Budget presque épuisé';
      } else if (progressPercent < 50) {
        progressClass = 'bg-warning';
        progressText = 'Budget utilisé > 50%';
      } else {
        progressClass = 'bg-success';
        progressText = 'Budget disponible';
      }
      progressTextClasse = '';
    }

    const textColorClass = progressClass === 'bg-danger' ? 'text-white' : 'text-dark';
    const textShadowStyle = 'text-shadow: 1px 1px 2px #000, 0 0 1px #fff;';
    const percentUsed = budgetProjet > 0 ? ((montantUtilise / budgetProjet) * 100).toFixed(0) : 0;
    const progressBarHtml = `
      <div id="budgetRestantBadge" class="mb-2 d-flex align-items-center gap-3">
        <label class="form-label fw-bold mb-0"><i class="bi bi-wallet2 me-2"></i><span class="${progressTextClasse}">${progressText}</span></label>
        <div class="progress flex-grow-1" style="height: 2.5rem; min-width:150px;">
          <div class="progress-bar ${progressClass} ${textColorClass} ${progressClass === 'bg-danger' ? 'progress-bar-striped' : ''}" role="progressbar" style="width: ${progressPercent}%; font-size:1.2rem; background-color: ${progressClass === 'bg-danger' ? '#dc3545' : ''}; text-shadow: 1px 1px 2px #000, 0 0 1px #fff; position: relative;">
            <span style="position:relative;z-index:2;">${percentUsed}% utilisé</span>
          </div>
        </div>
        <span style="background:rgba(0,0,0,0.10);padding:0.2em 0.7em;border-radius:0.3em;min-width:120px;text-align:center;" class="fw-bold">$${montantUtilise.toFixed(2)} utilisé / $${budgetProjet.toFixed(2)}</span>
      </div>
    `;
    $('#articlesList').before(progressBarHtml);

    const items = articles.map(article => {
      let catBadge = '';
      if (article.categorie === 'Biens/Provisions')
        catBadge = '<span class="badge bg-primary"><i class="bi bi-box-seam me-1"></i>Biens</span>';
      else if (article.categorie === 'Services')
        catBadge = '<span class="badge bg-success"><i class="bi bi-gear me-1"></i>Services</span>';
      else if (article.categorie === 'Travaux')
        catBadge = '<span class="badge bg-warning text-dark"><i class="bi bi-tools me-1"></i>Travaux</span>';
      else
        catBadge = `<span class="badge bg-secondary">${article.categorie || ''}</span>`;

      const urgence = getUrgenceArticle(article.date_limite_achat);
      const dateLimiteBadge = `
        <span class="d-inline-flex align-items-center gap-2">
          <span class="badge ${urgence.class}"><i class="bi bi-calendar-event me-1"></i>${urgence.text}</span>
          <span class="text-muted small">avant le</span>
        </span>
      `;

      return {
        id: `<span style='display:none;'>${article.id}</span>${article.id}`,
        article_nom: `<span style='display:none;'>${article.article_nom}</span><i class='bi bi-tag me-1 text-info'></i>${article.article_nom}`,
        categorie: `<span style='display:none;'>${article.categorie}</span>${catBadge}`,
        montant: `<span style='display:none;'>${parseFloat(article.montant).toFixed(2)}</span><span class='badge bg-light text-dark border'><i class='bi bi-currency-dollar me-1'></i>${parseFloat(article.montant).toFixed(2)}</span>`,
        procedure_achat: `<span style='display:none;'>${article.procedure_achat || ''}</span>${article.procedure_achat ? `<span class='badge bg-secondary'><i class='bi bi-diagram-3 me-1'></i>${article.procedure_achat}</span>` : ''}`,
        date_creation: `<span style='display:none;'>${article.date_creation ? new Date(article.date_creation).toLocaleDateString() : ''}</span>${article.date_creation ? new Date(article.date_creation).toLocaleDateString() : ''}`,
        date_limite_achat: `<span style='display:none;'>${article.date_limite_achat || ''}</span>${dateLimiteBadge} <br> ${article.date_limite_achat ? new Date(article.date_limite_achat).toLocaleDateString() : ''}`,
        actions: `
          <button class="btn btn-sm btn-warning btn-edit-article" data-id="${article.id}"><i class="bi bi-pencil"></i> </button>
          <button class="btn btn-sm btn-danger btn-delete-article" data-id="${article.id}"><i class="bi bi-trash"></i> </button>
        `
      };
    });

    window.articlesListObj = new List('articlesList', {
      valueNames: ['id', 'article_nom', 'categorie', 'montant', 'procedure_achat', 'date_limite_achat', 'actions'],
      page: 5,
      pagination: true,
      item: `<tr>
        <td class="id"></td>
        <td class="article_nom"></td>
        <td class="categorie"></td>
        <td class="montant"></td>
        <td class="procedure_achat"></td>
        <td class="date_limite_achat"></td>
        <td class="actions text-center"></td>
      </tr>`
    });

    if (items.length > 0) {
      window.articlesListObj.add(items);
    } else {
      $tbody.append('<tr class="d-none"><td class="id">-</td><td class="article_nom"></td><td class="categorie"></td><td class="montant"></td><td class="procedure_achat"></td><td class="date_creation"></td><td class="date_limite_achat"></td><td class="actions"></td></tr>');
    }
  }

  $(document).off('click.editArticle').on('click.editArticle', '.btn-edit-article', function () {
    const articleId = $(this).data('id');
    const article = lastArticlesList.find(a => a.id == articleId);
    if (!article) return showFormAlert('Article introuvable.', 'danger');
    const $row = $(this).closest('tr');
    $row.find('td').each(function (idx) {
      if (idx === 0) $(this).html(article.id);
      if (idx === 1) $(this).html(`<input type='text' class='form-control form-control-sm' value='${article.article_nom}' id='editArticleNom'>`);
      if (idx === 2) $(this).html(`<select class='form-select form-select-sm' id='editCategorie'>
        <option value='Biens/Provisions' ${article.categorie === 'Biens/Provisions' ? 'selected' : ''}>Biens/Provisions</option>
        <option value='Services' ${article.categorie === 'Services' ? 'selected' : ''}>Services</option>
        <option value='Travaux' ${article.categorie === 'Travaux' ? 'selected' : ''}>Travaux</option>
      </select>`);
      if (idx === 3) $(this).html(`<input type='number' class='form-control form-control-sm' value='${article.montant}' id='editMontant'>`);
      if (idx === 4) $(this).html(article.procedure_achat || '');
      if (idx === 5) $(this).html(`<input type='date' class='form-control form-control-sm' value='${article.date_limite_achat ? article.date_limite_achat.split('T')[0] : ''}' id='editDateLimite'>`);
      if (idx === 6) $(this).html(`
        <button class='btn btn-success btn-sm btn-save-article' data-id='${article.id}'><i class='bi bi-check-lg'></i></button>
        <button class='btn btn-secondary btn-sm btn-cancel-edit' data-id='${article.id}'><i class='bi bi-x-lg'></i></button>
      `);
    });
  });

  $(document).off('click.saveArticle').on('click.saveArticle', '.btn-save-article', function () {
    const articleId = $(this).data('id');
    const $row = $(this).closest('tr');
    const article_nom = $row.find('#editArticleNom').val();
    const categorie = $row.find('#editCategorie').val();
    const montant = parseFloat($row.find('#editMontant').val());
    const date_limite_achat = $row.find('#editDateLimite').val();

    // Calcul du budget disponible hors l'article en cours d'édition
    const budgetProjet = window.currentProjetData?.budget ? parseFloat(window.currentProjetData.budget) : 0;
    let totalAutres = lastArticlesList.reduce((sum, art) => sum + (art.id == articleId ? 0 : (parseFloat(art.montant) || 0)), 0);
    if ((totalAutres + montant) > budgetProjet) {
      showFormAlert("Le nouveau montant dépasse le budget disponible.", 'danger');
      return;
    }

    $.ajax({
      url: `http://localhost:3000/api/plan_achat_article/${articleId}`,
      method: 'PUT',
      contentType: 'application/json',
      data: JSON.stringify({ article_nom, categorie, montant, date_limite_achat }),
      success: function () {
        showFormAlert('Article modifié avec succès.', 'success');
        loadArticlesForProjet(window.currentProjetId);
      },
      error: function (xhr) {
        let msg = 'Erreur lors de la modification.';
        if (xhr.responseJSON && xhr.responseJSON.error) msg = xhr.responseJSON.error;
        showFormAlert(msg, 'danger');
      }
    });
  });

  $(document).off('click.cancelEdit').on('click.cancelEdit', '.btn-cancel-edit', function () {
    loadArticlesForProjet(window.currentProjetId);
  });

  $(document).off('click.deleteArticle').on('click.deleteArticle', '.btn-delete-article', function () {
    const articleId = $(this).data('id');
    if ($('#confirmDeleteModal').length === 0) {
      $('body').append(`
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="confirmDeleteLabel"><i class="bi bi-trash me-2"></i>Confirmer la suppression</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
              </div>
              <div class="modal-body">Voulez-vous vraiment supprimer cet article ? Cette action est irréversible.</div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-danger" id="btnConfirmDeleteArticle">Supprimer</button>
              </div>
            </div>
          </div>
        </div>
      `);
    }
    $('#confirmDeleteModal').modal('show');
    $('#btnConfirmDeleteArticle').off('click').on('click', function () {
      $.ajax({
        url: `http://localhost:3000/api/plan_achat_article/${articleId}`,
        method: 'DELETE',
        success: function () {
          showFormAlert('Article supprimé.', 'success');
          $('#confirmDeleteModal').modal('hide');
          loadArticlesForProjet(window.currentProjetId);
        },
        error: function (xhr) {
          let msg = 'Erreur lors de la suppression.';
          if (xhr.responseJSON && xhr.responseJSON.error) msg = xhr.responseJSON.error;
          showFormAlert(msg, 'danger');
        }
      });
    });
  });

  $(document).on('submit', '#formAjouterPlanAchat', function (e) {
    e.preventDefault();
    clearFormAlert();
    $('#formAjouterPlanAchat input, #formAjouterPlanAchat select').removeClass('is-invalid');

    const article_nom = $('#articleNom').val().trim();
    const montantStr = $('#montantArticle').val().trim();
    const montant = parseFloat(montantStr);
    const categorie = $('#categorieArticle').val();
    const date_limite_achat = $('#dateLimiteAchat').val();
    const projetId = window.currentProjetId;

    let valid = true;
    if (!article_nom) { $('#articleNom').addClass('is-invalid'); valid = false; }
    if (!categorie) { $('#categorieArticle').addClass('is-invalid'); valid = false; }
    if (!montantStr || isNaN(montant) || montant <= 0) { $('#montantArticle').addClass('is-invalid'); valid = false; }
    if (!date_limite_achat) { $('#dateLimiteAchat').addClass('is-invalid'); valid = false; }
    if (!valid) {
      showFormAlert("Veuillez remplir tous les champs obligatoires correctement.", 'danger');
      return false;
    }
    if (!projetId) { showFormAlert("Projet non sélectionné.", 'danger'); return false; }

    let total = 0;
    if (Array.isArray(lastArticlesList)) total = lastArticlesList.reduce((sum, art) => sum + (parseFloat(art.montant) || 0), 0);
    const budgetProjet = window.currentProjetData?.budget ? parseFloat(window.currentProjetData.budget) : null;
    if (budgetProjet !== null && (total + montant) > budgetProjet) {
      showFormAlert("Le total des articles dépasse le budget du projet.", 'danger');
      return false;
    }

    $.ajax({
      url: 'http://localhost:3000/api/plan_achat_article',
      method: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({
        projet_id: projetId,
        article_nom,
        montant,
        categorie,
        date_limite_achat
      }),
      success: function () {
        showFormAlert("Article ajouté avec succès.", 'success');
        $('#formAjouterPlanAchat')[0].reset();
        loadArticlesForProjet(projetId);
      },
      error: function (xhr) {
        let msg = "Erreur lors de l'ajout.";
        if (xhr.responseJSON && xhr.responseJSON.error) msg = xhr.responseJSON.error;
        showFormAlert(msg, 'danger');
      }
    });
  });

  $(document).on('focus', '#dateLimiteAchat', function () {
    if (window.currentProjetData) {
      const minDate = window.currentProjetData.date_debut;
      const maxDate = window.currentProjetData.date_fin;
      if (minDate) $(this).attr('min', minDate);
      if (maxDate) $(this).attr('max', maxDate);
    }
  });

  function loadArticlesForProjet(projetId) {
    $.ajax({
      url: `http://localhost:3000/api/projets/${projetId}/articles`,
      method: 'GET',
      success: function (articles) {
        renderArticlesList(articles);
      },
      error: function () {
        renderArticlesList([]);
        showFormAlert("Erreur lors du chargement des articles.");
      }
    });
  }

  function ouvrirModalProjet(projet) {
    window.currentProjetId = projet.id;
    window.currentProjetData = projet;
    $('#projetNom').text(projet.nom || '');
    $('#projetBailleur').text(projet.bailleur || '');
    $('#projetPeriode').text((projet.date_debut || '') + ' au ' + (projet.date_fin || ''));
    $('#projetBudget').text(projet.budget !== undefined && projet.budget !== null ? parseFloat(projet.budget).toFixed(2) : '0.00');
    $('#projetDescription').text(projet.description || 'Aucune description');
    const etat = getEtatProjet(projet.date_debut, projet.date_fin);
    $('#badgeStatus').attr('class', `badge fs-2 px-3 py-2 ${etat.class}`);
    $('#iconStatus').attr('class', `bi ${etat.icon} me-2`);
    $('#textStatus').text(etat.text);
    $('#formProjetBudget').text(projet.budget !== undefined && projet.budget !== null ? parseFloat(projet.budget).toFixed(2) : '0.00');
    $('#formProjetBailleur').text(projet.bailleur || '');
    loadArticlesForProjet(projet.id);
    new bootstrap.Modal($('#modalProjetAvance')).show();
  }

  $('#kanbanProjetsContainer').on('click', '.kanban-item', function (e) {
    if ($(e.target).closest('.kanban-item-dropdown-btn, .dropdown-menu, form, input, select, textarea, button, .btn, .form-control').length > 0)
      return;

    const $item = $(this);
    ouvrirModalProjet({
      id: $item.data('id'),
      nom: $item.data('nom') || '',
      bailleur: $item.data('bailleur') || '',
      date_debut: $item.data('date_debut') || '',
      date_fin: $item.data('date_fin') || '',
      budget: $item.data('budget') !== undefined && $item.data('budget') !== null ? $item.data('budget') : 0,
      description: $item.data('description') || ''
    });
  });

});
