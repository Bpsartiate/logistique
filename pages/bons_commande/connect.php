<?php
try{
    $bdd = new PDO('mysql:host=localhost;dbname=logistique', 'root', '');
} catch(Exception $e){
    die('Erreur : ' .$e->getMessage());
}
?>