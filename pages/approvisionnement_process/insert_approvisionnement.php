<?php

require_once('../connect.php');

if(isset($_POST['enregistrer'])){
    $designation = htmlspecialchars(addslashes($_POST['designation']));
    $date_debut_approvisionnement = $_POST['date_debut_approvisionnement'];
    $date_fin_approvisionnement = $_POST['date_fin_approvisionnement'];
    $responsable = htmlspecialchars(addslashes($_POST['responsable']));
    $quantite = htmlspecialchars(addslashes($_POST['quantite']));
    $prix_unitaire = htmlspecialchars(addslashes($_POST['prix_unitaire']));
    $budget_estime = htmlspecialchars(addslashes($_POST['budget_estime']));
    $prix_sur_terrain = htmlspecialchars(addslashes($_POST['prix_sur_terrain']));
    $etat = htmlspecialchars(addslashes($_POST['etat']));
    $type_besoin = htmlspecialchars(addslashes($_POST['typeBesoin']));
    $priorite = htmlspecialchars(addslashes($_POST['priorite']));
    $observation = htmlspecialchars(addslashes($_POST['observation']));

    $stmt = $bdd->query("SELECT nom_procedure FROM type_procedure WHERE '$budget_estime' BETWEEN montant_min AND montant_max");
    $result = $stmt->fetch();
    if($result){
        $nom_procedure = htmlspecialchars(addslashes($result['nom_procedure']));
    }
    
    $requete = "INSERT INTO plan_approvisionnement(designation, date_debut_approvisionnement, date_fin_approvisionnement, responsable, quantite, prix_unitaire, budget_estime, prix_sur_terrain, etat, type_besoin, priorite, type_procedure, observation) VALUES('$designation', '$date_debut_approvisionnement', '$date_fin_approvisionnement', '$responsable', '$quantite', '$prix_unitaire', '$budget_estime', '$prix_sur_terrain', '$etat', '$type_besoin', '$priorite', '$nom_procedure', '$observation')";
    $resultat = $bdd->exec($requete);

    if($resultat){
        header('Location:../../plan_approvisionnement.php');
    }else{
        echo 'Echec d\'insertion';
    }
}

?>