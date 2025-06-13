<?php

require_once('../connect.php');

if(isset($_POST['enregistrer'])){
    $designation = htmlspecialchars(addslashes($_POST['designation']));
    $quantite = htmlspecialchars(addslashes($_POST['quantite']));
    $valeur_budgetisee = htmlspecialchars(addslashes($_POST['valeur_budgetisee']));
    $etat = htmlspecialchars(addslashes($_POST['etat']));
    $type_besoin = htmlspecialchars(addslashes($_POST['type_besoin']));
    $type_procedure = htmlspecialchars(addslashes($_POST['type_procedure']));
    $fournisseur = htmlspecialchars(addslashes($_POST['fournisseur']));

    $requete = "INSERT INTO plan_approvisionnement(designation, quantite, valeur_budgetisee, etat, type_besoin, 
    fournisseur, type_procedure) VALUES('$designation', '$quantite', '$valeur_budgetisee', '$etat', '$type_besoin', '$fournisseur', '$type_procedure')";
    $resultat = $bdd->exec($requete);

    if($resultat){
        header('Location:../../plan_approvisionnement.php');
    }else{
        echo 'Echec d\'insertion';
    }
}

?>