<div class="content">
     <!-- content nav -->
     <?php include_once "./content_nav.php" ?>
     <!-- Alertes dynamiques Bootstrap -->
     <div id="alertContainer" class="mt-2"></div>
<!-- Modal -->
    <?php include_once "add_fourn.php"; ?>
    <?php include_once "fiche_fourn.php" ?>
    <?php include_once "modal_evalu.php"; ?>
    <?php include_once "signaler_incident.php"; ?>
    <?php include_once "docFourn.php"; ?>
    <?php include_once "ponderation.php"; ?>

     <!-- conetent  end -->
      <!-- tittre -->
            <div class="row">
                <div class="col-md-12">
                <div class="card">
                    <div class="bg-holder d-none d-lg-block bg-card" style="background-image:url(assets/img/icons/spot-illustrations/corner-4.png);">
                    </div>
                    <!--/.bg-holder-->

                    <div class="card-body position-relative">
                    <div class="row">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="mt-3">Gestion des Fournisseurs</h5>
                         <button class="btn mt-2 btn-primary" data-bs-toggle="modal" data-bs-target="#modalPonderations">
                          <i class="fas fa-plus me-1"></i>Ponderations
                          </button>
                        </div>
                    </div>
                    </div>
                </div>
                </div>
            </div>
       <div class="row">
        <div class="col-md-12">
             <!-- Exemple d'alerte critique -->
  <!-- Alerte -->
<!-- Alerte avec compteur et bouton Voir -->
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
  <span class="fas fa-exclamation-triangle me-2"></span>
  Évaluation urgente à faire pour <span class="badge text-bg-danger" id="nbFournisseursRisque"> 0 </span> fournisseurs à risque élevé !
  <button id="btnVoirRisque" class="btn btn-sm btn-outline-danger ms-auto">Voir</button>
</div>

<!-- Conteneur List.js (cherche dans tout ce conteneur) -->
 <div class="row">
  <div class="col-md-12">
    <div class="card mb-2">
      <div class="container-fluid">
        <div id="containerRisque" style="display:none;">
        <div id="alertFourn" data-list='{"valueNames":["nom","score","statut"],"page":5,"pagination":true}'>
        <!-- Barre de recherche -->
          <div class="row justify-content-between align-items-center mt-4 g-0 mb-3">
              <div class="col-auto col-sm-5">
              <form>
                  <div class="input-group">
                  <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher un fournisseur..." aria-label="search" />
                  <div class="input-group-text bg-transparent"><span class="fa fa-search fs--1 text-600"></span></div>
                  </div>
              </form>
              </div>
            </div>
    <!-- Table des fournisseurs -->
            <div class="table-responsive scrollbar">
                  <table class="table table-bordered table-striped fs--5 mb-0">
                    <thead class="bg-200 text-900" >
                      <tr>
                        <th class="sort" data-sort="nom">Nom fournisseur</th>
                        <th class="sort" data-sort="score">Score</th>
                        <th class="sort" data-sort="statut">Statut</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody class="list" id="listFournisseursBody">
                      <!-- Les lignes chargées via JS seront ajoutées ici -->
                    </tbody>
                  </table>
                </div>

                <!-- Pagination générée automatiquement -->
              <div class="d-flex justify-content-center mb-3">
                    <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Précédent" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                    <ul class="pagination mb-0"></ul>
                    <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Suivant" data-list-pagination="next"><span class="fas fa-chevron-right"> </span></button>
                </div>
              </div>
            </div>
    </div>
  </div>
  </div>
</div>


        </div>
       </div>
        <!-- table -->
        <div class="row">
            <div class="col-12 col-lg-12 col-xl-12">
                <div class="card mb-4">
                <div class="card-body">
                    <div id="tableFournisseurs" data-list='{"valueNames":["nom","type","statut","contact","score","risque"],"page":10"pagination":true}'>
                    <div class="row justify-content-between align-items-center g-0 mb-3">
                        <div class="col-auto col-sm-5">
                        <form>
                            <div class="input-group">
                            <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher un fournisseur..." aria-label="search" />
                            <div class="input-group-text bg-transparent"><span class="fa fa-search fs--1 text-600"></span></div>
                            </div>
                        </form>
                        </div>
                        <div class="col-auto">
                        <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addSupplierModal" type="button"><span class="fa fa-plus me-1"></span>Ajouter un fournisseur</button>
                        </div>
                    </div>
                    <div class="table-responsive scrollbar">
                        <table class="table table-bordered table-striped fs--1 mb-0">
                        <thead class="bg-200 text-900">
                            <tr>
                            <th class="sort" data-sort="nom">Nom</th>
                            <th class="sort" data-sort="type">Type</th>
                            <th class="sort" data-sort="statut">Statut</th>
                            <th class="sort" data-sort="contact">Contact principal</th>
                            <th class="sort" data-sort="score">Score</th>
                            <th class="sort" data-sort="risque">Risque</th>
                            <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody class="list">
                        </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-center mt-3">
                        <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Précédent" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                        <ul class="pagination mb-0"></ul>
                        <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Suivant" data-list-pagination="next"><span class="fas fa-chevron-right"> </span></button>
                    </div>
                    </div>
                            <!-- Les lignes seront générées dynamiquement -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>
<script src="https://unpkg.com/vue@3/dist/vue.global.prod.js"></script>

<script>

// Fonction pour afficher une alerte Bootstrap

function showAlert(message, type = 'info', timeout = 4000) {
  const alertId = 'alert-' + Date.now();
  const alertHtml = `<div id="${alertId}" class="alert alert-${type} alert-dismissible fade show" role="alert">
    ${message}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>`;
  $('#alertContainer').append(alertHtml);
  if (timeout > 0) {
    setTimeout(() => {
      $('#' + alertId).alert('close');
    }, timeout);
  }
}
// Fonction pour charger les fournisseurs et mettre à jour la liste
// Utilise List.js pour la pagination et la recherche
let fournisseurList;

function chargerFournisseurs() {
  $.ajax({
    url: 'http://localhost:3000/fournisseurs',
    method: 'GET',
    dataType: 'json',
    success: function(fournisseurs) {
      if (fournisseurList) fournisseurList.clear();

      const items = fournisseurs.map(f => {
        // Calcul classes et contenu badges
        let statutClass = 'bg-secondary';
        let statutContent = f.statut || '';
        if (f.statut) {
          const s = f.statut.toLowerCase();
          if (s === 'actif') statutClass = 'bg-success';
          else if (s === 'suspendu') statutClass = 'bg-danger';
          else if (s === 'en attente') {
            statutClass = 'bg-warning text-dark';
            statutContent = `<span class="badge bg-warning text-dark"><i class="fas fa-spinner fa-spin"></i></span>${f.statut}`;
          }
        }

        let risqueClass = 'bg-secondary';
        let risqueText = '-';
        if (f.niveau_risque) {
          risqueText = f.niveau_risque;
          switch (f.niveau_risque.toLowerCase()) {
            case 'faible': risqueClass = 'bg-success'; break;
            case 'moyen': risqueClass = 'bg-warning text-dark'; break;
            case 'élevé':
            case 'eleve': risqueClass = 'bg-danger'; break;
          }
        }

        let contactsText = '-';
        if (f.contacts && f.contacts.length) {
          contactsText = f.contacts.map(c => c.nom).join(', ');
        }

        return {
          nom: f.nom || '',
          type: f.statut_juridique || f.type || '',
          statut: `<span class="badge ${statutClass}">${statutContent}</span>`,
          contact: f.nom_contact_principal || contactsText,
          score: (typeof f.score === 'number') ? f.score.toFixed(2) : '-',
          risque: `<span class="badge ${risqueClass}">${risqueText}</span>`,
          actions: `
            <a class="btn btn-sm btn-info btn-fiche-fournisseur"
               data-fournisseur-id="${f.id || ''}"
               title="Voir fiche">
              <span class="fa fa-eye"></span>
            </a>
            <button class="btn btn-sm btn-warning btn-evaluer-fournisseur"
                    data-fournisseur-id="${f.id || ''}"
                    data-fournisseur-nom="${(f.nom || '').replace(/\"/g, '&quot;')}"
                    title="Évaluer">
              <span class="fa fa-star"></span>
            </button>
            <a class="btn btn-sm btn-dark btn-docs-fournisseur"
               data-fournisseur-id="${f.id || ''}"
               data-fournisseur-nom="${(f.nom || '').replace(/\"/g, '&quot;')}"
               data-bs-toggle="modal"
               data-bs-target="#modalDocsFournisseur"
               title="Documents">
              <span class="fa fa-file-alt"></span>
            </a>`
        };
      });

      if (!fournisseurList) {
        fournisseurList = new List('tableFournisseurs', {
          valueNames: ["nom", "type", "statut", "contact", "score", "risque", "actions"],
          page: 5,
          pagination: true,
          item: `<tr>
            <td class="nom"></td>
            <td class="type"></td>
            <td class="statut"></td>
            <td class="contact"></td>
            <td class="score"></td>
            <td class="risque"></td>
            <td class="actions"></td>
          </tr>`
        });
      }

      fournisseurList.add(items);
    },
    error: function() {
      showAlert('Erreur lors du chargement des fournisseurs');
    }
  });
}

$(document).ready(() => {
  chargerFournisseurs();
});

// Handler clic bouton "Voir fiche" qui récupère l'ID et ouvre modale Vue
$(document).on('click', '.btn-fiche-fournisseur', function() {
  const idFournisseur = $(this).data('fournisseur-id');
  if (!idFournisseur) {
    alert('ID Fournisseur manquant');
    return;
  }

fetch(`http://localhost:3000/fournisseurs/${idFournisseur}`)
  .then(res => {
    if (!res.ok) throw new Error('Erreur de chargement fournisseur');
    return res.json();
  })
  .then(data => {
    if (window.ouvrirModalFournisseur) {
      window.ouvrirModalFournisseur(data);
    } else {
      alert('Méthode ouvrirModalFournisseur introuvable');
    }
  })
  .catch(err => alert('Erreur : ' + err.message));

});
// risque affichage
  let listeFournisseurs;

function createRowHtml(fournisseur) {
  let badgeScoreClass = 'bg-secondary';
  if (fournisseur.score !== null && fournisseur.score !== undefined) {
    const score = parseFloat(fournisseur.score);
    if (score < 50) badgeScoreClass = 'bg-danger';
    else if (score < 70) badgeScoreClass = 'bg-warning text-dark';
    else badgeScoreClass = 'bg-success';
  }

  let badgeStatutClass = 'bg-secondary';
  if (fournisseur.statut) {
    const stat = fournisseur.statut.toLowerCase();
    if (stat === 'risque élevé') badgeStatutClass = 'bg-warning text-dark';
    else if (stat === 'suspendu') badgeStatutClass = 'bg-danger';
    else if (stat === 'actif') badgeStatutClass = 'bg-success';
  }

  return `
    <tr>
      <td class="nom">${fournisseur.nom}</td>
      <td class="score"><span class="badge ${badgeScoreClass}">${fournisseur.score}</span></td>
      <td class="statut"><span class="badge ${badgeStatutClass}">${fournisseur.statut}</span></td>
      <td class="actions">
        <button class="btn btn-sm btn-warning btn-evaluer-fournisseur"
          data-fournisseur-id="${fournisseur.id}"
          data-fournisseur-nom="${fournisseur.nom.replace(/"/g, '&quot;')}"
          title="Évaluer">
          <span class="fa fa-star"></span>
        </button>
      </td>
    </tr>
  `;
}
// if(!listeFournisseurs) {
//   listeFournisseurs = new List('alertFourn', {
//     valueNames: ['nom', 'score', 'statut'],
//     page: 5,
//     pagination: true,
//     item: `<tr>
//       <td class="nom"></td>
//       <td class="score"></td>
//       <td class="statut"></td>
//       <td class="actions">
//         <button class="btn btn-sm btn-warning btn-evaluer-fournisseur"
//           data-fournisseur-id=""
//           data-fournisseur-nom=""
//           title="Évaluer">
//           <span class="fa fa-star"></span>
//         </button>
//       </td>
//     </tr>`
//   });
// }
function chargerAlertFourn() {
  $.ajax({
    url: 'http://localhost:3000/fournisseurs-risque-eleve',
    method: 'GET',
    dataType: 'json',
    success: function(data) {
      const tbody = $('#listFournisseursBody').empty();

      data.forEach(f => {
        tbody.append(createRowHtml({
          nom: f.nom || '',
          score: f.score != null ? f.score.toFixed(1) : '-',
          statut: f.statut || '',
          id: f.id || ''
        }));
      });

      // Initialise List.js une fois le tableau rempli
      if (listeFournisseurs) {
        listeFournisseurs.reIndex();
      } else {
        listeFournisseurs = new List('alertFourn', {
          valueNames: ['nom', 'score', 'statut'],
          page: 5,
          pagination: true
        });
      }

      // Attache le clic sur les boutons "Évaluer"
      $('.btn-evaluer-fournisseur').off('click').on('click', function() {
        const id = $(this).data('fournisseur-id');
        const nom = $(this).data('fournisseur-nom');
        ouvrirModalEvaluation(id, nom);
      });

      // Mise à jour compteur alerte
      $('#nbFournisseursRisque').text(data.length);
    },
    error: function() {
      alert('Erreur lors du chargement des fournisseurs.');
    }
  });
}

function ouvrirModalEvaluation(idFournisseur, nomFournisseur) {
  $('#modalEvaluation .modal-title').text(`Évaluer le fournisseur : ${nomFournisseur}`);
  $('#modalEvaluation input[name="id_fournisseur"]').val(idFournisseur);
  $('#modalEvaluation').modal('show');
}

$(document).ready(function() {
  chargerAlertFourn();

  // Optionnel : gérer bouton "Voir" pour afficher/masquer tableau si besoin
  $('#btnVoirRisque').on('click', function() {
    $('#containerRisque').toggle();
    $(this).text($('#containerRisque').is(':visible') ? 'Cacher' : 'Voir');
  });
});



</script>
</tbody>
                       
                    
                </div>
                </div>
            </div>
        </div>

</div>