<div class="modal fade" id="addSupplierModal" tabindex="-1" aria-labelledby="addSupplierModalModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="ajoutFournisseurModalLabel">Ajouter un fournisseur</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                <form id="formAjoutFournisseur" enctype="multipart/form-data" novalidate>
                <!-- Informations de base -->
                <div class="mb-3">
                  <label for="nomSociete" class="form-label">Nom du fournisseur <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="nomSociete" name="nomSociete" required>
                  <div class="invalid-feedback">Ce champ est obligatoire.</div>
                </div>
                <div class="mb-3">
                  <label for="nomCommercial" class="form-label">Nom commercial</label>
                  <input type="text" class="form-control" id="nomCommercial" name="nomCommercial">
                </div>
                <div class="mb-3">
                  <label for="nif" class="form-label">Numéro d'identification fiscale (NIF)</label>
                  <input type="text" class="form-control" id="nif" name="nif">
                </div>
                <div class="mb-3">
                  <label for="tva" class="form-label">Numéro TVA</label>
                  <input type="text" class="form-control" id="tva" name="tva">
                </div>
                <div class="mb-3">
                  <label for="statutJuridique" class="form-label">Statut juridique</label>
                  <input type="text" class="form-control" id="statutJuridique" name="statutJuridique">
                </div>
                <div class="mb-3">
                  <label for="adresseSiege" class="form-label">Adresse du siège social</label>
                  <input type="text" class="form-control" id="adresseSiege" name="adresseSiege">
                </div>
                <div class="mb-3">
                  <label for="adresseFacturation" class="form-label">Adresse de facturation</label>
                  <input type="text" class="form-control" id="adresseFacturation" name="adresseFacturation">
                </div>
                <div class="mb-3">
                  <label for="adresseLivraison" class="form-label">Adresse de livraison</label>
                  <input type="text" class="form-control" id="adresseLivraison" name="adresseLivraison">
                </div>
                <div class="mb-3">
                  <label for="siteWeb" class="form-label">Site web</label>
                  <input type="url" class="form-control" id="siteWeb" name="siteWeb" placeholder="https://">
                </div>
                <!-- Finances -->
                <div class="mb-3">
                  <label for="rib" class="form-label">RIB / IBAN</label>
                  <input type="text" class="form-control" id="rib" name="rib">
                </div>
                <div class="mb-3">
                  <label for="banque" class="form-label">Nom de la banque</label>
                  <input type="text" class="form-control" id="banque" name="banque">
                </div>
                <div class="mb-3">
                  <label for="adresseBanque" class="form-label">Adresse de la banque</label>
                  <input type="text" class="form-control" id="adresseBanque" name="adresseBanque">
                </div>
                <div class="mb-3">
                  <label for="conditionsPaiement" class="form-label">Conditions de paiement</label>
                  <input type="text" class="form-control" id="conditionsPaiement" name="conditionsPaiement">
                </div>
                <div class="mb-3">
                  <label for="devise" class="form-label">Devise</label>
                  <input type="text" class="form-control" id="devise" name="devise">
                </div>
                <div class="mb-3">
                  <label for="credit" class="form-label">Informations de crédit</label>
                  <input type="text" class="form-control" id="credit" name="credit">
                </div>
                <!-- Contacts -->
                <div class="mb-3">
                  <label class="form-label">Contacts</label>
                  <div id="contactsContainer">
                    <!-- Un contact principal obligatoire -->
                    <div class="row g-2 align-items-end contact-row">
                      <div class="col-md-3">
                        <select class="form-select" name="type_contact[]">
                          <option value="principale">Principale</option>
                          <option value="facturation">Facturation</option>
                          <option value="technique">Technique</option>
                        </select>
                      </div>
                      <div class="col-md-6">
                        <input type="text" class="form-control" name="nom_contact[]" placeholder="Nom du contact principal" required>
                        <div class="invalid-feedback">Le nom du contact principal est obligatoire.</div>
                      </div>
                      <div class="col-md-6">
                        <input type="text" class="form-control" name="telephone_contact[]" placeholder="Téléphone">
                      </div>
                      <div class="col-md-4">
                        <input type="email" class="form-control" name="email_contact[]" placeholder="Email">
                      </div>
                      <div class="col-md-1">
                        <button type="button" class="btn btn-danger btn-sm remove-contact" style="display:none">&times;</button>
                      </div>
                    </div>
                  </div>
                  <button type="button" class="btn btn-outline-primary btn-sm mt-2" id="addContactBtn">+ Ajouter un contact</button>
                </div>
                <!-- Produits / Services -->
                <div class="mb-3">
                  <label for="produitsServices" class="form-label">Produits / Services</label>
                  <textarea class="form-control" id="produitsServices" name="produitsServices" rows="2" placeholder="Exemple : Matériel logistique, Transport, Maintenance..."></textarea>
                </div>
                <div class="mb-3">
                  <label for="description" class="form-label">Description</label>
                  <textarea class="form-control" id="description" name="description" rows="2"></textarea>
                </div>
                <div class="mb-3">
                  <label for="tarifs" class="form-label">Tarifs</label>
                  <input type="text" class="form-control" id="tarifs" name="tarifs">
                </div>
                <div class="mb-3">
                  <label for="delaiLivraison" class="form-label">Délai de livraison standard</label>
                  <input type="text" class="form-control" id="delaiLivraison" name="delaiLivraison">
                </div>
                <div class="mb-3">
                  <label for="garantie" class="form-label">Conditions de garantie</label>
                  <input type="text" class="form-control" id="garantie" name="garantie">
                </div>
                <!-- Contrat -->
                <div class="mb-3">
                  <label for="dateDebut" class="form-label">Date de début de la relation</label>
                  <input type="date" class="form-control" id="dateDebut" name="dateDebut">
                </div>
                <div class="mb-3">
                  <label for="dateFin" class="form-label">Date de fin de contrat</label>
                  <input type="date" class="form-control" id="dateFin" name="dateFin">
                </div>
                <div class="mb-3">
                  <label for="referenceContrat" class="form-label">Référence contrat</label>
                  <input type="text" class="form-control" id="referenceContrat" name="referenceContrat">
                </div>
                <div class="mb-3">
                  <label for="certifications" class="form-label">Certifications</label>
                  <input type="text" class="form-control" id="certifications" name="certifications">
                </div>
                <div class="mb-3">
                  <label for="remarques" class="form-label">Remarques</label>
                  <textarea class="form-control" id="remarques" name="remarques" rows="2"></textarea>
                </div>
                <div class="mb-3">
                  <label for="conditionsGeneralesVente" class="form-label">Conditions générales de vente</label>
                  <textarea class="form-control" id="conditionsGeneralesVente" name="conditionsGeneralesVente" rows="2" placeholder="Ex: 30 jours fin de mois, pénalités, CGV, etc."></textarea>
                </div>
                <!-- IMPORT DOCUMENTS -->
                <div class="mb-3">
                  <label for="documentsDemandes" class="form-label">Documents/informations demandés (import)</label>
                  <input type="file" class="form-control" id="documentsDemandes" name="documentsDemandes" multiple>
                  <div class="form-text">Sélectionne un ou plusieurs fichiers à importer (PDF, DOCX, JPG...)</div>
                  <ul id="listeDemandes" class="small"></ul>
                </div>
                <div class="mb-3">
                  <label for="documentsFournis" class="form-label">Documents/informations fournis (import)</label>
                  <input type="file" class="form-control" id="documentsFournis" name="documentsFournis" multiple>
                  <div class="form-text">Sélectionne un ou plusieurs fichiers à importer (PDF, DOCX, JPG...)</div>
                  <ul id="listeFournis" class="small"></ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
          <button type="submit" class="btn btn-primary">Enregistrer</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- JQuery + Bootstrap JS inclus dans ta page -->

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(function() {
  // -------- 1. Ajout/suppression contact dynamique --------
  $('#addContactBtn').on('click', function() {
    const contactHtml = `
      <div class="row g-2 align-items-end contact-row mt-2">
        <div class="col-md-3">
          <select class="form-select" name="type_contact[]">
            <option value="principale">Principale</option>
            <option value="facturation">Facturation</option>
            <option value="technique">Technique</option>
          </select>
        </div>
        <div class="col-md-3">
          <input type="text" class="form-control" name="nom_contact[]" placeholder="Nom du contact" required>
        </div>
        <div class="col-md-3">
          <input type="text" class="form-control" name="telephone_contact[]" placeholder="Téléphone">
        </div>
        <div class="col-md-2">
          <input type="email" class="form-control" name="email_contact[]" placeholder="Email">
        </div>
        <div class="col-md-1 d-flex align-items-center">
          <button type="button" class="btn btn-danger btn-sm remove-contact">&times;</button>
        </div>
      </div>`;
    $('#contactsContainer').append(contactHtml);
    $('#contactsContainer .remove-contact').show();
  });

  $('#contactsContainer').on('click', '.remove-contact', function() {
    $(this).closest('.contact-row').remove();
    if ($('#contactsContainer .contact-row').length === 1) {
      $('#contactsContainer .remove-contact').hide();
    }
  });

  if ($('#contactsContainer .contact-row').length === 1) {
    $('#contactsContainer .remove-contact').hide();
  }

  // -------- 2. Affichage fichiers sélectionnés --------
  $('#documentsDemandes').on('change', function() {
    let html = '';
    for(const file of this.files) html += `<li>${file.name}</li>`;
    $('#listeDemandes').html(html);
  });
  $('#documentsFournis').on('change', function() {
    let html = '';
    for(const file of this.files) html += `<li>${file.name}</li>`;
    $('#listeFournis').html(html);
  });

  // -------- 3. Soumission AJAX (AJOUT FOURNISSEUR) --------
  $('#formAjoutFournisseur').on('submit', function(e) {
    e.preventDefault();
    const form = this;
    if(!form.checkValidity()) {
      form.classList.add('was-validated');
      return;
    }

    const formData = new FormData();

    // Ajoute tous les champs simples (hors contacts et fichiers)
    $(form).serializeArray().forEach(function(item) {
      // Sauf les champs dynamiques de contacts, qui sont gérés plus bas !
      if (!['type_contact[]','nom_contact[]','telephone_contact[]','email_contact[]'].includes(item.name)) {
        formData.append(item.name, item.value);
      }
    });

    // Ajoute les contacts champ par champ, noms EXACT attendus par le back (attention !)
    $(form).find('.contact-row').each(function() {
      formData.append('typeContact', $(this).find('select[name="type_contact[]"]').val());
      formData.append('nomContact', $(this).find('input[name="nom_contact[]"]').val());
      formData.append('telContact', $(this).find('input[name="telephone_contact[]"]').val());
      formData.append('mailContact', $(this).find('input[name="email_contact[]"]').val());
    });

    // Ajoute les fichiers pour documentsDemandes
    const demandesFiles = form.documentsDemandes.files;
    for(let i=0; i<demandesFiles.length; i++) {
      formData.append('documentsDemandes', demandesFiles[i]);
    }
    // Ajoute les fichiers pour documentsFournis
    const fournisFiles = form.documentsFournis.files;
    for(let i=0; i<fournisFiles.length; i++) {
      formData.append('documentsFournis', fournisFiles[i]);
    }

    $.ajax({
      url: 'http://localhost:3000/fournisseurs',
      method: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      success: function(res) {
        showAlert(res.message || 'Fournisseur ajouté avec succès', 'success');
        $('#addSupplierModal').modal('hide');
        setTimeout(function() {
          $('.modal-backdrop').remove();
          $('body').removeClass('modal-open');
        }, 500);
        $('#formAjoutFournisseur')[0].reset();
        $('#formAjoutFournisseur').removeClass('was-validated');
        $('#contactsContainer').find('.contact-row:gt(0)').remove(); // Garde le principal, reset les autres
        $('#listeDemandes, #listeFournis').empty();
        if(typeof chargerFournisseurs === 'function') chargerFournisseurs();
      },
      error: function(xhr) {
        alert('Erreur: ' + (xhr.responseJSON?.error || xhr.statusText));
      }
    });
  });

});

</script>