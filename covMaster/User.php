<?php
/**
 * Created by PhpStorm.
 * User: Belhassen
 * Date: 29/10/2015
 * Time: 23:11
 */

include("../covWS/connexion.php");

class User {
    private $id_user;
    private $user_name;
    private $user_surname;
    private $user_birthdate;
    private $user_sexe;
    private $user_tel;
    private $user_mail;
    private $user_pass;
    private $user_ville;
    private $user_note;
    private $user_registered;

    function __construct($id_user, $user_name, $user_surname, $user_birthdate, $user_sexe, $user_tel, $user_mail, $user_pass, $user_ville, $user_note, $user_registered)
    {
        $this->id_user = $id_user;
        $this->user_name = $user_name;
        $this->user_surname = $user_surname;
        $this->user_birthdate = $user_birthdate;
        $this->user_sexe = $user_sexe;
        $this->user_tel = $user_tel;
        $this->user_mail = $user_mail;
        $this->user_pass = $user_pass;
        $this->user_ville = $user_ville;
        $this->user_note = $user_note;
        $this->user_regiseteredtered = $user_registered;
    }

    /**
     * @return mixed
     */
    public function getIdUser()
    {
        return $this->id_user;
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
    public function getUserSurname()
    {
        return $this->user_surname;
    }

    /**
     * @param mixed $user_surname
     */
    public function setUserSurname($user_surname)
    {
        $this->user_surname = $user_surname;
    }

    /**
     * @return mixed
     */
    public function getUserBirthdate()
    {
        return $this->user_birthdate;
    }

    /**
     * @param mixed $user_birthdate
     */
    public function setUserBirthdate($user_birthdate)
    {
        $this->user_birthdate = $user_birthdate;
    }

    /**
     * @return mixed
     */
    public function getUserSexe()
    {
        return $this->user_sexe;
    }

    /**
     * @param mixed $user_sexe
     */
    public function setUserSexe($user_sexe)
    {
        $this->user_sexe = $user_sexe;
    }

    /**
     * @return mixed
     */
    public function getUserTel()
    {
        return $this->user_tel;
    }

    /**
     * @param mixed $user_tel
     */
    public function setUserTel($user_tel)
    {
        $this->user_tel = $user_tel;
    }

    /**
     * @return mixed
     */
    public function getUserMail()
    {
        return $this->user_mail;
    }

    /**
     * @param mixed $user_mail
     */
    public function setUserMail($user_mail)
    {
        $this->user_mail = $user_mail;
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
    public function getUserVille()
    {
        return $this->user_ville;
    }

    /**
     * @param mixed $user_ville
     */
    public function setUserVille($user_ville)
    {
        $this->user_ville = $user_ville;
    }

    /**
     * @return mixed
     */
    public function getUserNote()
    {
        return $this->user_note;
    }

    /**
     * @param mixed $user_note
     */
    public function setUserNote($user_note)
    {
        $this->user_note = $user_note;
    }

    /**
     * @return mixed
     */
    public function getUserRegistered()
    {
        return $this->user_registered;
    }

    /**
     * @param mixed $user_regis0tered
     */
    public function setUserRegistered($user_registered)
    {
        $this->user_regis0tered = $user_registered;
    }


    public function login(){

    }



}