<?php
$host = 'localhost';
$db = 'c1743910c_aurorardc';
$user = 'root';
$pass = 'aurora@2021RDC';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $bdd = new PDO($dsn, $user, $pass, $options); // Utilise $bdd partout
    // echo "Connexion réussie à la base de données."; // À commenter ou supprimer
} catch (\PDOException $e) {
    // En production, log l'erreur au lieu d'afficher
    echo "Erreur : " . $e->getMessage();
    // Pour debug uniquement :
    // echo "Erreur : " . $e->getMessage();
}
?>