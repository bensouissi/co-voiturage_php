<?php
/**
 * Created by PhpStorm.
 * User: Belhassen
 * Date: 07/11/2015
 * Time: 18:04
 */
include("UserWS.php");
$login=$_POST['email'];
$nom=$_POST['nom'];
$prenom=$_POST['prenom'];
$pw=$_POST['pw'];
$tel=$_POST['telephone'];
$ville=$_POST['ville'];
$quest=$_POST['quest'];
$rep=$_POST['rep'];

$user= new UserWS($login,$pw);
$user->setUserName($nom);
$user->setUserSurname($prenom);
$user->setUserTel($tel);
$user->setUserVille($ville);

$user->inscription($quest,$rep);