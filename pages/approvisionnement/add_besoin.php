<div class="modal fade" id="addSupplierModal" tabindex="-1" aria-labelledby="addSupplierModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSupplierModalLabel">Ajouter un Bésoin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Modal content goes here -->
                <form action = "./pages/approvisionnement_process/insert_approvisionnement.php" method = "POST" id = "formBesoin">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Désignation</label>
                        <input type="text" name = "designation" class="form-control" id="exampleFormControlInput1" placeholder="Désignation">
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Date de début de l'approvisionnement</label>
                                <input type="date" name = "date_debut_approvisionnement" class="form-control" id="exampleFormControlInput1" placeholder="Quantité">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Date de fin de l'approvisionnement</label>
                                <input type="date" name = "date_fin_approvisionnement" class="form-control" id="exampleFormControlInput1" placeholder="Valeur budgétisée">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Responsable</label>
                        <input type="text" name = "responsable" class="form-control" id="exampleFormControlInput1" placeholder="Responsable">
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
                                <label for="exampleFormControlInput1" class="form-label">Budget estimé</label>
                                <input type="number" name = "budget_estime" class="form-control" id="budgetEstime" placeholder="Budget estimé" min="101" step="0.01">
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Prix sur terrain</label>
                                <input type="number" name = "prix_sur_terrain" class="form-control" id="exampleFormControlInput1" placeholder="Prix sur terrain">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Etat</label>
                                <select class="form-select" aria-label="Default select example" name = "etat">
                                    <option selected>Sélectionner l'état</option>
                                    <option value="Pas encore lancé">Pas encore lancé</option>
                                    <option value="En cours">En cours</option>
                                    <option value="Terminé">Terminé</option>
                                    <option value="Annulé">Annulé</option>
                                </select>
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Type de bésoin</label>
                                <select class="form-select" aria-label="Default select example" name = "typeBesoin" id = "typeBesoin">
                                    <option selected>Sélectionner le type</option>
                                    <option value="Biens">Biens</option>
                                    <option value="Services">Services</option>
                                    <option value="Travaux">Travaux</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Priorité</label>
                            <select class="form-select" aria-label="Default select example" name = "priorite">
                                <option selected>Sélectionner priorité</option>
                                <option value="Haute">Haute</option>
                                <option value="Moyenne">Moyenne</option>
                                <option value="Basse">Basse</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Observation</label>
                            <textarea class="form-control" name = "observation" id="exampleFormControlTextarea1" rows="3" placeholder = "Obs"></textarea>
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

<div class="modal fade" id="updatemodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSupplierModalLabel">Modifier un Bésoin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Modal content goes here -->
                <form action = "./pages/approvisionnement_process/update_approvisionnement.php" method = "POST">
                    <div class="mb-3">
                        <input type="hidden" name = "update_id" id = "update_id">
                        <label for="exampleFormControlInput1" class="form-label">Désignation</label>
                        <input type="text" name = "designation" id = "designation" class="form-control">
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
                                <label for="exampleFormControlInput1" class="form-label">Budget Estimé</label>
                                <input type="number" name = "valeur_budgetisee" id = "montantEstime" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Etat</label>
                                <select class="form-select" aria-label="Default select example" name = "etat" id = "etat">
                                    <option selected>Sélectionner l'état</option>
                                    <option value="Pas encore lancé">Pas encore lancé</option>
                                    <option value="En cours">En cours</option>
                                    <option value="Terminé">Terminé</option>
                                </select>
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Type de bésoin</label>
                                <select class="form-select" aria-label="Default select example" name = "type_besoin" id = "typebesoin">
                                    <option selected>Sélectionner le type</option>
                                    <option value="Biens">Biens</option>
                                    <option value="Services">Services</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Type de procédure</label>
                        <select class="form-select" aria-label="Default select example" name = "typeprocedure" id = "typeProcedure">
                            <option selected>Sélectionner le type de procédure</option>
                            <option value="Procédure d'une seule quotation (pro forma)">Procédure d'une seule quotation (pro forma)</option>
                            <option value="Procédure négociée - minimum 3 pro forma">Procédure négociée - minimum 3 pro forma</option>
                            <option value="Appel d'offre ouvert local">Appel d'offre ouvert local</option>
                            <option value="Appel d'offre ouvert international">Appel d'offre ouvert international</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Fournisseur</label>
                        <input type="text" name = "fournisseur" id = "fournisseur" class="form-control">
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