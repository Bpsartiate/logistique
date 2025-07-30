<div class="modal modal-dialog-scrollable fade" id="panelEvaluationFournisseur" tabindex="-1" aria-labelledby="panelEvaluationFournisseur" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <form id="formEvalFournisseur" class="modal-content" novalidate>
      <div class="modal-header">
        <h5 class="modal-title" id="modalEvalFournisseurLabel">
          Évaluation du fournisseur <span id="fournisseurNom"></span>
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
      </div>
      <div class="modal-body">  

        <!-- Nombre d’évaluateurs -->
        <div class="alert alert-info py-2" id="nbEvaluateursFournisseur">
          <strong>Déjà <span id="compteurEvaluateurs">0</span> personne(s) ont évalué ce fournisseur.</strong>
        </div>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label">Qualité des produits/services <span class="text-primary">(1 à 10)</span></label>
            <input type="number" class="form-control" name="qualite" min="1" max="10" required>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Respect des délais <span class="text-primary">(1 à 10)</span></label>
            <input type="number" class="form-control" name="delai" min="1" max="10" required>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Service client <span class="text-primary">(1 à 10)</span></label>
            <input type="number" class="form-control" name="service" min="1" max="10" required>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Communication <span class="text-primary">(1 à 10)</span></label>
            <input type="number" class="form-control" name="communication" min="1" max="10" required>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Coût & Compétitivité <span class="text-primary">(1 à 10)</span></label>
            <input type="number" class="form-control" name="cout" min="1" max="10">
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Conformité <span class="text-primary">(1 à 10)</span></label>
            <input type="number" class="form-control" name="conformite" min="1" max="10" required>
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label">Commentaires (facultatif)</label>
          <textarea class="form-control" name="commentaires" rows="3"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <button type="submit" class="btn btn-primary">Soumettre l’évaluation</button>
      </div>
    </form>
  </div>
</div>
<script>
  $(function () {
  let fournisseurSelectionneId = null;

  // Fonction globale pour ouvrir la modale avec le fournisseur ciblé
  window.ouvrirModaleEvaluation = function(idFournisseur, nomFournisseur) {
    fournisseurSelectionneId = idFournisseur;
    $('#fournisseurNom').text(nomFournisseur);

    // Remise à zéro du formulaire et validation
    const $form = $('#formEvalFournisseur');
    $form[0].reset();
    $form.removeClass('was-validated');

    // Charger le nombre d’évaluations existantes pour ce fournisseur
    $.ajax({
      url: `http://localhost:3000/evaluations/count/${idFournisseur}`,
      method: 'GET',
      success: function (res) {
        $('#compteurEvaluateurs').text(res.count || 0);
      },
      error: function () {
        $('#compteurEvaluateurs').text('0');
      }
    });

    // Ouvrir la modale Bootstrap
    const myModal = new bootstrap.Modal(document.getElementById('panelEvaluationFournisseur'));
    myModal.show();
  }

  // Rouvrir la fiche fournisseur à la fermeture du modal d'évaluation (même sans soumission)
  $('#panelEvaluationFournisseur').on('hidden.bs.modal', function() {
    if (window.chargerFicheFournisseur && typeof window.chargerFicheFournisseur === 'function' && typeof fournisseurSelectionneId !== 'undefined') {
      window.chargerFicheFournisseur(fournisseurSelectionneId);
      const ficheModal = new bootstrap.Modal(document.getElementById('ficheFournisseur'));
      ficheModal.show();
    }
  });

  // Gestion Submit formulaire evaluation
  $('#formEvalFournisseur').on('submit', function (e) {
    e.preventDefault();
    const form = this;

    if (!form.checkValidity()) {
      e.stopPropagation();
      $(form).addClass('was-validated');
      return;
    }

    // Validation stricte JS : toutes les notes doivent être entre 1 et 10
    const champs = ['qualite','delai','service','communication','conformite','cout'];
    for (const champ of champs) {
      if (form[champ] && form[champ].value) {
        const val = parseInt(form[champ].value, 10);
        if (val < 1 || val > 10) {
          if (typeof showAlert === 'function') {
            showAlert('Chaque note doit être comprise entre 1 et 10.', 'danger');
          } else {
            alert('Chaque note doit être comprise entre 1 et 10.');
          }
          form[champ].focus();
          return;
        }
      }
    }

    // Collecte des données (adapter aux champs attendus par le backend)
    const qualite = parseInt(form.qualite.value, 10);
    const delai = parseInt(form.delai.value, 10);
    const service = parseInt(form.service.value, 10);
    const communication = parseInt(form.communication.value, 10);
    const conformite = parseInt(form.conformite.value, 10);
    const cout = form.cout.value ? parseInt(form.cout.value, 10) : null;
    const commentaire = form.commentaires.value || '';

    // Récupère l'id_entreprise (à adapter selon ton contexte, ici variable globale ou à définir)
    const idEntreprise = window.idEntreprise || 1; // À adapter selon ton app
    const data = {
      id_fournisseur: fournisseurSelectionneId,
      id_utilisateur: 1, // A remplacer par utilisateur connecté réel
      id_entreprise: idEntreprise, // Ajouté ici
      qualite,
      delai,
      service,
      communication,
      conformite,
      cout,
      commentaire
    };

    $.ajax({
      url: 'http://localhost:3000/evaluations',
      method: 'POST',
      contentType: 'application/json',
      data: JSON.stringify(data),
      success: function (res) {
        if (typeof showAlert === 'function') {
          showAlert(res.message || "Évaluation enregistrée avec succès", 'success');
        } else {
          alert(res.message || "Évaluation enregistrée avec succès");
        }
        // Cacher modale
        bootstrap.Modal.getInstance(document.getElementById('panelEvaluationFournisseur')).hide();
        // Déclencher événement custom pour rafraîchir liste fournisseurs si besoin
        $(document).trigger('fournisseurAjoute');
        // Rouvrir la fiche fournisseur et rafraîchir ses données
        setTimeout(function() {
          if (window.chargerFicheFournisseur && typeof window.chargerFicheFournisseur === 'function' && typeof fournisseurSelectionneId !== 'undefined') {
            window.chargerFicheFournisseur(fournisseurSelectionneId);
            const ficheModal = new bootstrap.Modal(document.getElementById('ficheFournisseur'));
            ficheModal.show();
          }
        }, 400);
      },
      error: function (xhr) {
        if (typeof showAlert === 'function') {
          showAlert(`Erreur : ${xhr.responseJSON?.error || xhr.statusText}`, 'danger');
        } else {
          alert(`Erreur : ${xhr.responseJSON?.error || xhr.statusText}`);
        }
      }
    });
  });

  // Exemple : ouverture modale à partir d’un bouton "Évaluer" (à adapter selon ta table)
  $(document).on('click', '.btn-evaluer-fournisseur', function () {
    const idF = $(this).data('fournisseur-id');
    const nomF = $(this).data('fournisseur-nom');
    ouvrirModaleEvaluation(idF, nomF);
  });
});

</script>


