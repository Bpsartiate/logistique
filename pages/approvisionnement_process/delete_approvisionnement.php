<?php
require_once(__DIR__ . '/../../connect.php'); // Chemin correct depuis le dossier pages/approvisionnement
if(isset($_POST['supprimer'])){
    $id = $_POST['delete_id'];
    $requete = "DELETE FROM plan_approvisionnement WHERE id = '$id'";
    $reponse = $bdd->exec($requete);
    if($reponse){
        header('Location:../../plan_approvisionnement.php');
    }else{
        echo 'Echec de l\'opération';
    }
} 
?>