<?php
/**
 * Created by PhpStorm.
 * User: Belhassen
 * Date: 29/10/2015
 * Time: 23:08
 */
include("../config.php");
include("../covDAO/UserDAO.php");
class UserWS {
    private $id_user;
    private $user_name;
    private $user_surname;
    private $pw;
    private $user_birthdate;
    private $user_sexe;
    private $user_tel;
    private $user_mail;
    private $user_pass;
    private $user_ville;
    private $user_note;
    private $user_registered;

    function __construct($user_mail, $pw)
    {
        $this->user_mail = $user_mail;
        $this->pw = $pw;
    }

    public function login(){
        $login_date = date("Y-m-d H:i:s");
        $flag['code']=0;
        $loginDAO = new UserDAO($this->user_mail, $this->pw);
        if($loginDAO->UserFound()){
            $flag['code'] = 1;
        }

        echo json_encode($flag);

    }

}