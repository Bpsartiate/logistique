<div class="modal fade" id="ajouterTransporteur" tabindex="-1" aria-labelledby="ajouterTransporteurLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg"> <!-- modal plus large -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ajouterTransporteurLabel">Ajouter un transporteur</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
            <form id="formAjouterTransporteur" novalidate>
          <div class="row g-3">
            <div class="col-md-6">
              <label for="nomTransporteur" class="form-label">Nom du transporteur <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="nomTransporteur" placeholder="Nom complet" required />
              <div class="invalid-feedback">Le nom du transporteur est obligatoire.</div>
            </div>
            <div class="col-md-6">
              <label for="typeTransporteur" class="form-label">Type de transporteur</label>
              <select class="form-select" id="typeTransporteur">
                <option value="" selected>Choisir un type</option>
                <option value="routier">Routier</option>
                <option value="ferroviaire">Ferroviaire</option>
                <option value="maritime">Maritime</option>
                <option value="aerien">Aérien</option>
                <option value="autre">Autre</option>
              </select>
            </div>
            <div class="col-md-6">
              <label for="contactTransporteur" class="form-label">Contact principal</label>
              <input type="text" class="form-control" id="contactTransporteur" placeholder="Nom du contact" />
            </div>
            <div class="col-md-6">
              <label for="telephoneTransporteur" class="form-label">Téléphone</label>
              <input type="tel" class="form-control" id="telephoneTransporteur" placeholder="+229 90 00 00 00" pattern="^\+?\d{7,15}$" />
              <div class="invalid-feedback">Veuillez entrer un numéro de téléphone valide.</div>
            </div>
            <div class="col-md-6">
              <label for="emailTransporteur" class="form-label">Email</label>
              <input type="email" class="form-control" id="emailTransporteur" placeholder="contact@transporteur.com" />
              <div class="invalid-feedback">Veuillez entrer une adresse email valide.</div>
            </div>
            <div class="col-md-6">
              <label for="adresseTransporteur" class="form-label">Adresse</label>
              <input type="text" class="form-control" id="adresseTransporteur" placeholder="Adresse complète" />
            </div>
            <div class="col-12">
              <label for="commentairesTransporteur" class="form-label">Commentaires / Notes</label>
              <textarea class="form-control" id="commentairesTransporteur" rows="3" placeholder="Informations complémentaires"></textarea>
            </div>
            </div>
            <div class="mt-4 d-flex justify-content-end">
                <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">Annuler</button>
                <button type="submit" class="btn btn-primary">Ajouter Transporteur</button>
            </div>
            </form>
        </div>
        
      </div>
    </div>
  </div>
</div>
