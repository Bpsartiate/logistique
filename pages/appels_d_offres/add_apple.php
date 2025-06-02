<div class="modal fade" id="modalLancerAO" tabindex="-1" aria-labelledby="modalLancerAOLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLancerAOLabel">Lancer un nouvel appel d’offre</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                <form id="formLancerAO" novalidate>
                <!-- Référence -->
                <div class="mb-3">
                  <label for="refAO" class="form-label">Référence <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="refAO" name="refAO" required>
                  <div class="invalid-feedback">Ce champ est obligatoire.</div>
                </div>
                <!-- Objet / Titre -->
                <div class="mb-3">
                  <label for="objetAO" class="form-label">Objet / Titre <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="objetAO" name="objetAO" required>
                  <div class="invalid-feedback">Ce champ est obligatoire.</div>
                </div>
                <!-- Objectif / Besoin détaillé -->
                <div class="mb-3">
                  <label for="objectifAO" class="form-label">Objectif / Besoin</label>
                  <textarea class="form-control" id="objectifAO" name="objectifAO" rows="3" placeholder="Décrire l’objectif ou le besoin détaillé"></textarea>
                </div>
                <!-- Type d’appel d’offre -->
                <div class="mb-3">
                  <label for="typeAO" class="form-label">Type d’appel d’offre <span class="text-danger">*</span></label>
                  <select class="form-select" id="typeAO" name="typeAO" required>
                    <option value="">Sélectionnez</option>
                    <option value="Fourniture">Fourniture</option>
                    <option value="Travaux">Travaux</option>
                    <option value="Service">Service</option>
                  </select>
                  <div class="invalid-feedback">Ce champ est obligatoire.</div>
                </div>
                <!-- Montant -->
                <div class="mb-3">
                <label for="montantEstime" class="form-label">Montant estimé (USD) <span class="text-danger">*</span></label>
                <input type="number" class="form-control" id="montantEstime" name="montantEstime" min="125" step="0.01" required>
                <div class="invalid-feedback">Veuillez saisir un montant estimé valide (minimum 125 USD).</div>
                </div>
                <div class="mb-3">
                <label for="procedureRecommandee" class="form-label">Procédure recommandée</label>
                <input type="text" class="form-control" id="procedureRecommandee" name="procedureRecommandee" readonly>
                </div>

                <!-- Description -->
                <div class="mb-3">
                  <label for="descriptionAO" class="form-label">Description</label>
                  <textarea class="form-control" id="descriptionAO" name="descriptionAO" rows="3"></textarea>
                </div>
                <!-- Dates -->
                <div class="row">
                  <div class="mb-3 col-md-6">
                    <label for="dateLancementAO" class="form-label">Date de lancement <span class="text-danger">*</span></label>
                    <input type="date" class="form-control" id="dateLancementAO" name="dateLancementAO" required>
                    <div class="invalid-feedback">Ce champ est obligatoire.</div>
                  </div>
                  <div class="mb-3 col-md-6">
                    <label for="dateClotureAO" class="form-label">Date de clôture <span class="text-danger">*</span></label>
                    <input type="date" class="form-control" id="dateClotureAO" name="dateClotureAO" required>
                    <div class="invalid-feedback">Ce champ est obligatoire.</div>
                  </div>
                </div>
                <!-- Critères pondérés -->
                <div class="mb-3">
                  <label class="form-label">Critères de sélection (en %)</label>
                  <div class="row g-2">
                    <div class="col-md-3">
                      <label for="criterePrix" class="form-label">Prix</label>
                      <input type="number" class="form-control" id="criterePrix" name="criterePrix" min="0" max="100" value="40" required>
                    </div>
                    <div class="col-md-3">
                      <label for="critereDelai" class="form-label">Délai</label>
                      <input type="number" class="form-control" id="critereDelai" name="critereDelai" min="0" max="100" value="20" required>
                    </div>
                    <div class="col-md-3">
                      <label for="critereQualite" class="form-label">Qualité</label>
                      <input type="number" class="form-control" id="critereQualite" name="critereQualite" min="0" max="100" value="30" required>
                    </div>
                    <div class="col-md-3">
                      <label for="critereGarantie" class="form-label">Garantie</label>
                      <input type="number" class="form-control" id="critereGarantie" name="critereGarantie" min="0" max="100" value="10" required>
                    </div>
                  </div>
                  <small class="form-text text-muted">La somme doit être égale à 100%</small>
                </div>
                <!-- Documents à joindre -->
                <div class="mb-3">
                  <label for="documentsAO" class="form-label">Documents à joindre (Cahier des charges, etc.)</label>
                  <input type="file" class="form-control" id="documentsAO" name="documentsAO[]" multiple>
                  <div class="form-text">PDF, DOCX, ZIP, etc. (max 10 fichiers)</div>
                </div>
                <!-- Fournisseurs invités (sélection multiple) -->
                <div class="mb-3">
                  <label for="fournisseursInvitesAO" class="form-label">Fournisseurs invités</label>
                  <select class="form-select" id="fournisseursInvitesAO" name="fournisseursInvitesAO" multiple>
                    <!-- Options à remplir dynamiquement -->
                  </select>
                  <div class="form-text">Sélectionnez un ou plusieurs fournisseurs invités</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
          <button type="submit" class="btn btn-primary">Lancer l’appel d’offre</button>
        </div>
      </form>
    </div>
  </div>
</div>
