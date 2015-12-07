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

    function __construct()
    {

    }

    /**
     * @return mixed
     */


    public function login(){
        $login_date = date("Y-m-d H:i:s");
        $flag['code']=0;
        $login=$_POST['mail'];
        $pw=$_POST['pw'];
        $loginDAO = new UserDAO($login, $pw);
        if($loginDAO->UserFound()){
            $flag['code'] = 1;
        }

        echo json_encode($flag);

    }
    public function inscription(){
        $flag['code']=0;

        $login=$_POST['email'];
        $nom=$_POST['nom'];
        $prenom=$_POST['prenom'];
        $pw=$_POST['pw'];
        $tel=$_POST['telephone'];
        $ville=$_POST['ville'];
        $quest=$_POST['quest'];
        $rep=$_POST['rep'];

        $UserDAO = new UserDAO($login, $pw);
        $UserDAO->setNom($nom);
        $UserDAO->setPrenom($prenom);
        $UserDAO->setTel($tel);
        $UserDAO->setVille($ville);
        $UserDAO->setQstSecurite($quest);
        $UserDAO->setReponseSecurite($rep);

        if($UserDAO->query_insertion()){
            $flag['code'] = 1;
        }
        echo json_encode($flag);
    }

}

$user= new UserWS();
if(isset($_POST['mail']) && isset($_POST['pw']) && isset($_POST['telephone'])&& isset($_POST['ville']) && isset($_POST['nom']) && isset($_POST['prenom'])){
    $user->inscription();
}else{
    $user->login();
}
