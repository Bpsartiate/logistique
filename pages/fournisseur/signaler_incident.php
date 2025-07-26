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
