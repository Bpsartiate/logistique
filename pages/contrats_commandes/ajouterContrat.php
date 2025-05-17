<!-- Modal Ajouter un nouveau contrat -->
<div class="modal fade" id="ajouterContratModal" tabindex="-1" aria-labelledby="ajouterContratModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
         <div class="modal-header">
          <h5 class="modal-title" id="ajouterContratModalLabel">Ajouter un nouveau contrat</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>

      
        <div class="modal-body">
            <form id="formAjouterContrat" novalidate>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="numeroContrat" class="form-label">Numéro du contrat <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="numeroContrat" name="numero" required />
                                <div class="invalid-feedback">Le numéro du contrat est obligatoire.</div>
                            </div>
                            <!-- Fournisseur -->
                            <div class="mb-3">
                                <label for="fournisseurContrat" class="form-label">Fournisseur <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="fournisseurContrat" name="fournisseur" required />
                                <div class="invalid-feedback">Le fournisseur est obligatoire.</div>
                            </div>
                            <!-- Dates de début et de fin -->
                            <div class="row">
                                <!-- Date de début -->
                                <div class="col-md-6 mb-3">
                                    <label for="dateDebutContrat" class="form-label">Date de début <span class="text-danger">*</span></label>
                                    <input type="date" class="form-control" id="dateDebutContrat" name="dateDebut" required />
                                    <div class="invalid-feedback">La date de début est obligatoire.</div>
                                </div>
                                <!-- Date de fin -->
                                <div class="col-md-6 mb-3">
                                    <label for="dateFinContrat" class="form-label">Date de fin <span class="text-danger">*</span></label>
                                    <input type="date" class="form-control" id="dateFinContrat" name="dateFin" required />
                                    <div class="invalid-feedback">La date de fin est obligatoire.</div>
                                </div>
                            </div>

                            <!-- Montant -->
                            <div class="mb-3">
                                <label for="montantContrat" class="form-label">Montant ($) <span class="text-danger">*</span></label>
                                <input type="number" min="0" step="0.01" class="form-control" id="montantContrat" name="montant" required />
                                <div class="invalid-feedback">Le montant est obligatoire et doit être positif.</div>
                            </div>
                            <!-- Statut -->
                            <div class="mb-3">
                                <label for="statutContrat" class="form-label">Statut <span class="text-danger">*</span></label>
                                <select class="form-select" id="statutContrat" name="statut" required>
                                    <option value="">Sélectionnez un statut</option>
                                    <option value="En cours">En cours</option>
                                    <option value="Terminé">Terminé</option>
                                    <option value="Suspendu">Suspendu</option>
                                    <option value="Résilié">Résilié</option>
                                </select>
                                <div class="invalid-feedback">Le statut est obligatoire.</div>
                            </div>
                            <!-- Description -->
                            <div class="mb-3">
                                <label for="descriptionContrat" class="form-label">Description (optionnel)</label>
                                <textarea class="form-control" id="descriptionContrat" name="description" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="submit" class="btn btn-primary">Ajouter le contrat</button>
                </div>
         </form>
    </div>
  </div>
</div>
