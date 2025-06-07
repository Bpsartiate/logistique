$(function() {
  const serviceCode = "DEP"; // adapte selon ton service/département

  const receptionsList = new List('tableReceptions', {
    valueNames: ["id", "numeroOfficiel", "commande", "fournisseur", "date", "transporteur", "quantite", "etat", "comite", "statut", "actions"],
    page: 5,
    pagination: true,
    item: `<tr>
      <td class="id"></td>
      <td class="numeroOfficiel"></td>
      <td class="commande"></td>
      <td class="fournisseur"></td>
      <td class="date"></td>
      <td class="transporteur"></td>
      <td class="quantite"></td>
      <td class="etat"></td>
      <td class="comite"></td>
      <td class="statut"></td>
      <td class="actions"></td>
    </tr>`
  });

  const receptionsData = {};
  let count = 1;

  function showToast(message, type = 'primary', delay = 3000) {
    const $toast = $('#mainToast');
    $toast.removeClass().addClass(`toast align-items-center text-bg-${type} border-0`);
    $('#mainToastBody').text(message);
    const toast = new bootstrap.Toast($toast[0], { delay });
    toast.show();
  }

  function generateNumeroOfficiel() {
    const annee = new Date().getFullYear();
    const numeroSeq = String(count).padStart(4, '0');
    return `${annee}-${serviceCode}-${numeroSeq}`;
  }

  function ajouterReception(reception) {
    receptionsData[reception.id] = reception;
    receptionsList.add({
      id: reception.id,
      numeroOfficiel: reception.numeroOfficiel,
      commande: reception.commande,
      fournisseur: reception.fournisseur,
      date: reception.date,
      transporteur: reception.transporteur,
      quantite: reception.quantite,
      etat: reception.etat,
      comite: reception.comite.join(', '),
      statut: reception.statut,
      actions: `<button class="btn btn-sm btn-info btnVoirDetails" data-id="${reception.id}" title="Voir détails"><i class="fas fa-eye"></i></button>`
    });
  }

  $('#formNouvelleReception').on('submit', function(e) {
    e.preventDefault();
    const form = this;

    if (!form.checkValidity()) {
      $(form).addClass('was-validated');
      showToast('Veuillez remplir correctement tous les champs obligatoires.', 'danger');
      return;
    }

    const comiteSelected = $('#comiteReception').val();
    if (!comiteSelected || comiteSelected.length === 0) {
      showToast('Veuillez sélectionner au moins un membre du comité.', 'danger');
      return;
    }

    const reception = {
      id: count.toString(),
      numeroOfficiel: generateNumeroOfficiel(),
      commande: $('#commandeReception').val(),
      fournisseur: $('#fournisseurReception option:selected').text(),
      date: $('#dateReception').val(),
      transporteur: $('#transporteurReception option:selected').text() || '',
      quantite: $('#quantiteReception').val(),
      etat: `<span class="badge ${
        $('#etatInspection').val() === 'Conforme' ? 'bg-success' :
        $('#etatInspection').val() === 'Non conforme' ? 'bg-danger' :
        $('#etatInspection').val() === 'Partiellement conforme' ? 'bg-warning text-dark' :
        'bg-secondary'
      }">${$('#etatInspection').val()}</span>`,
      comite: comiteSelected,
      statut: '<span class="badge bg-warning">En attente</span>',
      remarques: $('#remarquesReception').val() || 'Aucune remarque'
    };

    ajouterReception(reception);
    count++;

    form.reset();
    $(form).removeClass('was-validated');
    bootstrap.Modal.getInstance(document.getElementById('modalNouvelleReception')).hide();
    showToast('Réception ajoutée avec succès !', 'success');
  });

  // Affichage modal détail
  $('body').on('click', '.btnVoirDetails', function() {
    const id = $(this).data('id');
    const reception = receptionsData[id];
    if (!reception) {
      showToast('Détails introuvables.', 'danger');
      return;
    }
    $('#detailId').text(reception.id);
    $('#detailNumeroOfficiel').text(reception.numeroOfficiel);
    $('#detailCommande').text(reception.commande);
    $('#detailFournisseur').text(reception.fournisseur);
    $('#detailDate').text(reception.date);
    $('#detailTransporteur').text(reception.transporteur);
    $('#detailQuantite').text(reception.quantite);
    $('#detailEtat').html(reception.etat);
    $('#detailComiteReception').text(reception.comite.join(', '));
    $('#detailStatutValidation').html(reception.statut);
    $('#detailRemarques').text(reception.remarques);

    if (reception.statut.includes('En attente')) {
      $('#btnValiderReception').show().data('id', id);
    } else {
      $('#btnValiderReception').hide();
    }

    const modal = new bootstrap.Modal(document.getElementById('modalDetailReception'));
    modal.show();
  });

  // Validation réception
  $('#btnValiderReception').on('click', function() {
    const id = $(this).data('id');
    if (!id) return;

    receptionsData[id].statut = '<span class="badge bg-success">Validé</span>';
    receptionsList.update('id', id, { statut: receptionsData[id].statut });
    $('#detailStatutValidation').html(receptionsData[id].statut);
    showToast('Réception validée avec succès !', 'success');
    $(this).hide();
  });
});