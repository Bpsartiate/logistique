<div class="modal fade" id="addSupplierModal" tabindex="-1" aria-labelledby="addSupplierModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSupplierModalLabel">Ajouter un bon de commande</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Modal content goes here -->
                <form action = "./pages/bons_commande_process/insert_commande.php" method = "POST">
                    <div class = "row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Date de commande</label>
                                <input type="date" name = "date_commande" class="form-control" id="exampleFormControlInput1" placeholder="Date">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Numéro de commande</label>
                                <input type="text" name = "numero_commande" class="form-control" id="exampleFormControlInput1" placeholder="Numéro de commande">
                            </div>
                        </div>
                    </div>
                    <h5>1. Informations sur l'expéditeur</h5>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Nom de l'expéditeur</label>
                                <input type="text" name = "nom_expediteur" class="form-control" id="exampleFormControlInput1" placeholder="Nom de l'expéditeur">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Téléphone</label>
                                <input type="number" name = "telephone_expediteur" class="form-control" id="exampleFormControlInput1" placeholder="Téléphone">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Email</label>
                                <input type="email" name = "email" class="form-control" id="exampleFormControlInput1" placeholder="Email">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Adresse physique</label>
                                <input type="text" name = "adresse" class="form-control" id="exampleFormControlInput1" placeholder="Adresse">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">N° TVA intracommunautaire</label>
                                <input type="text" name = "tva" class="form-control" id="exampleFormControlInput1" placeholder="Numéro TVA">
                            </div>
                        </div>
                    </div>
                    <h5>2. Informations sur le destinataire</h5>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Désignation</label>
                                <input type="text" name = "designation" class="form-control" id="exampleFormControlInput1" placeholder="Désignation">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Nom du client</label>
                                <input type="text" name = "nom_client" class="form-control" id="exampleFormControlInput1" placeholder="Nom du client">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Téléphone du client</label>
                                <input type="number" name = "telephone_client" class="form-control" id="exampleFormControlInput1" placeholder="Téléphone du client">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Code Postal</label>
                                <input type="text" name = "code_postal" class="form-control" id="exampleFormControlInput1" placeholder="Code Postal">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Adresse de livraison</label>
                                <input type="text" name = "adresse_livraison" class="form-control" id="exampleFormControlInput1" placeholder="Adresse de livraison">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Personne à contacter</label>
                                <input type="text" name = "personne_a_contacter" class="form-control" id="exampleFormControlInput1" placeholder="Personne à contacter">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Quantité</label>
                                <input type="number" name = "quantite" class="form-control" id="exampleFormControlInput1" placeholder="Quantité">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Prix Unitaire</label>
                                <input type="number" name = "prix_unitaire" class="form-control" id="exampleFormControlInput1" placeholder="Prix Unitaire">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Taux TVA (en %)</label>
                                <input type="number" name = "taux_tva" step = "any" min="0" max="10" class="form-control" id="exampleFormControlInput1" placeholder="Taux TVA">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Frais de livraison (en $)</label>
                                <input type="number" name = "frais_livraison" class="form-control" id="exampleFormControlInput1" placeholder="Frais de livraison" value = "0">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Moyen de paiement</label>
                                <select class="form-select" name = "moyen_paiement" aria-label="Default select example">
                                    <option selected>Moyen de paiement</option>
                                    <option value="Espèces">Espèces</option>
                                    <option value="Carte bancaire">Carte bancaire</option>
                                    <option value="Mobile Money">Mobile Money</option>
                                    <option value="Chèque">Chèque</option>
                                </select>
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Statut</label>
                                <select class="form-select" name = "statut" aria-label="Default select example">
                                    <option selected>Statut</option>
                                    <option value="En attente">En attente</option>
                                    <option value="Expédiée">Expédiée</option>
                                    <option value="Annulée">Annulée</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                        <button type="submit" name = "enregistrer" class="btn btn-primary">Enregistrer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
 </div>

<!-- Modal -->
<div class="modal fade" id="myModal" role = "dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id = "load_data">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="updatemodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSupplierModalLabel">Modifier une commande</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Modal content goes here -->
                <form action = "./pages/bons_commande_process/update_commande.php" method = "POST">
                    <div class="mb-3">
                        <input type="hidden" name = "update_id" id = "update_id">
                        <label for="exampleFormControlInput1" class="form-label">Date de commande</label>
                        <input type="date" name = "date_commande" id = "datecommande" class="form-control">
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Produit</label>
                                <input type="text" name = "produit" id = "produit" class="form-control">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Client</label>
                                <input type="text" name = "client" id = "client" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Quantité</label>
                                <input type="number" name = "quantite" id = "quantite" class="form-control">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Prix Unitaire</label>
                                <input type="text" name = "prix_unitaire" id = "prixunitaire" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Statut</label>
                        <select class="form-select" aria-label="Default select example" name = "statut" id = "statut">
                            <option selected>Sélectionner l'état</option>
                            <option value="En attente">En attente</option>
                            <option value="Expédiée">Expédiée</option>
                            <option value="Annulée">Annulée</option>
                        </select>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Date de livraison</label>
                                <input type="date" name = "date_livraison" id = "datelivraison" class="form-control">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Adresse de livraison</label>
                                <input type="text" name = "adresse_livraison" id = "adresselivraison" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                        <button type="submit" name = "modifier" id = "modifier" class="btn btn-primary">Modifier</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteCommande">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSupplierModalLabel">Supprimer Commande</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="./pages/bons_commande_process/delete_commande.php" method = "POST">
                    <input type="hidden" name = "delete_id" id = "delete_id">
                    Etes-vous sûr de vouloir supprimer cette commande ?
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                    <button type="submit" name = "supprimer" id = "supprimer" class="btn btn-danger">Supprimer</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
