<?php
/**
 * Created by PhpStorm.
 * User: Belhassen
 * Date: 30/10/2015
 * Time: 19:04
 */
//include("../covDAO/LoginDAO.php");
include("UserWS.php");

$login=$_POST['mail'];
$pw=$_POST['pw'];
//$login_date = date("Y-m-d H:i:s");
$user = new UserWS($login, $pw);
$user->login();


