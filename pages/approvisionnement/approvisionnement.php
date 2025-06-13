<?php
require_once('connect.php');
$approvisionnements = $bdd->query("SELECT * FROM plan_approvisionnement ORDER BY id DESC");
?>
<div class="content">
     <!-- content nav -->
     <?php include_once "./content_nav.php" ?>
     <!-- conetent  end -->
        <div class="row mb-4">
            <div class="col-12 col-lg-12 col-xl-12 d-flex">
                <h5 class="mb-0">Gestion des Approvisionnements</h5>
            </div>

            <!-- Modal -->
             <?php include_once "add_besoin.php"; ?>
             <?php include_once "fiche_besoin.php" ?>
             <?php include_once "historique_besoin.php" ?>

           
        </div>
        <!-- Exemple d'alerte critique -->
        
        <!-- table -->
        <div class="row">
            <div class="col-12 col-lg-12 col-xl-12">
                <div class="card mb-4">
                <div class="card-body">
                    <div id="tableFournisseurs" data-list='{"valueNames":["nom","type","statut","contact","score","risque"],"page":5,"pagination":true}'>
                    <div class="row justify-content-between align-items-center g-0 mb-3">
                        <div class="col-auto col-sm-5">
                        <form>
                            <div class="input-group">
                            <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Rechercher un besoin..." aria-label="search" />
                            <div class="input-group-text bg-transparent"><span class="fa fa-search fs--1 text-600"></span></div>
                            </div>
                        </form>
                        </div>
                        <div class="col-auto">
                            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addSupplierModal" type="button"><span class="fa fa-plus me-1"></span>Ajouter un besoin</button>
                        </div>
                    </div>
                    <div class="table-responsive scrollbar">
                        <table class="table table-bordered table-striped fs--1 mb-0">
                            <thead class="bg-200 text-900">
                                <tr>
                                    <th class="sort" data-sort="id">ID</th>
                                    <th class="sort" data-sort="designation">Désignation</th>
                                    <th class="sort" data-sort="quantite">Quantité</th>
                                    <th class="sort" data-sort="valeur_budgetisee">Valeur budgétisée ($)</th>
                                    <th class="sort" data-sort="etat">Statut</th>
                                    <th class="sort" data-sort="type_besoin">Type de besoin</th>
                                    <th class="sort" data-sort="type_procedure">Type de procédure</th>
                                    <th class="sort" data-sort="fournisseur">Fournisseur</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list">
                                <?php
                                if($approvisionnements->rowCount() > 0){
                                    while($approvisionnement = $approvisionnements->fetch()){
                                ?>
                                <tr>
                                    <td class = "approvisionnement_id" id = "approvisionnementid"><?php echo $approvisionnement['id']; ?></td>
                                    <td><?php echo $approvisionnement['designation']; ?></td>
                                    <td><?php echo $approvisionnement['quantite']; ?></td>
                                    <td><?php echo $approvisionnement['valeur_budgetisee']; ?></td>
                                    <td><?php echo $approvisionnement['etat']; ?></td>
                                    <td><?php echo $approvisionnement['type_besoin']; ?></td>
                                    <td><?php echo $approvisionnement['type_procedure']; ?></td>
                                    <td><?php echo $approvisionnement['fournisseur']; ?></td>
                                    <td>
                                        <a data-bs-toggle="modal" data-bs-target="#updateFournisseur" class="btn btn-sm btn-warning edit_data" title="Évaluer" id = "<?php echo $approvisionnement['id']; ?>"><span class="fa fa-edit"></span></a>
                                        <a data-bs-toggle="modal" class="btn btn-sm btn-secondary delete_data" data-bs-target="#deleteFournisseur" title="Historique"><span class="fa fa-history"></span></a>
                                    </td>
                                </tr>
                                <?php
                                    }
                                }else{
                                ?>
                                <tr>
                                    <td colspan = "6">Aucun resultat</td>
                                </tr>
                                <?php
                                    }
                                ?>
                                <!-- Ajoute d'autres fournisseurs ici -->
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

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        $('.view_data').click(function(e) {
            e.preventDefault();

            /* console.log('Hello'); */

            var approvisionnement_id = $(this).closest('tr').find('.approvisionnement_id').text();
            /* console.log(user_id); */

            $.ajax({
                method:"POST",
                url:"view_approvisionnement.php",
                data: {
                    'click_view_btn': true,
                    'approvisionnement_id':approvisionnement_id,
                },
                success: function (response) {
                    console.log(response);

                    $('.view_approvisionnement_details').html(response);
                    $('#ficheFournisseur').modal('show');
                }
            });
        });
    });
</script>

<script>
    $(document).ready(function(){

        $(document).on('click', '.edit_data', function(){
            var approvisionnement_id = $(this).attr("id");
            $.ajax({
                url:"essai.php",
                method:"POST",
                data:{approvisionnement_id:approvisionnement_id},
                dataType:"json",
                success:function(data){
                    $('#designation').val(data.designation);
                    $('#quantite').val(data.quantite);
                    $('#prixunitaire').val(data.prix_unitaire);
                    $('#etat').val(data.etat);
                    $('#typebesoin').val(data.type_besoin);
                    $('#valeurbudgetisee').val(data.valeur_budgetisee);
                    $('#datelimite').val(data.date_limite);
                    $('#typeprocedure').val(data.type_procedure);
                    $('#fournisseur').val(data.fournisseur);
                    $('#debutapprovisionnement').val(data.debut_approvisionnement);
                    $('#dureeprocedure').val(data.duree_procedure);
                    $('#raisonsachat').val(data.raisons_achat);
                    $('#approvisionnementid').val(data.approvisionnement_id);
                    $('#update').val("Update");
                    $('#updatemodal').modal("show");
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function(){
        $('.edit_data').on('click', function(){
            $('#updatemodal').modal('show');
            $tr = $(this).closest('tr');
            var data = $tr.children("td").map(function(){
                return $(this).text();
            }).get();
            console.log(data);
            $('#update_id').val(data[0]);
            $('#designation').val(data[1]);
            $('#quantite').val(data[2]);
            $('#valeurbudgetisee').val(data[3]);
            $('#etat').val(data[4]);
            $('#typebesoin').val(data[5]);
            $('#typeprocedure').val(data[6]);
            $('#fournisseur').val(data[7]);
        });
    });
</script>

<script>
    $(document).ready(function(){
        $('.delete_data').on('click', function(){
            $('#deleteFournisseur').modal('show');
            $tr = $(this).closest('tr');

            var data = $tr.children("td").map(function(){
                return $(this).text();
            }).get();

            console.log(data);
            $('#delete_id').val(data[0]);
        });
    });
</script>