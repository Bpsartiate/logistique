  // Gestion de l’affichage du texte du bouton qui toggle la table procédures
  function updateToggleProceduresBtn() {
    const $container = $('#proceduresTableContainer');
    const $text = $('#toggleProceduresTableText');
    if ($container.is(':visible')) {
      $text.text('Masquer');
    } else {
      $text.text('Afficher');
    }
  }

  // Événement click sur le bouton toggle table procédures
  $('#btnToggleProceduresTable').on('click', function () {
    const $container = $('#proceduresTableContainer');
    if ($container.is(':visible')) {
      $container.slideUp(200, updateToggleProceduresBtn);
    } else {
      $container.slideDown(200, updateToggleProceduresBtn);
    }
  });

  // Initialiser l’état du bouton au chargement
  $(document).ready(updateToggleProceduresBtn);
$(function() {
  let proceduresCache = [];

  const tousTypesProcedures = [
    'Achat direct',
    "Procédure d'une seule quotation (pro forma)",
    'Procédure négociée minimum 3 pro forma',
    "Appel d'offre ouvert local",
    "Appel d'offre ouvert international"
  ];

  // Charger les procédures depuis l'API et initialiser la liste + formulaire
  function loadProcedures() {
    $.get('http://localhost:3000/api/procedures', function(data) {
      proceduresCache = data;
      renderProceduresTable(data);
      resetForm();
    }).fail(() => alert('Erreur lors du chargement des procédures.'));
  }

  // Afficher procédures dans le tableau
  var proceduresListObj = null; // objet List.js global

function renderProceduresTable(procedures) {
  const $tbody = $('#proceduresList');
  $tbody.empty();

  if (window.proceduresListObj) {
    window.proceduresListObj.clear();
    delete window.proceduresListObj;
  }

  const items = procedures.map(proc => {
    // Badge catégorie
    let catBadge = '';
    if (proc.categorie === 'Biens/Provisions')
      catBadge = '<span class="badge bg-primary"><i class="bi bi-box-seam me-1"></i>Biens</span>';
    else if (proc.categorie === 'Services')
      catBadge = '<span class="badge bg-success"><i class="bi bi-gear me-1"></i>Services</span>';
    else if (proc.categorie === 'Travaux')
      catBadge = '<span class="badge bg-warning text-dark"><i class="bi bi-tools me-1"></i>Travaux</span>';
    else
      catBadge = `<span class="badge bg-secondary">${proc.categorie || ''}</span>`;

    // Badge procédure
    let procBadge = '';
    if (proc.type_procedure)
      procBadge = `<span class='badge bg-secondary'><i class='bi bi-diagram-3 me-1'></i>${proc.type_procedure}</span>`;

    // Montant min/max avec icône
    const montantMin = `<span class='badge bg-light text-dark border'><i class='bi bi-currency-dollar me-1'></i>${parseFloat(proc.montant_min).toFixed(2)}</span>`;
    const montantMax = proc.montant_max !== null ? `<span class='badge bg-light text-dark border'><i class='bi bi-currency-dollar me-1'></i>${parseFloat(proc.montant_max).toFixed(2)}</span>` : '';

    return {
      id: `<span style='display:none;'>${proc.id}</span>${proc.id}`,
      categorie: `<span style='display:none;'>${proc.categorie}</span>${catBadge}`,
      montant_min: montantMin,
      montant_max: montantMax,
      type_procedure: procBadge,
      actions: `<button class="btn btn-sm btn-warning btn-edit" data-id="${proc.id}"><i class="bi bi-pencil"></i> Modifier</button>`
    };
  });

  window.proceduresListObj = new List('proceduresTableContainer', {
    valueNames: ['id', 'categorie', 'montant_min', 'montant_max', 'type_procedure', 'actions'],
    page: 5,
    pagination: true,
    item: `<tr>
      <td class="id"></td>
      <td class="categorie"></td>
      <td class="montant_min"></td>
      <td class="montant_max"></td>
      <td class="type_procedure"></td>
      <td class="actions text-center"></td>
    </tr>`
  });

  if (items.length > 0) {
    window.proceduresListObj.add(items);
  } else {
    $tbody.append('<tr class="d-none"><td class="id">-</td><td class="categorie"></td><td class="montant_min"></td><td class="montant_max"></td><td class="type_procedure"></td><td class="actions"></td></tr>');
  }
}

  // Réinitialiser uniquement les champs montant, type procédure, et procedureId, sans toucher à la catégorie
 function resetForm() {
  // Ne vide plus #categorie sinon elle disparaît
  $('#montant_min').val('');
  $('#montant_max').val('');
  $('#type_procedure').prop('disabled', false).val('');
  $('#procedureId').val('');
}

  // Met à jour les options du select type_procedure selon catégorie et procédures existantes
function refreshTypeProcedureSelect(categorie, montant = null) {
  const currentProcId = $('#procedureId').val();

  if (!categorie) {
    $('#type_procedure').empty().append('<option value="" selected>--Sélectionnez une procédure--</option>');
    return;
  }

  // Trouve la procédure correspondant à category + montant si existe
  const procActuelle = montant !== null ? getProcedureByCategorieMontant(categorie, montant) : null;

  // Types déjà utilisés dans cette catégorie sauf celui en cours
  const typesUtilises = proceduresCache
    .filter(proc => proc.categorie === categorie && proc.id.toString() !== currentProcId)
    .map(proc => proc.type_procedure);

  const $select = $('#type_procedure');
  $select.empty();
  $select.append('<option value="" selected>--Sélectionnez une procédure--</option>');

  tousTypesProcedures.forEach(type => {
    const option = $('<option></option>').val(type).text(type);

    if (typesUtilises.includes(type)) {
      // Désactiver si différent de la procédure actuelle
      if (!procActuelle || procActuelle.type_procedure !== type) {
        option.prop('disabled', true);
      }
    }

    $select.append(option);
  });

  // Si procédure actuelle existe, sélectionne-la
  if (procActuelle) {
    $select.val(procActuelle.type_procedure);
    $select.prop('disabled', true);
  } else {
    $select.prop('disabled', false);
  }
}



  // Trouver procédure valide selon catégorie et montant saisi
  function getProcedureByCategorieMontant(categorie, montant) {
    if (!categorie || typeof montant !== 'number' || isNaN(montant)) return null;
    return proceduresCache.find(proc => {
      if (proc.categorie !== categorie) return false;
      const min = parseFloat(proc.montant_min);
      const max = proc.montant_max !== null ? parseFloat(proc.montant_max) : Number.MAX_SAFE_INTEGER;
      return montant >= min && montant <= max;
    }) || null;
  }

  // Événement changement catégorie : mise à jour options procédure, reset form
  $('#categorie').on('change', function() {
  const cat = $(this).val();
  refreshTypeProcedureSelect(cat);
  // Ne plus appeler resetForm ici 
  // resetForm();
});

  // Événement saisie ou modification montant_min : appliquer automatiquement la procédure si valide
$('#categorie, #montant_min').on('change keyup', function() {
  const categorie = $('#categorie').val();
  const montantRaw = $('#montant_min').val().replace(/[^0-9.]/g, '');
  const montant = parseFloat(montantRaw);

   refreshTypeProcedureSelect(categorie, montant);

  const proc = getProcedureByCategorieMontant(categorie, montant);
  if (proc) {
    $('#type_procedure').val(proc.type_procedure);
    $('#type_procedure').prop('disabled', true);
  } else {
    $('#type_procedure').val('');
    $('#type_procedure').prop('disabled', false);
  }
});

  

  // Soumission du formulaire
  $('#procedureForm').on('submit', function(e) {
    e.preventDefault();

    const payload = {
      categorie: $('#categorie').val() ? $('#categorie').val().trim() : '',
      type_procedure: $('#type_procedure').val(),
      montant_min: parseFloat($('#montant_min').val().replace(/[^0-9.]/g, '')),
      montant_max: $('#montant_max').val() ? parseFloat($('#montant_max').val().replace(/[^0-9.]/g, '')) : null
    };

    if (!payload.categorie || !payload.type_procedure || isNaN(payload.montant_min)) {
      showFormAlert('Veuillez remplir tous les champs obligatoires correctement.');
      return;
    }
    if (payload.montant_max !== null && payload.montant_max < payload.montant_min) {
      showFormAlert('Le montant maximum doit être supérieur ou égal au montant minimum.');
      return;
    }

    const id = $('#procedureId').val();
    const method = id ? 'PUT' : 'POST';
    const url = id ? `http://localhost:3000/api/procedures/${id}` : 'http://localhost:3000/api/procedures';

    $.ajax({
      url,
      method,
      contentType: 'application/json',
      data: JSON.stringify(payload),
      success: function() {
        $('#addProcedureModal').modal('hide');
        loadProcedures();
        resetForm();
        showFormAlert('Procédure sauvegardée avec succès.');
      },
      error: function(xhr) {
        showFormAlert(xhr.responseJSON?.error || 'Erreur serveur');
      }
    });
  });

//   management edition
// Ouvre le modal avec les données préremplies
$(document).on('click', '.btn-edit', function() {
  const id = $(this).data('id');

  // Cherche la procédure dans le cache
  const proc = proceduresCache.find(p => p.id === id);
  if (!proc) {
    showFormAlert('Procédure non trouvée');
    return;
  }

  // Remplit les champs du formulaire
  $('#procedureId').val(proc.id);
  $('#categorie').val(proc.categorie).trigger('change'); // déclenche refresh procédures disponibles

  // Attendre que les procédures dans le select soient mises à jour avant de pré-sélectionner
  setTimeout(() => {
    $('#montant_min').val(proc.montant_min);
    $('#montant_max').val(proc.montant_max || '');
    $('#type_procedure').val(proc.type_procedure);
    $('#type_procedure').prop('disabled', false);
  }, 100);

  // Ouvre le modal
  $('#addProcedureModal').modal('show');
});
$('#categorie, #montant_min').on('change keyup', function() {
  const categorie = $('#categorie').val();
  const montantRaw = $('#montant_min').val().replace(/[^0-9.]/g, '');
  const montant = parseFloat(montantRaw);

  const proc = getProcedureByCategorieMontant(categorie, montant);

  if (proc) {
    $('#type_procedure').val(proc.type_procedure);
    $('#type_procedure').prop('disabled', true);
  } else {
    $('#type_procedure').val('');
    $('#type_procedure').prop('disabled', false);
  }
});


  // Chargement initial
  loadProcedures();
});



