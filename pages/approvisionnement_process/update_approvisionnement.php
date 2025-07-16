<?php
require_once(__DIR__ . '/../../connect.php'); // Chemin correct depuis le dossier pages/approvisionnement

if(isset($_POST['modifier'])){
    $id_approvisionnement = $_POST['update_id'];
    $designation = htmlspecialchars(addslashes($_POST['designation']));
    $quantite = htmlspecialchars(addslashes($_POST['quantite']));
    $valeur_budgetisee = htmlspecialchars(addslashes($_POST['valeur_budgetisee']));
    $etat = htmlspecialchars(addslashes($_POST['etat']));
    $type_besoin = htmlspecialchars(addslashes($_POST['type_besoin']));
    $type_procedure = htmlspecialchars(addslashes($_POST['typeprocedure']));
    $fournisseur = htmlspecialchars(addslashes($_POST['fournisseur']));
    
    $requete = "UPDATE plan_approvisionnement SET designation = '$designation', quantite = '$quantite', valeur_budgetisee = '$valeur_budgetisee', etat = '$etat', type_besoin = '$type_besoin', type_procedure = '$type_procedure', fournisseur = '$fournisseur' WHERE id = '$id_approvisionnement'";
    $reponse = $bdd->query($requete);
    if($reponse){
        header('Location:../../plan_approvisionnement.php');
    }else{
        echo 'Un problème est survenu... Echec de l\'opération';
    }
}
?>