<?php
/**
 * Created by PhpStorm.
 * User: Belhassen
 * Date: 30/10/2015
 * Time: 19:34
 */
require("../covWS/connexion.php");
class LoginDAO {

    private $user_id;
    private $user_login;
    private $user_pass;
    private $login_date;

    function __construct($user_login, $user_pass, $login_date)
    {
        $this->user_login = $user_login;
        $this->user_pass = $user_pass;
        $this->login_date = $login_date;
    }


    public function UserFound(){
        try{
            $dbh = new PDO('mysql:dbname=co_voiturage;host=127.0.0.1', 'root', '');
            $query=$dbh->prepare("Select Code_usr,email,password from user where email=? and password=?");
            $query->excute(array("email"=> $this->user_login, "password"=> $this->user_pass));
            $row = $query->fetch(PDO::FETCH_ASSOC);

            if($row)
               return true;
            else
                return false;

        }catch(PDOException  $e ){
            echo "Error: ".$e;
        }
    }

    public function insertLogin(){

    }
}
