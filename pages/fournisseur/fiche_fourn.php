<style>
  
</style>
<div id="app">
  <div class="modal fade" id="ficheFournisseur" tabindex="-1" aria-labelledby="ficheFournisseurLabel" aria-hidden="true" ref="modal" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <nav aria-label="breadcrumb" class="mb-3 w-100">
            <ol class="breadcrumb mb-0">
              <li class="breadcrumb-item"><a href="#"><i class="fas fa-users me-1"></i>Fournisseurs</a></li>
              <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-building me-1"></i> {{ fournisseurCopy.nom || '-' }}</li>
            </ol>
          </nav>
          <button type="button" class="btn-close" @click="fermerModal"></button>
        </div>
        
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                 <!-- Alerte globale -->
          <div v-if="alertVisible" :class="['alert', alertClass, 'alert-dismissible', 'fade', 'show']" role="alert"
              style="position: fixed; top: 1rem; right: 1rem; z-index: 2000; min-width: 280px; box-shadow: 0 2px 8px rgba(0,0,0,0.2);">
            {{ alertMessage }}
            <button type="button" class="btn-close" @click="alertVisible = false" aria-label="Close"></button>
          </div>
          <!-- Onglets -->
          <ul class="nav nav-tabs" id="fournisseurTabs" role="tablist">
            <li class="nav-item" role="presentation">
              <button class="nav-link active" id="infos-tab" data-bs-toggle="tab" data-bs-target="#infos" type="button" role="tab" aria-controls="infos" aria-selected="true">Informations</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="evaluations-tab" data-bs-toggle="tab" data-bs-target="#evaluations" type="button" role="tab" aria-controls="evaluations" aria-selected="false">Évaluations</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="documents-tab" data-bs-toggle="tab" data-bs-target="#documents" type="button" role="tab" aria-controls="documents" aria-selected="false">Documents</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="historique-tab" data-bs-toggle="tab" data-bs-target="#historique" type="button" role="tab" aria-controls="historique" aria-selected="false">Historique</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="conformite-tab" data-bs-toggle="tab" data-bs-target="#conformite" type="button" role="tab" aria-controls="conformite" aria-selected="false">Conformité</button>
            </li>
          </ul>
          
          <div class="tab-content mt-3">
            <!-- Onglet Informations -->
            <div class="tab-pane fade show active" id="infos" role="tabpanel" aria-labelledby="infos-tab">

              <!-- Informations de base -->
              <h5><i class="fas fa-id-badge me-2 text-secondary"></i>Informations de base</h5>
              <dl class="row">
                <dt class="col-sm-4">Nom du fournisseur</dt>
                <dd class="col-sm-8 fw-semibold">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.nom }}</template>
                  <template v-else><input type="text" v-model="fournisseur.nom" class="form-control" id="nomFournisseur" /></template>
                </dd>

                <dt class="col-sm-4">Nom commercial</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.nom_commercial }}</template>
                  <template v-else><input type="text" v-model="fournisseur.nom_commercial" class="form-control" id="nomCommercial" /></template>
                </dd>

                <dt class="col-sm-4">Numéro d'identification fiscale</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">
                    <span class="badge bg-info">NIF: <span id="nif">{{ fournisseurCopy.nif || '-' }}</span></span>
                    <span class="badge bg-info ms-1">TVA: <span id="tva">{{ fournisseurCopy.tva || '-' }}</span></span>
                  </template>
                  <template v-else>
                    <div class="mb-1">
                      <label for="nifInput">NIF</label>
                      <input id="nifInput" type="text" v-model="fournisseur.nif" class="form-control" />
                    </div>
                    <div>
                      <label for="tvaInput">TVA</label>
                      <input id="tvaInput" type="text" v-model="fournisseur.tva" class="form-control" />
                    </div>
                  </template>
                </dd>

                <dt class="col-sm-4">Statut juridique</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.statut_juridique }}</template>
                  <template v-else><input type="text" v-model="fournisseur.statut_juridique" class="form-control" id="statutJuridique" /></template>
                </dd>

                <dt class="col-sm-4">Adresse du siège social</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.adresse_siege }}</template>
                  <template v-else><input type="text" v-model="fournisseur.adresse_siege" class="form-control" id="adresseSiege" /></template>
                </dd>

                <dt class="col-sm-4">Adresse de facturation</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.adresse_facturation }}</template>
                  <template v-else><input type="text" v-model="fournisseur.adresse_facturation" class="form-control" id="adresseFacturation" /></template>
                </dd>

                <dt class="col-sm-4">Adresse de livraison</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.adresse_livraison }}</template>
                  <template v-else><input type="text" v-model="fournisseur.adresse_livraison" class="form-control" id="adresseLivraison" /></template>
                </dd>

                <dt class="col-sm-4">Site web</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">
                    <a :href="fournisseurCopy.site_web" target="_blank" rel="noopener" v-if="fournisseurCopy.site_web">{{ fournisseurCopy.site_web }}</a>
                    <span v-else>-</span>
                  </template>
                  <template v-else><input type="url" v-model="fournisseur.site_web" class="form-control" id="siteWeb" /></template>
                </dd>
              </dl>

              <!-- Informations financières -->
              <h5 class="mt-4"><i class="fas fa-wallet me-2 text-secondary"></i>Informations financières</h5>
              <dl class="row">
                <dt class="col-sm-4">RIB / IBAN</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.rib_iban }}</template>
                  <template v-else><input type="text" v-model="fournisseur.rib_iban" class="form-control" id="rib" /></template>
                </dd>

                <dt class="col-sm-4">Nom de la Banque</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.banque }}</template>
                  <template v-else><input type="text" v-model="fournisseur.banque" class="form-control" id="nomBanque" /></template>
                </dd>

                <dt class="col-sm-4">Adresse de la Banque</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.adresse_banque }}</template>
                  <template v-else><input type="text" v-model="fournisseur.adresse_banque" class="form-control" id="adresseBanque" /></template>
                </dd>

                <dt class="col-sm-4">Conditions de paiement</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.conditions_paiement }}</template>
                  <template v-else><input type="text" v-model="fournisseur.conditions_paiement" class="form-control" id="conditionsPaiement" /></template>
                </dd>

                <dt class="col-sm-4">Devise</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">
                    <span class="badge bg-info text-uppercase">{{ fournisseurCopy.devise || '-' }}</span>
                  </template>
                  <template v-else><input type="text" v-model="fournisseur.devise" class="form-control text-uppercase" id="devise" /></template>
                </dd>

                <dt class="col-sm-4">Informations de crédit</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.credit_info }}</template>
                  <template v-else><input type="text" v-model="fournisseur.credit_info" class="form-control" id="infosCredit" /></template>
                </dd>
              </dl>

              <!-- Contacts -->
              <h5 class="mt-4"><i class="fas fa-address-book me-2 text-secondary"></i>Informations de contact</h5>
              <!-- Mode lecture : table -->
              <table v-if="!estEnEdition" class="table table-bordered table-striped align-middle" id="contactsTable">
                <thead class="table-light">
                  <tr>
                    <th>Type de contact</th>
                    <th>Nom & Titre</th>
                    <th>Téléphone</th>
                    <th>Email</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="contact in fournisseurCopy.contacts" :key="contact.id">
                    <td><span :class="badgeClassContact(contact.type_contact)">{{ contact.type_contact }}</span></td>
                    <td>{{ contact.nom }}</td>
                    <td><a :href="'tel:' + contact.telephone">{{ contact.telephone }}</a></td>
                    <td><a :href="'mailto:' + contact.email">{{ contact.email }}</a></td>
                  </tr>
                  <tr v-if="!fournisseurCopy.contacts || fournisseurCopy.contacts.length === 0">
                    <td colspan="4" class="text-center text-muted">Aucun contact</td>
                  </tr>
                </tbody>
              </table>

              <!-- Mode édition : formulaire avec lignes Bootstrap -->
              <div v-else>
                <div v-for="(contact, index) in contacts" :key="contact.id || index" class="row g-2 align-items-end contact-row mb-2">

                  <div class="col-md-3">
                    <select v-model="contacts[index].type_contact" class="form-select" name="type_contact[]">
                      <option value="principale">Principale</option>
                      <option value="facturation">Facturation</option>
                      <option value="technique">Technique</option>
                      <option value="">Autre</option>
                    </select>
                  </div>

                  <div class="col-md-6">
                    <input type="text" v-model="contacts[index].nom" class="form-control" name="nom_contact[]" placeholder="Nom du contact principal" required />
                    <div class="invalid-feedback">Le nom du contact principal est obligatoire.</div>
                  </div>

                  <div class="col-md-6">
                    <input type="text" v-model="contacts[index].telephone" class="form-control" name="telephone_contact[]" placeholder="Téléphone" />
                  </div>

                  <div class="col-md-4">
                    <input type="email" v-model="contacts[index].email" class="form-control" name="email_contact[]" placeholder="Email" />
                  </div>

                  <div class="col-md-1">
                    <button type="button" class="btn btn-danger btn-sm" @click="removeContact(index)" title="Supprimer ce contact">&times;</button>
                  </div>

                </div>

                <button type="button" class="btn btn-primary btn-sm mt-2" @click="addContact">Ajouter un contact</button>
              </div>
              <!-- Performance -->
              <h5 class="mt-4"><i class="fas fa-tachometer-alt me-2 text-secondary"></i>Performance</h5>
              <div class="row text-center">
                <div class="col-md-3">
                  <h3 class="text-success" v-html="iconePourcentage(fournisseurCopy.perf_qualite)"></h3>
                  <p>{{ fournisseurCopy.perf_qualite_txt || '-' }}</p>
                </div>
                <div class="col-md-3">
                  <h3 class="text-warning" v-html="iconePourcentage(fournisseurCopy.perf_delais)"></h3>
                  <p>{{ fournisseurCopy.perf_delais_txt || '-' }}</p>
                </div>
                <div class="col-md-3">
                  <h3 class="text-info" v-html="iconePourcentage(fournisseurCopy.perf_reactivite)"></h3>
                  <p>{{ fournisseurCopy.perf_reactivite_txt || '-' }}</p>
                </div>
                <div class="col-md-3">
                  <h3 class="text-primary" v-html="iconePourcentage(fournisseurCopy.perf_satisfaction)"></h3>
                  <p>{{ fournisseurCopy.perf_satisfaction_txt || '-' }}</p>
                </div>
              </div>

              <h6 class="mt-3">Notes internes</h6>
              <p>{{ fournisseurCopy.notes_internes || '-' }}</p>

              <!-- Produits / Services -->
              <h5 class="mt-4"><i class="fas fa-boxes me-2 text-secondary"></i>Produits / Services</h5>
              <ul class="list-unstyled ps-3" v-if="!estEnEdition">
                <li v-for="(p,i) in fournisseurCopy.produits_services" :key="i">
                  <i class="fas fa-check-circle text-success me-2"></i>{{ p.description }}
                </li>
              </ul>
              <textarea v-else v-model="produitsText" id="produitsList" rows="5" class="form-control"></textarea>

              <!-- Description -->
              <div class="mt-3">
                <strong>Description :</strong>
                <div v-if="!estEnEdition" v-html="fournisseurCopy.description" id="descriptionProduit"></div>
                <textarea v-else v-model="fournisseur.description" class="form-control" rows="3" id="descriptionProduit"></textarea>
              </div>

              <!-- Tarifs -->
              <div class="mt-3">
                <strong>Tarifs :</strong>
                <div v-if="!estEnEdition" v-html="fournisseurCopy.tarifs" id="tarifsProduit"></div>
                <textarea v-else v-model="fournisseur.tarifs" class="form-control" rows="3" id="tarifsProduit"></textarea>
              </div>

              <!-- Délai livraison -->
              <div class="mt-3">
                <strong>Délai de livraison standard :</strong>
                <div v-if="!estEnEdition">{{ fournisseurCopy.delai_livraison }}</div>
                <input v-else type="text" v-model="fournisseur.delai_livraison" class="form-control" id="delaiLivraison" />
              </div>

              <!-- Garantie -->
              <div class="mt-3">
                <strong>Conditions de garantie :</strong>
                <div v-if="!estEnEdition" v-html="fournisseurCopy.conditions_garantie" id="conditionsGarantie"></div>
                <textarea v-else v-model="fournisseur.conditions_garantie" class="form-control" rows="3" id="conditionsGarantie"></textarea>
              </div>

              <!-- Contractuelles -->
              <h5 class="mt-4"><i class="fas fa-file-contract me-2 text-secondary"></i>Informations contractuelles</h5>
              <dl class="row">
                <dt class="col-sm-4">Date de début de la relation</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ formatDateToMySQL(fournisseurCopy.date_debut_relation) }}</template>
                  <input v-else type="date" v-model="fournisseur.date_debut_relation" class="form-control" id="dateDebutRelation" />
                </dd>
                <dt class="col-sm-4">Date de fin de contrat</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ formatDateToMySQL(fournisseurCopy.date_fin_contrat) }}</template>
                  <input v-else type="date" v-model="fournisseur.date_fin_contrat" class="form-control" id="dateFinContrat" />
                </dd>
                <dt class="col-sm-4">Conditions générales de vente</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition" v-html="fournisseurCopy.conditions_generales_vente" id="cgv"></template>
                  <textarea v-else v-model="fournisseur.conditions_generales_vente" class="form-control" rows="3" id="cgv"></textarea>
                </dd>
                <dt class="col-sm-4">Référence contrat</dt>
                <dd class="col-sm-8">
                  <template v-if="!estEnEdition">{{ fournisseurCopy.reference_contrat }}</template>
                  <input v-else type="text" v-model="fournisseur.reference_contrat" class="form-control" id="refContrat" />
                </dd>
              </dl>

            </div>

            <!-- Onglet Évaluations -->
            <div class="tab-pane fade" id="evaluations" role="tabpanel" aria-labelledby="evaluations-tab">
              <button class="btn btn-success btn-sm mb-2" @click="ouvrirModalEvaluation">Ajouter / Modifier une évaluation</button>
          <div v-if="evaluations.length === 0" class="no-data">Aucune évaluation disponible.</div>
          <div v-for="eval in evaluations" :key="eval.id_evaluation" class="card evaluation-card mb-3">
            <div class="card-body d-flex justify-content-between align-items-center">
              <div>
                <h5 class="card-title mb-1">
                  <span class="badge bg-primary me-2">{{ eval.score_global.toFixed(1) }}</span>
                  Évaluation du {{ formatDateToMySQL(eval.date_evaluation) }}
                </h5>
                <p class="card-text mb-0 text-muted">{{ eval.commentaire || 'Sans commentaire' }}</p>
              </div>
              <div class="evaluation-details text-end">
                <div class="row">
                  <div class="col md-6">
                    <div class="row">
                      <small>Qualité: <span class="badge bg-success">{{ eval.qualite }}</span></small><br>
                    </div>
                    <div class="row">
                      <small>Délai: <span class="badge bg-info text-dark">{{ eval.delai }}</span></small><br>
                    </div>
                    <div class="row">
                      <small>Conformité: <span class="badge bg-warning text-dark">{{ eval.conformite }}</span></small>
                    </div>
                  </div>
                  <div class="col md-6">
                    <div class="row">
                      <small>Service client: <span class="badge bg-success">{{ eval.service }}</span></small><br>
                    </div>
                    <div class="row">
                      <small>Communication: <span class="badge bg-info text-dark">{{ eval.communication }}</span></small><br>
                    </div>
                    <div class="row">
                      <small>Coût: <span class="badge bg-warning text-dark">{{ eval.	cout }}</span></small>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
            </div>

            <!-- Onglet Documents -->
            <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab">
              <ul class="list-group">
                <li v-for="doc in documents" :key="doc.id" class="list-group-item d-flex justify-content-between align-items-center">
                  <a :href="doc.url_public" target="_blank" rel="noopener">{{ doc.nom_original }}</a>
                  <span :class="badgeClassForStatut(doc.statut_validite)" :title="doc.statut_validite">
                    {{ doc.statut_validite }}
                  <a v-if="doc.url_public" :href="doc.url_public" download class="btn btn-sm btn-outline-primary ms-2"><i class="fas fa-download"></i></a>
                  </span>
                </li>
                <li v-if="!documents.length" class="text-muted text-center">Aucun document</li>
              </ul>

            </div>

            <!-- Onglet Historique -->
            <div class="tab-pane fade" id="historique" role="tabpanel" aria-labelledby="historique-tab">
              <table class="table table-striped table-hover">
                <thead class="table-light">
                  <tr>
                    <th @click="sortBy('date_action')" style="cursor:pointer">
                      Date
                      <span v-if="sortKey==='date_action'">
                        <i :class="sortOrders.date_action > 0 ? 'fas fa-sort-up' : 'fas fa-sort-down'"></i>
                      </span>
                    </th>
                    <th @click="sortBy('action')" style="cursor:pointer">
                      Action
                      <span v-if="sortKey==='action'">
                        <i :class="sortOrders.action > 0 ? 'fas fa-sort-up' : 'fas fa-sort-down'"></i>
                      </span>
                    </th>
                    <th @click="sortBy('gravite')" style="cursor:pointer">
                      Gravité
                      <span v-if="sortKey==='gravite'">
                        <i :class="sortOrders.gravite > 0 ? 'fas fa-sort-up' : 'fas fa-sort-down'"></i>
                      </span>
                    </th>
                    <th @click="sortBy('utilisateur')" style="cursor:pointer">
                      Utilisateur
                      <span v-if="sortKey==='utilisateur'">
                        <i :class="sortOrders.utilisateur > 0 ? 'fas fa-sort-up' : 'fas fa-sort-down'"></i>
                      </span>
                    </th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in pagedHistorique" :key="item.id">
                    <td>{{ formatDateToMySQL(item.date_action) }}</td>
                    <td>{{ item.action }}</td>
                    <td><span :class="getGraviteClass(item.gravite)">{{ item.gravite || '-' }}</span></td>
                    <td>{{ item.utilisateur || '-' }}</td>
                    <td>{{ item.description }}</td>
                  </tr>
                  <tr v-if="historique.length === 0">
                    <td colspan="5" class="text-center text-muted">Aucune donnée historique</td>
                  </tr>
                </tbody>
              </table>

              <!-- Pagination -->
              <nav aria-label="Pagination historique" v-if="totalPages > 1">
                <ul class="pagination justify-content-center">
                  <li class="page-item" :class="{disabled: currentPage === 1}">
                    <button class="page-link" @click="changePage(currentPage - 1)" aria-label="Précédent">‹</button>
                  </li>
                  <li v-for="page in totalPages" :key="page" class="page-item" :class="{active: currentPage === page}">
                    <button class="page-link" @click="changePage(page)">{{ page }}</button>
                  </li>
                  <li class="page-item" :class="{disabled: currentPage === totalPages}">
                    <button class="page-link" @click="changePage(currentPage + 1)" aria-label="Suivant">›</button>
                  </li>
                </ul>
              </nav>

            </div>

            <!-- Onglet Conformité -->
            <div class="tab-pane fade" id="conformite" role="tabpanel" aria-labelledby="conformite-tab">
              <ul>
                <li><strong>Code de conduite :</strong> {{ fournisseurCopy.code_conduite || '—' }}</li>
                <li><strong>Questionnaire fournisseur :</strong> {{ fournisseurCopy.questionnaire_fournisseur || '—' }}</li>
                <li><strong>Certifications conformité :</strong> {{ fournisseurCopy.certifications_conformite || '—' }}</li>
                <li><strong>Dernier audit :</strong> {{ formatDate(fournisseurCopy.dernier_audit) || '—' }}</li>
              </ul>
            </div>
          </div>
              </div>
            </div>
          </div>
           
        </div>

        <div class="modal-footer">
          <span class="me-auto text-muted">Connecté en tant que <strong>Responsable Achats</strong></span>
          <button @click="toggleEdition" :class="estEnEdition ? 'btn btn-success' : 'btn btn-primary'">
            {{ estEnEdition ? 'Enregistrer' : 'Modifier' }}
          </button>
          <button v-if="estEnEdition" class="btn btn-outline-danger" @click="annulerModifications">Annuler</button>
          <button class="btn btn-success ms-2" @click="ouvrirModalEvaluation">Ajouter évaluation</button>
          <button class="btn btn-warning ms-2" @click="ouvrirModalIncident">Signaler incident</button>
          <button @click="fermerModal" class="btn btn-outline-secondary ms-2">Fermer</button>
        </div>

      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/vue@3/dist/vue.global.prod.js"></script>

<script>
const { createApp } = Vue;

const app = createApp({
  data() {
    return {
      estEnEdition: false,
      fournisseur: {},
      fournisseurCopy: {},
      contacts: [],
      produitsText: '',
      evaluations: [],
      documents: [],
      incidents: [],
      alertMessage: '',
      alertType: 'info',
      alertVisible: false,
      historique: [],        // Array d’actions: {id, action, date_action, gravite, utilisateur, description}
      currentPage: 1,        // page courante
      pageSize: 10,          // nombre d’éléments par page
      sortKey: 'date_action',// clé tri initiale
      sortOrders: {     date_action: -1,
      action: 1,
      gravite: 1,
      utilisateur: 1,
      description:1,
    },        // ordre de tri par clé (ascendant = 1, descendant = -1)
    };
  },
  computed: {
    // Historique trié selon sortKey et sortOrder
    sortedHistorique() {
      const key = this.sortKey;
      const order = this.sortOrders[key] || 1;
      const array = this.historique.slice();
      array.sort((a,b)=> {
        let aVal = a[key] || '';
        let bVal = b[key] || '';

        // Pour la date on donne la priorité à la conversion Date
        if(key === 'date_action') {
          aVal = new Date(aVal);
          bVal = new Date(bVal);
          return order * (aVal - bVal);
        }

        // Tri texte insensitive
        aVal = aVal.toString().toLowerCase();
        bVal = bVal.toString().toLowerCase();

        if(aVal < bVal) return -1 * order;
        if(aVal > bVal) return 1 * order;
        return 0;
      });
      return array;
    },

    // Nombre de pages total
    totalPages() {
      return Math.ceil(this.historique.length / this.pageSize);
    },

    // Slice de l’historique à afficher sur la page courante
    pagedHistorique() {
      const start = (this.currentPage - 1) * this.pageSize;
      return this.sortedHistorique.slice(start, start + this.pageSize);
    },
    alertClass() {
      switch (this.alertType) {
        case 'success': return ['alert-success'];
        case 'error': return ['alert-danger'];
        case 'warning': return ['alert-warning'];
        default: return ['alert-info'];
      }
    }
  },
  methods: {
    // Changer le tri à la clé donnée
sortBy(key) {
    if (this.sortKey === key) {
      // Inverse l’ordre si même colonne recliquée
      this.sortOrders[key] = -this.sortOrders[key];
    } else {
      this.sortKey = key;
      // Initialise à ascendant si nouvelle colonne
      this.sortOrders[key] = 1;
    }
    this.currentPage = 1; // Reset pagination à page 1
  },
  // Formatage date (exemple simple)
  formatDate(dateStr) {
    if (!dateStr) return '-';
    const d = new Date(dateStr);
    return d.toLocaleString();
  },
  // Classe bootstrap badge selon gravité
  getGraviteClass(gravite) {
    if (!gravite) return 'text-muted';
    if (gravite >= 4) return 'badge bg-danger';
    if (gravite === 3) return 'badge bg-warning text-dark';
    if (gravite === 2) return 'badge bg-info text-dark';
    if (gravite === 1) return 'badge bg-success';
    return 'badge bg-secondary';
  },
   // Classe badge gravité (même que ta fonction getGraviteClass)
  getGraviteClass(gravite) {
    if (!gravite) return 'badge bg-secondary';
    const g = gravite.toString().toLowerCase();
    if (g === 'faible' || g === '1') return 'badge bg-success';
    if (g === 'moyenne' || g === '2') return 'badge bg-warning text-dark';
    if (g === 'élevée' || g === '3' || g === 'élevé') return 'badge bg-danger';
    if (g === 'critique' || g === '4') return 'badge bg-danger';
    return 'badge bg-secondary';
  },
  formatDate(dateStr) {
    if (!dateStr) return '-';
    const dt = new Date(dateStr);
    if (isNaN(dt)) return dateStr;
    return dt.toLocaleDateString('fr-FR', { day: '2-digit', month: '2-digit', year: 'numeric' });
  },
    showAlert(message, type = 'info', timeout = 5000) {
      this.alertMessage = message;
      this.alertType = type;
      this.alertVisible = true;
      if (this._alertTimeout) clearTimeout(this._alertTimeout);
      this._alertTimeout = setTimeout(() => {
        this.alertVisible = false;
      }, timeout);
    },
    // charger l'historique des actions
   async chargerHistorique(idFournisseur) {
  try {
   const res = await fetch(`http://localhost:3000/api/actions_fournisseur/${idFournisseur}`);
    // Vérifie si la réponse est ok 
    if (!res.ok) throw new Error('Erreur chargement historique');
    const data = await res.json();
    this.historique = data.map(d => ({
      id: d.id,
      action: d.type_action,
      date_action: d.date_action,
      gravite: d.gravite,
      utilisateur: d.utilisateur_nom,
      description: d.description
    }));
    this.currentPage = 1;
  } catch (e) {
    this.showAlert(e.message, 'error');
    this.historique = [];
  }
},

    // badgeClassForStatut(statut)
     badgeClassForStatut(statut) {
      switch (statut) {
        case 'Valide':
          return 'badge bg-success';
        case 'Expire bientôt':
          return 'badge bg-warning text-dark';
        case 'Expiré':
          return 'badge bg-danger';
        case 'Inconnu':
        default:
          return 'badge bg-secondary';
      }
    },
  ouvrirModalEvaluation() {
  if(this.fournisseur && this.fournisseur.id && this.fournisseur.nom) {
    window.ouvrirModaleEvaluation(this.fournisseur.id, this.fournisseur.nom);
  } else {
    this.showAlert('Fournisseur non sélectionné', 'warning');
  }
},
 ouvrirModalIncident() {
  if(this.fournisseur && this.fournisseur.id && this.fournisseur.nom) {
    window.ouvrirModalSignalerIncident(this.fournisseur.id, this.fournisseur.nom);
  } else {
    this.showAlert('Fournisseur non sélectionné', 'warning');
  }
},
    ouvrirModalFournisseur(data) {
      this.fournisseur = JSON.parse(JSON.stringify(data));
      this.fournisseurCopy = JSON.parse(JSON.stringify(data));
      this.contacts = data.contacts ? JSON.parse(JSON.stringify(data.contacts)) : [];
      this.produitsText = (data.produits_services || []).map(p => p.description).join('\n');
      this.estEnEdition = false;

      if (this.fournisseur.id) {
        this.chargerEvaluations(this.fournisseur.id);
        this.chargerIncidents(this.fournisseur.id);
        this.chargerDocuments(this.fournisseur.id);
        this.chargerHistorique(this.fournisseur.id);  // <== charge l’historique ici
      } else {
        this.evaluations = [];
        this.incidents = [];
        this.documents = [];
        this.historique = [];  // Réinitialise l’historique si pas d’ID
      }

      const modalEl = document.getElementById('ficheFournisseur');
      const modalInst = bootstrap.Modal.getOrCreateInstance(modalEl);
      modalInst.show();
    },
    fermerModal() {
      this.estEnEdition = false;
      const modalEl = document.getElementById('ficheFournisseur');
      const modalInst = bootstrap.Modal.getInstance(modalEl);
      if(modalInst) modalInst.hide();
    },
    addContact() {
      this.contacts.push({
        type_contact: 'principale',
        nom: '',
        telephone: '',
        email: ''
      });
    },
    removeContact(index) {
      if(this.contacts.length > 1) this.contacts.splice(index, 1);
    },

    // Formatage date ISO vers MySQL DATETIME
    formatDateToMySQL(dateStr) {
      const dt = new Date(dateStr);
      if (isNaN(dt)) return null;
      return dt.getFullYear() + '-' +
        String(dt.getMonth() + 1).padStart(2, '0') + '-' +
        String(dt.getDate()).padStart(2, '0') + ' ' + 
        String(dt.getHours()).padStart(2, '0') + ':' +
        String(dt.getMinutes()).padStart(2, '0');
    },
    // Formatage date MySQL DATETIME vers affichage lisible
    formatDate(dateStr) {
  if (!dateStr) return '-';
  const dt = new Date(dateStr);
  if (isNaN(dt)) return dateStr;
  return dt.toLocaleDateString('fr-FR', { day: '2-digit', month: '2-digit', year: 'numeric' });
},


    // Nettoyage des données pour retirer clés vides/nulles avant envoi
    nettoyerData(obj) {
      const cleaned = {};
      for (const key in obj) {
        if (obj[key] !== undefined && obj[key] !== null && !(typeof obj[key] === 'string' && obj[key].trim() === '')) {
          cleaned[key] = obj[key];
        }
      }
      return cleaned;
    },

    toggleEdition() {
      if(this.estEnEdition) {
        // Préparer données à envoyer
        this.fournisseur.contacts = JSON.parse(JSON.stringify(this.contacts));
        this.fournisseur.produits_services = this.produitsText.split('\n').filter(t => t.trim() !== '').map(t => ({ description: t.trim() }));

        let dataToSend = JSON.parse(JSON.stringify(this.fournisseur));

        // Nettoyer
        dataToSend = this.nettoyerData(dataToSend);

        // Formater les dates si présentes
        ['last_update', 'date_debut_relation', 'date_fin_contrat'].forEach(field => {
          if(dataToSend[field]) {
            const formatted = this.formatDateToMySQL(dataToSend[field]);
            if(formatted) dataToSend[field] = formatted;
            else delete dataToSend[field];
          }
        });

        fetch(`http://localhost:3000/fournisseurs/${this.fournisseur.id}`, {
          method: 'PUT',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(dataToSend)
        })
        .then(res => {
          if(!res.ok) return res.text().then(txt => { throw new Error(txt || 'Erreur sauvegarde'); });
          return res.json();
        })
        .then(() => {
          this.showAlert('Mise à jour réussie', 'success');
          this.fournisseurCopy = JSON.parse(JSON.stringify(this.fournisseur));
          this.estEnEdition = false;
        })
        .catch(e => this.showAlert(e.message, 'error'));
      } else {
        this.estEnEdition = true;
      }
    },
    annulerModifications() {
      this.fournisseur = JSON.parse(JSON.stringify(this.fournisseurCopy));
      this.contacts = this.fournisseurCopy.contacts ? JSON.parse(JSON.stringify(this.fournisseurCopy.contacts)) : [];
      this.produitsText = (this.fournisseurCopy.produits_services || []).map(p => p.description).join('\n');
      this.estEnEdition = false;
    },
    badgeClassForStatut(statut) { /* ... inchangé */ },
    badgeClassContact(type) {
      if (!type) return 'badge bg-secondary';
      const t = type.toLowerCase();
      if (t === 'principale') return 'badge bg-success';
      if (t === 'facturation') return 'badge bg-primary';
      if (t === 'technique') return 'badge bg-warning text-dark';
      return 'badge bg-secondary';
    },
    iconePourcentage(val) { /* ... inchangé */ },
    // ouvrirModalEvaluation() { /* ... inchangé */ },
    // ouvrirModalIncident() { /* ... inchangé */ },

    // Chargements API asynchrones
    async chargerEvaluations(idFournisseur) {
      try {
        const res = await fetch(`http://localhost:3000/evaluations/${idFournisseur}`);
        if (!res.ok) throw new Error('Erreur chargement évaluations');
        this.evaluations = await res.json();
      } catch (e) {
        this.showAlert(e.message, 'error');
        this.evaluations = [];
      }
    },
    async chargerIncidents(idFournisseur) {
      try {
        const res = await fetch(`http://localhost:3000/incidents/${idFournisseur}`);
        if (!res.ok) throw new Error('Erreur chargement incidents');
        this.incidents = await res.json();
      } catch (e) {
        this.showAlert(e.message, 'error');
        this.incidents = [];
      }
    },
    async chargerDocuments(idFournisseur) {
      try {
        const res = await fetch(`http://localhost:3000/documents/${idFournisseur}`);
        if (!res.ok) throw new Error('Erreur chargement documents');
        this.documents = await res.json();
      } catch (e) {
        this.showAlert(e.message, 'error');
        this.documents = [];
      }
    },
    chargerDonneesSupplementaires() { /* ... inchangé */ },
    formatDate(dateStr) { /* ... inchangé */ }
  }
}).mount('#app');

window.ouvrirModalFournisseur = app.ouvrirModalFournisseur.bind(app);


</script>
