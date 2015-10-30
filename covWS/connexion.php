<?php
/**
 * Created by PhpStorm.
 * User: Belhassen
 * Date: 30/10/2015
 * Time: 19:20
 */

$dsn = 'mysql:dbname=co_voiturage;host=127.0.0.1';
$user = 'root';
$password = '';

try {
    $dbh = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    echo 'Connexion échouée : ' . $e->getMessage();
}