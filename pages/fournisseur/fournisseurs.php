<div class="content">
     <!-- content nav -->
     <?php include_once "./content_nav.php" ?>
     <!-- Alertes dynamiques Bootstrap -->
     <div id="alertContainer" class="mt-2"></div>
<!-- Modal -->
    <?php include_once "add_fourn.php"; ?>
    <?php include_once "fiche_fourn.php" ?>
    <?php include_once "historique_fourn.php" ?>
    <?php include_once "modal_evalu.php"; ?>
    <?php include_once "docFourn.php"; ?>

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
                        <div class="col-lg-8">
                        <h5 class="mt-3">Gestion des Fournisseurs</h5>
                        </div>
                    </div>
                    </div>
                </div>
                </div>
            </div>
       <div class="row">
        <div class="col-md-12">
             <!-- Exemple d'alerte critique -->
        <div class="alert alert-danger mt-2 d-flex align-items-center" role="alert">
                    <span class="fas fa-exclamation-triangle me-2"></span>
                    Évaluation urgente à faire pour 2 fournisseurs à risque élevé !
                    <a href="#" class="btn btn-sm btn-outline-danger ms-auto">Voir</a>
        </div>
        </div>
       </div>
        <!-- table -->
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
</script>
        <div class="row">
            <div class="col-12 col-lg-12 col-xl-12">
                <div class="card mb-4">
                <div class="card-body">
                    <div id="tableFournisseurs" data-list='{"valueNames":["nom","type","statut","contact","score","risque"],"page":5,"pagination":true}'>
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
                            <!-- Les lignes seront générées dynamiquement -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>
<script>
 let fournisseurList;

function chargerFournisseurs() {
  $.ajax({
    url: 'http://localhost:3000/fournisseurs',
    
    method: 'GET',
    dataType: 'json',
    success: function(fournisseurs) {
      if (fournisseurList) {
        fournisseurList.clear();
      }

      const items = fournisseurs.map(f => {
        let statutClass = 'bg-secondary';
        if (f.statut) {
          const s = f.statut.toLowerCase();
          if (s === 'actif') statutClass = 'bg-success';
          else if (s === 'suspendu') statutClass = 'bg-danger';
          else if (s === 'en attente') statutClass = 'bg-warning text-dark';
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
          statut: `<span class="badge ${statutClass}">${f.statut || ''}</span>`,
          contact: f.nom_contact_principal || contactsText,
          score: (typeof f.score === 'number') ? f.score.toFixed(2) : '-',
          risque: `<span class="badge ${risqueClass}">${risqueText}</span>`,
          actions: `
           <a 
              data-bs-toggle="modal"  
              data-fournisseur-id="${f.id || ''}" 
              data-fournisseur-nom="${(f.nom || '').replace(/\"/g, '&quot;')}"  
              data-bs-target="#ficheFournisseur" 
              class="btn btn-sm btn-info btn-fiche-fournisseur" 
              title="Voir fiche">
              <span class="fa fa-eye"></span>
            </a>

            <button class="btn btn-sm btn-warning btn-evaluer-fournisseur" 
            data-fournisseur-id="${f.id || ''}" 
            data-fournisseur-nom="${f.nom ? f.nom.replace(/\"/g, '&quot;') : ''}"
            title="Évaluer">
            <span class="fa fa-star"></span>
            </button>
            <a data-bs-toggle="modal" class="btn btn-sm btn-secondary" data-bs-target="#HistoFournisseur" title="Historique"><span class="fa fa-history"></span></a>
            <a 
                class="btn btn-sm btn-dark btn-docs-fournisseur" 
                data-fournisseur-id="${f.id || ''}" 
                data-fournisseur-nom="${(f.nom || '').replace(/\"/g, '&quot;')}" 
                data-bs-toggle="modal"
                data-bs-target="#modalDocsFournisseur"
                title="Documents">
                <span class="fa fa-file-alt"></span>
              </a>          `
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

      if (typeof fournisseurList.page === 'function') {
        fournisseurList.page(1);
      }
    },
    error: function() {
      // Si tu as une fonction showAlert, sinon utilise alert()
      if (typeof showAlert === 'function') {
        showAlert('Erreur lors du chargement des fournisseurs', 'danger');
      } else {
        alert('Erreur lors du chargement des fournisseurs');
      }
    }
  });
}

$(document).ready(() => {
  chargerFournisseurs();
});

$(document).on('fournisseurAjoute', () => {
  chargerFournisseurs();
});

</script>
</tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-center mt-3">
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