<?php
/**
 * Created by PhpStorm.
 * User: Belhassen
 * Date: 30/10/2015
 * Time: 19:04
 */
include("../covDAO/LoginDAO.php");
class Login {

    private $user_id;
    private $user_name;
    private $user_pass;
    private $login_date;

    function __construct($user_name, $user_pass, $login_date)
    {
        $this->user_name = $user_name;
        $this->user_pass = $user_pass;
        $this->login_date = $login_date;
    }

    /**
     * @return mixed
     */
    public function getUserId()
    {
        return $this->user_id;
    }

    /**
     * @param mixed $user_id
     */
    public function setUserId($user_id)
    {
        $this->user_id = $user_id;
    }

    /**
     * @return mixed
     */
    public function getUserName()
    {
        return $this->user_name;
    }

    /**
     * @param mixed $user_name
     */
    public function setUserName($user_name)
    {
        $this->user_name = $user_name;
    }

    /**
     * @return mixed
     */
    public function getUserPass()
    {
        return $this->user_pass;
    }

    /**
     * @param mixed $user_pass
     */
    public function setUserPass($user_pass)
    {
        $this->user_pass = $user_pass;
    }

    /**
     * @return mixed
     */
    public function getLoginDate()
    {
        return $this->login_date;
    }

    /**
     * @param mixed $login_date
     */
    public function setLoginDate($login_date)
    {
        $this->login_date = $login_date;
    }



}
$login=$_POST['login'];
$pw=$_POST['password'];
$login_date = date("Y-m-d H:i:s");
$user_login = new Login($login, $pw, $login_date);

