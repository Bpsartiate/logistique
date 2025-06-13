<div class="modal modal-dialog-scrollable fade modal-lg" id="HistoFournisseur" tabindex="-1" aria-labelledby="HistoFournisseur" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">
            <!-- modal header -->
            <div class="modal-header inline-flex ">
                <h5 class="mb-0">Historique Fournisseur: Société Alpha</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!-- modal body -->
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div id="tableHistorique" data-list='{"valueNames":["dateheure","utilisateur","role","action","objet","detail","commentaire"],"page":3,"pagination":true}'>
                                <div class="row align-items-center g-2 mb-3">
                                    <div class="col-md-3">
                                    <!-- Filtre par action -->
                                    <select class="form-select form-select-sm" id="filtreAction" onchange="filtrerAction()">
                                        <option value="">Toutes les actions</option>
                                        <option value="Ajout">Ajout</option>
                                        <option value="Modification">Modification</option>
                                        <option value="Validation">Validation</option>
                                        <option value="Suppression">Suppression</option>
                                        <option value="Incident">Incident</option>
                                        <option value="Téléchargement">Téléchargement</option>
                                    </select>
                                    </div>
                                    <div class="col-md-5">
                                    <form>
                                        <div class="input-group">
                                        <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Recherche une activité..." aria-label="Recherche" />
                                        <div class="input-group-text bg-transparent"><span class="fa fa-search fs--1 text-600"></span></div>
                                        </div>
                                    </form>
                                    </div>
                                    <div class="col-md-4 text-end">
                                    <button class="btn btn-sm btn-outline-primary" onclick="exportHistorique()">
                                        <i class="fas fa-file-export me-1"></i>Exporter l'historique
                                    </button>
                                    </div>
                                </div>
                                <div class="table-responsive scrollbar">
                                    <table class="table table-bordered table-striped fs--1 mb-0">
                                    <thead class="bg-200 text-900">
                                        <tr>
                                        <th class="sort" data-sort="dateheure">Date/Heure</th>
                                        <th class="sort" data-sort="utilisateur">Utilisateur</th>
                                        <th class="sort" data-sort="role">Rôle</th>
                                        <th class="sort" data-sort="action">Action</th>
                                        <th class="sort" data-sort="objet">Objet</th>
                                        <th class="sort" data-sort="detail">Détail</th>
                                        <th class="sort" data-sort="commentaire">Commentaire/Justification</th>
                                        </tr>
                                    </thead>
                                    <tbody class="list">
                                        <tr>
                                        <td class="dateheure">24/04/2025 09:15</td>
                                        <td class="utilisateur">Marie Laurent</td>
                                        <td class="role"><span class="badge bg-info">Gestionnaire</span></td>
                                        <td class="action">
                                            <span class="text-success" title="Ajout"><i class="fas fa-plus-circle"></i></span> Ajout
                                        </td>
                                        <td class="objet"><a href="#">Contrat fournisseur</a></td>
                                        <td class="detail"><a href="#"><i class="fas fa-file-alt me-1"></i>Voir le document</a></td>
                                        <td class="commentaire">Ajout du contrat cadre 2025</td>
                                        </tr>
                                        <tr>
                                        <td class="dateheure">23/04/2025 17:40</td>
                                        <td class="utilisateur">Ali Ben Said</td>
                                        <td class="role"><span class="badge bg-secondary">Responsable achats</span></td>
                                        <td class="action">
                                            <span class="text-primary" title="Validation"><i class="fas fa-check-circle"></i></span> Validation
                                        </td>
                                        <td class="objet"><a href="#">Commande CMD-20250415-001</a></td>
                                        <td class="detail"><i class="fas fa-truck me-1"></i>Statut passé à <span class="badge bg-success">Livrée</span></td>
                                        <td class="commentaire">Livraison validée sans réserve</td>
                                        </tr>
                                        <tr>
                                        <td class="dateheure">22/04/2025 16:20</td>
                                        <td class="utilisateur">Sarah N’Diaye</td>
                                        <td class="role"><span class="badge bg-warning text-dark">Admin</span></td>
                                        <td class="action">
                                            <span class="text-warning" title="Modification"><i class="fas fa-edit"></i></span> Modification
                                        </td>
                                        <td class="objet"><a href="#">Fournisseur : Société Alpha</a></td>
                                        <td class="detail">
                                            <span class="text-muted small">Adresse :<br>
                                            <b>Avant :</b> 12 rue A<br>
                                            <b>Après :</b> 45 avenue B
                                            </span>
                                        </td>
                                        <td class="commentaire">Changement suite à déménagement</td>
                                        </tr>
                                        <tr>
                                        <td class="dateheure">21/04/2025 15:00</td>
                                        <td class="utilisateur">Jean Kalume</td>
                                        <td class="role"><span class="badge bg-danger">Logistique</span></td>
                                        <td class="action">
                                            <span class="text-danger" title="Incident"><i class="fas fa-exclamation-triangle"></i></span> Incident
                                        </td>
                                        <td class="objet">Livraison</td>
                                        <td class="detail"><i class="fas fa-box-open me-1"></i>Marchandise endommagée</td>
                                        <td class="commentaire">Palette abîmée lors du transport</td>
                                        </tr>
                                        <tr>
                                        <td class="dateheure">20/04/2025 12:00</td>
                                        <td class="utilisateur">Marie Laurent</td>
                                        <td class="role"><span class="badge bg-info">Gestionnaire</span></td>
                                        <td class="action">
                                            <span class="text-danger" title="Suppression"><i class="fas fa-trash-alt"></i></span> Suppression
                                        </td>
                                        <td class="objet">Facture FAC-20250417-003</td>
                                        <td class="detail">Suppression d'une facture erronée</td>
                                        <td class="commentaire">Erreur de saisie détectée</td>
                                        </tr>
                                        <tr>
                                        <td class="dateheure">19/04/2025 10:00</td>
                                        <td class="utilisateur">Ali Ben Said</td>
                                        <td class="role"><span class="badge bg-secondary">Responsable achats</span></td>
                                        <td class="action">
                                            <span class="text-info" title="Téléchargement"><i class="fas fa-download"></i></span> Téléchargement
                                        </td>
                                        <td class="objet"><a href="#">Rapport d'audit</a></td>
                                        <td class="detail"><i class="fas fa-file-alt me-1"></i>Export PDF</td>
                                        <td class="commentaire">Pour transmission au bailleur</td>
                                        </tr>
                                        <!-- ... -->
                                    </tbody>
                                    </table>
                                </div>
                                <div class="d-flex justify-content-center mt-3">
                                    <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Précédent" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                                    <ul class="pagination mb-0"></ul>
                                    <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Suivant" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                
                </div>
            </div>
    </div>
</div>

<div class="modal fade" id="deleteFournisseur">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSupplierModalLabel">Supprimer Bésoin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="./pages/approvisionnement_process/delete_approvisionnement.php" method = "POST">
                    <input type="hidden" name = "delete_id" id = "delete_id">
                    Etes-vous sûr de vouloir supprimer ce besoin ?
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                    <button type="submit" name = "supprimer" id = "modifier" class="btn btn-danger">Supprimer</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
function exportHistorique() {
  const rows = document.querySelectorAll('#tableHistorique tbody tr');
  let csvContent = "Date/Heure,Utilisateur,Rôle,Action,Objet,Détail,Commentaire/Justification\n";
  rows.forEach(row => {
    const cols = row.querySelectorAll('td');
    const rowData = Array.from(cols).map(td => td.innerText.replace(/,/g, ';')).join(',');
    csvContent += rowData + "\n";
  });
  const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
  const link = document.createElement("a");
  link.href = URL.createObjectURL(blob);
  link.download = "historique.csv";
  link.click();
}

// Filtrage par action
function filtrerAction() {
  const filtre = document.getElementById('filtreAction').value.toLowerCase();
  const rows = document.querySelectorAll('#tableHistorique tbody tr');
  rows.forEach(row => {
    const action = row.querySelector('.action').innerText.toLowerCase();
    row.style.display = (filtre === "" || action.includes(filtre)) ? "" : "none";
  });
}
</script>