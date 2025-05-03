<div class="modal modal-dialog-scrollable fade modal-lg" id="ficheFournisseur" tabindex="-1" aria-labelledby="ficheFournisseur" aria-hidden="true">
<div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
         <!-- Fil d'Ariane -->
        <nav aria-label="breadcrumb" class="mb-3">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fas fa-users me-1"></i>Fournisseurs</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-building me-1"></i>Société Alpha</li>
          </ol>
        </nav>

      </div>
      <div class="modal-body">
        <!-- Onglets -->
        <ul class="nav nav-tabs" id="fournisseurTabs" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link active" id="infos-tab" data-bs-toggle="tab" data-bs-target="#infos" type="button" role="tab">Informations</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="evaluations-tab" data-bs-toggle="tab" data-bs-target="#evaluations" type="button" role="tab">Évaluations</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="documents-tab" data-bs-toggle="tab" data-bs-target="#documents" type="button" role="tab">Documents</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="historique-tab" data-bs-toggle="tab" data-bs-target="#historique" type="button" role="tab">Historique</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="conformite-tab" data-bs-toggle="tab" data-bs-target="#conformite" type="button" role="tab">Conformité</button>
          </li>
        </ul>
       <div class="container-fluid">
       <div class="tab-content mt-3">
          <!-- Onglet Informations générales -->
          <div class="tab-pane fade show active" id="infos" role="tabpanel" aria-labelledby="infos-tab">
            <div class="row">
              <div class="col-md-6">
                 <!-- div 1 : Informations de base -->
              <div class="mt-4">
                <h5><i class="fas fa-id-badge me-2 text-secondary"></i>Informations de base</h5>
                <dl class="row">
                  <dt class="col-sm-4"><i class="fas fa-building me-1 text-muted"></i>Nom du fournisseur</dt>
                  <dd class="col-sm-8 fw-semibold">Société Alpha SARL</dd>

                  <dt class="col-sm-4"><i class="fas fa-tag me-1 text-muted"></i>Nom commercial</dt>
                  <dd class="col-sm-8">Alpha Logistique</dd>

                  <dt class="col-sm-4"><i class="fas fa-file-invoice me-1 text-muted"></i>Numéro d'identification fiscale</dt>
                  <dd class="col-sm-8"><span class="badge bg-info">NIF: 123456789</span> <span class="badge bg-info ms-1">TVA: 987654321</span></dd>

                  <dt class="col-sm-4"><i class="fas fa-balance-scale me-1 text-muted"></i>Statut juridique</dt>
                  <dd class="col-sm-8">SARL</dd>

                  <dt class="col-sm-4"><i class="fas fa-map-marker-alt me-1 text-muted"></i>Adresse du siège social</dt>
                  <dd class="col-sm-8">12 rue de la Logistique, 75000 Kibwe, Goma</dd>

                  <dt class="col-sm-4"><i class="fas fa-file-invoice-dollar me-1 text-muted"></i>Adresse de facturation</dt>
                  <dd class="col-sm-8">B.P. 123, Goma</dd>

                  <dt class="col-sm-4"><i class="fas fa-truck me-1 text-muted"></i>Adresse de livraison</dt>
                  <dd class="col-sm-8">Entrepôt Nord, Ndosho, Goma</dd>

                  <dt class="col-sm-4"><i class="fas fa-globe me-1 text-muted"></i>Site web</dt>
                  <dd class="col-sm-8"><a href="https://www.societealpha.com" target="_blank" rel="noopener">www.societealpha.com <i class="fas fa-external-link-alt ms-1 fs--2"></i></a></dd>
                </dl>
              </div>
              </div>
              <div class="col-md-6">
                 <!-- div 3 : Informations financières -->
             <div class="mt-4">
              <h5><i class="fas fa-wallet me-2 text-secondary"></i>Informations financières</h5>
              <dl class="row">
                <dt class="col-sm-4"><i class="fas fa-university me-1 text-muted"></i>RIB / IBAN</dt>
                <dd class="col-sm-8">CD55 0012 0345 6789 0123 45</dd>

                <dt class="col-sm-4"><i class="fas fa-clock me-1 text-muted"></i>Conditions de paiement</dt>
                <dd class="col-sm-8">30 jours fin de mois</dd>

                <dt class="col-sm-4"><i class="fas fa-coins me-1 text-muted"></i>Devise</dt>
                <dd class="col-sm-8">USD</dd>

                <dt class="col-sm-4"><i class="fas fa-chart-line me-1 text-muted"></i>Informations de crédit</dt>
                <dd class="col-sm-8"><span class="badge bg-success">Solvable</span></dd>
              </dl>
              </div>
              </div>
            </div>
            <!-- div 2 : Informations de contact -->
            <div class="mt-4">
              <h5><i class="fas fa-address-book me-2 text-secondary"></i>Informations de contact</h5>
              <table class="table table-bordered table-striped align-middle">
                <thead class="table-light">
                  <tr>
                    <th><i class="fas fa-user-tag me-1"></i>Type de contact</th>
                    <th><i class="fas fa-user me-1"></i>Nom & Titre</th>
                    <th><i class="fas fa-phone me-1"></i>Téléphone</th>
                    <th><i class="fas fa-envelope me-1"></i>Email</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><span class="badge bg-primary">Principal</span></td>
                    <td>Jean Dupont, Directeur</td>
                    <td><a href="tel:+243999999999" class="text-decoration-none">+243 999 999 999</a></td>
                    <td><a href="mailto:jean.dupont@societealpha.com">jean.dupont@societealpha.com</a></td>
                  </tr>
                  <tr>
                    <td><span class="badge bg-success">Facturation</span></td>
                    <td>Marie Curie, Comptable</td>
                    <td><a href="tel:+243998888777" class="text-decoration-none">+243 998 888 777</a></td>
                    <td><a href="mailto:facturation@societealpha.com">facturation@societealpha.com</a></td>
                  </tr>
                  <tr>
                    <td><span class="badge bg-warning text-dark">Technique</span></td>
                    <td>Paul kabeza, Responsable Technique</td>
                    <td><a href="tel:+243997777666" class="text-decoration-none">+243 997 777 666</a></td>
                    <td><a href="mailto:technique@societealpha.com">technique@societealpha.com</a></td>
                  </tr>
                  <tr>
                    <td><i class="fas fa-phone-alt"></i> Téléphone général</td>
                    <td colspan="3"><a href="tel:+243999999999" class="text-decoration-none fw-semibold">+243 999 999 999</a></td>
                  </tr>
                </tbody>
              </table>
            </div>

           

             <div class="row">
            <!-- div 4 : Produits / Services -->
              <div class="col-md-6">
                <div class="mt-4">
                  <h5><i class="fas fa-boxes me-2 text-secondary"></i>Produits / Services</h5>
                  <ul class="list-unstyled ps-3">
                    <li><i class="fas fa-check-circle text-success me-2"></i>Matériel logistique</li>
                    <li><i class="fas fa-check-circle text-success me-2"></i>Transport</li>
                    <li><i class="fas fa-check-circle text-success me-2"></i>Services de maintenance</li>
                    <li><i class="fas fa-check-circle text-success me-2"></i>Fournitures diverses</li>
                  </ul>
                  <p><strong>Description :</strong> Fourniture et maintenance de matériel logistique, transport national et international, services techniques associés.</p>
                  <p><strong>Tarifs :</strong> Sur demande ou via catalogue dédié.</p>
                  <p><strong>Délai de livraison standard :</strong> 5 à 7 jours ouvrés selon disponibilité.</p>
                  <p><strong>Conditions de garantie :</strong> Garantie standard de 12 mois sur matériel, conditions spécifiques selon contrat.</p>
                </div>
              </div>
              <!-- div 5 : Informations contractuelles -->
              <div class="col-md-6">
                <div class="mt-4">
                  <h5><i class="fas fa-file-contract me-2 text-secondary"></i>Informations contractuelles</h5>
                  <dl class="row">
                    <dt class="col-sm-4"><i class="fas fa-calendar-alt me-1 text-muted"></i>Date de début de la relation</dt>
                    <dd class="col-sm-8">15 Janvier 2020</dd>

                    <dt class="col-sm-4"><i class="fas fa-calendar-times me-1 text-muted"></i>Date de fin de contrat</dt>
                    <dd class="col-sm-8">15 Janvier 2025</dd>

                    <dt class="col-sm-4"><i class="fas fa-file-alt me-1 text-muted"></i>Conditions générales de vente</dt>
                    <dd class="col-sm-8"><a href="#" target="_blank" rel="noopener">Voir CGV <i class="fas fa-external-link-alt ms-1 fs--2"></i></a></dd>

                    <dt class="col-sm-4"><i class="fas fa-hashtag me-1 text-muted"></i>Référence contrat</dt>
                    <dd class="col-sm-8">CONTRAT-2020-ALPHA-001</dd>

                    <dt class="col-sm-4"><i class="fas fa-file-download me-1 text-muted"></i>Documents contractuels</dt>
                    <dd class="col-sm-8">
                      <ul class="list-unstyled mb-0">
                        <li><a href="#" target="_blank" rel="noopener"><i class="fas fa-file-pdf text-danger me-1"></i>Contrat cadre 2020</a></li>
                        <li><a href="#" target="_blank" rel="noopener"><i class="fas fa-file-alt text-secondary me-1"></i>Annexes contractuelles</a></li>
                      </ul>
                    </dd>
                  </dl>
                </div>
              </div>
             </div>
            <!-- div 6 : Performance -->
            <div class="mt-4">
              <h5><i class="fas fa-tachometer-alt me-2 text-secondary"></i>Performance</h5>
              <div class="row text-center">
                <div class="col-md-3">
                  <h3 class="text-success"><i class="fas fa-check-circle me-1"></i>95%</h3>
                  <p>Qualité des produits/services</p>
                </div>
                <div class="col-md-3">
                  <h3 class="text-warning"><i class="fas fa-clock me-1"></i>90%</h3>
                  <p>Respect des délais</p>
                </div>
                <div class="col-md-3">
                  <h3 class="text-info"><i class="fas fa-bolt me-1"></i>92%</h3>
                  <p>Réactivité</p>
                </div>
                <div class="col-md-3">
                  <h3 class="text-primary"><i class="fas fa-smile me-1"></i>88%</h3>
                  <p>Satisfaction client</p>
                </div>
              </div>
              <h6 class="mt-3">Notes internes</h6>
              <p>Fournisseur fiable avec un bon respect des délais. Quelques retards signalés en février 2025.</p>
            </div>

            <!-- div 7 : Autres informations -->
            <div class="mt-4">
              <h5><i class="fas fa-info me-2 text-secondary"></i>Autres informations</h5>
              <ul>
                <li><i class="fas fa-certificate text-success me-1"></i>Certifications : ISO 9001 (valide jusqu'en 2026), Certificat environnemental</li>
                <li><i class="fas fa-sticky-note text-warning me-1"></i>Remarques : Partenaire stratégique pour les opérations en RDC. Forte capacité d’adaptation.</li>
                <li><i class="fas fa-clock text-muted me-1"></i>Date de dernière mise à jour : 01 Avril 2025</li>
              </ul>
            </div>
          </div>


          <!-- Onglet Évaluations -->
          <div class="tab-pane fade" id="evaluations" role="tabpanel" aria-labelledby="evaluations-tab">
            <div class="row">
              <div class="col-md-6">
              <div class="mb-3 text-center">
              <div id="evaluationChart" style="width:100%;max-width:600px;height:400px;margin:auto;"></div>
            </div>
              </div>
              <div class="col-md-6">
                <div class="mt-4">
              <h6>Critères d'évaluation</h6>
              <table class="table table-bordered table-sm">
                <thead>
                  <tr>
                    <th>Critère</th>
                    <th>Score</th>
                    <th>Commentaire</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Qualité</td>
                    <td>95%</td>
                    <td>Très bonne qualité constante</td>
                  </tr>
                  <tr>
                    <td>Délais</td>
                    <td>90%</td>
                    <td>Respect des délais sauf en février 2025</td>
                  </tr>
                  <tr>
                    <td>Service</td>
                    <td>92%</td>
                    <td>Bon service client</td>
                  </tr>
                  <tr>
                    <td>Conformité</td>
                    <td>88%</td>
                    <td>Certifications à jour</td>
                  </tr>
                  <tr>
                    <td>Communication</td>
                    <td>85%</td>
                    <td>Amélioration possible sur le suivi</td>
                  </tr>
                </tbody>
              </table>
              <button class="btn btn-success btn-sm mb-2">Ajouter / Modifier une évaluation</button>
            </div>
              </div>
            </div>
            
            <div class="row justify-content-center ">
              <div class="col-md-10">
                <h6>Historique des évaluations</h6>
                <ul class="list-group">
                  <li class="list-group-item">10/04/2025 - Score global 92% - <span class="text-success">Validé</span></li>
                  <li class="list-group-item">15/01/2024 - Score global 89% - <span class="text-success">Validé</span></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- Onglet Documents -->
          <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab">
            <div class="mb-3">
              <h6>Liste des documents</h6>
              <ul class="list-group mb-2">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  Contrat cadre 2024
                  <span>
                    <span class="badge bg-success me-2" title="Valide jusqu'au 31/12/2024">Valide</span>
                    <a href="#" class="btn btn-sm btn-outline-primary"><i class="fas fa-download"></i></a>
                  </span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  Certificat ISO 9001
                  <span>
                    <span class="badge bg-warning text-dark me-2" title="Expire bientôt">Expire bientôt</span>
                    <a href="#" class="btn btn-sm btn-outline-primary"><i class="fas fa-download"></i></a>
                  </span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  Questionnaire fournisseur
                  <span>
                    <span class="badge bg-danger me-2" title="Expiré">Expiré</span>
                    <a href="#" class="btn btn-sm btn-outline-primary"><i class="fas fa-download"></i></a>
                  </span>
                </li>
              </ul>
              <form class="d-flex align-items-center gap-2">
                <input type="file" class="form-control form-control-sm" />
                <button class="btn btn-primary btn-sm" type="submit"><i class="fas fa-upload me-1"></i>Ajouter</button>
              </form>
            </div>
          </div>
          <!-- Onglet Historique -->
          <div class="tab-pane fade" id="historique" role="tabpanel" aria-labelledby="historique-tab">
            <h6>Journal d'activité</h6>
            <div class="table-responsive">
              <table class="table table-bordered table-striped table-sm">
                <thead>
                  <tr>
                    <th>Date/Heure</th>
                    <th>Utilisateur</th>
                    <th>Action</th>
                    <th>Objet</th>
                    <th>Détail</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>24/04/2025 09:15</td>
                    <td>Marie Laurent</td>
                    <td><span class="text-success"><i class="fas fa-plus-circle"></i> Ajout</span></td>
                    <td>Contrat fournisseur</td>
                    <td><a href="#"><i class="fas fa-file-alt me-1"></i>Voir le document</a></td>
                  </tr>
                  <tr>
                    <td>23/04/2025 17:40</td>
                    <td>Ali Ben Said</td>
                    <td><span class="text-primary"><i class="fas fa-check-circle"></i> Validation</span></td>
                    <td>Commande CMD-20250415-001</td>
                    <td><i class="fas fa-truck me-1"></i>Statut passé à "Livrée"</td>
                  </tr>
                  <tr>
                    <td>20/02/2025 13:30</td>
                    <td>Jean Kalume</td>
                    <td><span class="text-danger"><i class="fas fa-exclamation-triangle"></i> Incident</span></td>
                    <td>Livraison</td>
                    <td><i class="fas fa-box-open me-1"></i>Marchandise endommagée</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <button class="btn btn-outline-primary btn-sm mt-2"><i class="fas fa-file-export me-1"></i>Exporter l'historique</button>
          </div>
          <!-- Onglet Conformité -->
          <div class="tab-pane fade" id="conformite" role="tabpanel" aria-labelledby="conformite-tab">
            <h6>Conformité et code de conduite</h6>
            <ul>
              <li>Code de bonne conduite signé : <span class="badge bg-success">Oui</span></li>
              <li>Questionnaire fournisseur (Annexe 10) : <a href="#" class="btn btn-sm btn-outline-primary">Voir / Remplir</a></li>
              <li>Certifications à jour : <span class="badge bg-success">Oui</span></li>
              <li>Dernier audit conformité : 10/04/2025</li>
            </ul>
            <a href="#" class="btn btn-outline-secondary btn-sm"><i class="fas fa-book me-1"></i>Consulter le code de conduite</a>
          </div>
        </div>
       </div>
      </div>
      <div class="modal-footer">
        <span class="me-auto text-muted">Connecté en tant que <strong>Responsable Achats</strong></span>
        <button class="btn btn-outline-secondary" data-bs-dismiss="modal">Fermer</button>
        <button class="btn btn-primary">Modifier</button>
        <button class="btn btn-success">Ajouter évaluation</button>
        <button class="btn btn-warning">Signaler incident</button>
        <button class="btn btn-outline-info">Exporter fiche</button>
      </div>
    </div>
  </div>
</div>
