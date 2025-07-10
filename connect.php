<?php
$host = 'localhost'; // Adresse du serveur MySQL
$db   = 'c1743910c_aurorardc'; // Nom de la base de données
$user = 'root'; // Nom d'utilisateur
$pass = 'aurora@2021RDC';      // Mot de passe
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Gestion des erreurs
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // Mode de récupération
    PDO::ATTR_EMULATE_PREPARES   => false,                  // Préparation réelle des requêtes
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
    echo "Connexion réussie à la base de données.";
} catch (\PDOException $e) {
    // Ne jamais afficher les détails en production
    echo "Erreur de connexion à la base de données.";
    // Pour le debug uniquement (à retirer en production) :
    // echo "Erreur : " . $e->getMessage();
}
?>
