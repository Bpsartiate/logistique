
<div class="modal fade" id="modalIncidentFournisseur" tabindex="-1" aria-labelledby="modalIncidentFournisseurLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <form class="modal-content" id="formSignalementIncident" novalidate>
      <div class="modal-header bg-warning bg-opacity-25">
        <h5 class="modal-title" id="modalIncidentFournisseurLabel">
          Signalement d’un incident — <span id="incidentFournisseurNom" class="text-primary"></span>
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">

        <!-- Info contexte -->
        <div class="alert alert-info py-2 mb-3" role="alert">
          Merci de détailler l’incident constaté sur ce fournisseur. Les informations seront transmises à la cellule conformité et achats.
        </div>

        <!-- Sélecteur de type d’incident -->
        <div class="row g-3 mb-2">
          <div class="col-md-6">
            <label for="typeIncident" class="form-label">Type d’incident <span class="text-danger">*</span></label>
            <select class="form-select" id="typeIncident" name="type_incident" required>
              <option value="">Sélectionner…</option>
              <option>Retard de livraison</option>
              <option>Non-conformité produit</option>
              <option>Problème facture ou tarif</option>
              <option>Défaut de communication</option>
              <option>Litige juridique</option>
              <option>Autre (préciser)</option>
            </select>
            <div class="invalid-feedback">Type requis.</div>
          </div>
          <div class="col-md-6">
            <label for="graviteIncident" class="form-label">Gravité <span class="text-danger">*</span></label>
            <select class="form-select" id="graviteIncident" name="gravite" required>
              <option value="">Sélectionner…</option>
              <option value="Faible">Faible</option>
              <option value="Moyenne">Moyenne</option>
              <option value="Élevée">Élevée</option>
            </select>
            <div class="invalid-feedback">Gravité requise.</div>
          </div>
        </div>

        <!-- Description détaillée -->
        <div class="mb-3">
          <label for="descIncident" class="form-label">Description détaillée <span class="text-danger">*</span></label>
          <textarea class="form-control" id="descIncident" name="description" rows="4" required maxlength="2000" placeholder="Décris précisément l’incident, fournitures concernées, impact sur l’activité..."></textarea>
          <div class="invalid-feedback">La description est obligatoire.</div>
        </div>

        <!-- Upload de fichiers justificatifs -->
        <div class="mb-3">
          <label class="form-label">Pièces jointes (facultatif, PDF/JPG/PNG, max 3 Mo)</label>
          <input type="file" class="form-control" id="fichiersIncident" name="fichiers[]" multiple accept=".pdf,.jpg,.jpeg,.png">
        </div>

        <!-- Sélecteur statut incident (option admin) -->
        <div class="mb-3 d-none" id="adminStatutIncident">
          <label class="form-label">Statut de l’incident</label>
          <select class="form-select" name="statut_incident">
            <option value="Ouvert">Ouvert</option>
            <option value="Résolu">Résolu</option>
          </select>
        </div>

      </div>
      <div class="modal-footer bg-light">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <button type="submit" class="btn btn-danger">
          <span class="fa fa-flag me-1"></span> Signaler l’incident
        </button>
      </div>
    </form>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  
// Gestion soumission du formulaire d'incident
$(function() {
  let incidentFournisseurId = null;

  // Ecouteur unique sur la fermeture de la modale, placé ici hors submit
  $('#modalIncidentFournisseur').on('hidden.bs.modal', function() {
    if (window.chargerFicheFournisseur && typeof window.chargerFicheFournisseur === 'function' && incidentFournisseurId !== null) {
      window.chargerFicheFournisseur(incidentFournisseurId);
      const ficheModal = new bootstrap.Modal(document.getElementById('ficheFournisseur'));
      ficheModal.show();
    }
  });

  // Fonction globale pour ouvrir la modale avec le fournisseur sélectionné
  window.ouvrirModalSignalerIncident = function(idFournisseur, nomFournisseur) {
    incidentFournisseurId = idFournisseur;
    $('#incidentFournisseurNom').text(nomFournisseur);
    $('#formSignalementIncident')[0].reset();
    $('#formSignalementIncident').removeClass('was-validated');
    const myModal = new bootstrap.Modal(document.getElementById('modalIncidentFournisseur'));
    myModal.show();
  };

  $('#formSignalementIncident').on('submit', function(e) {
    e.preventDefault();
    const form = this;

    if (!form.checkValidity()) {
      e.stopPropagation();
      $(form).addClass('was-validated');
      return;
    }

    // Préparation des données avec FormData (gestion fichiers multiples)
    const formData = new FormData(form);
    formData.append('id_fournisseur', incidentFournisseurId);

    // Désactiver bouton submit et afficher feedback
    const $submitBtn = $(form).find('button[type="submit"]');
    $submitBtn.prop('disabled', true).text('Envoi en cours...');

    // URL de l’API configurable 
    const API_BASE_URL = 'http://localhost:3000';

    $.ajax({
      url: `${API_BASE_URL}/incidents`,
      method: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      success: function(res) {
        if (typeof showAlert === 'function') {
          showAlert(res.message || "Incident signalé avec succès", 'success');
        } else {
          alert(res.message || "Incident signalé avec succès");
        }
        // Fermeture de la modale
        bootstrap.Modal.getInstance(document.getElementById('modalIncidentFournisseur')).hide();
      },
      error: function(xhr) {
        if (typeof showAlert === 'function') {
          showAlert(`Erreur : ${xhr.responseJSON?.error || xhr.statusText}`, 'danger');
        } else {
          alert(`Erreur : ${xhr.responseJSON?.error || xhr.statusText}`);
        }
      },
      complete: function() {
        // Réactiver bouton et remettre texte initial
        $submitBtn.prop('disabled', false).html('<span class="fa fa-flag me-1"></span> Signaler l’incident');
      }
    });
  });
});

</script>
