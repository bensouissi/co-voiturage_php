<?php

use \PDO;
class UserDAO
{
    private $db_name;
    private $db_user;
    private $db_password;
    private $db_host;
    private $pdo;

    private $code_usr;
    private $nom;
    private $prenom;
    private $date_naissance;
    private $sexe;
    private $tel;
    private $date_inscription;
    private $email;
    private $password;
    private $ville;
    private $note;
    private $qst_securite;
    private $reponse_securite;

    public function __construct($email, $password)
    {
        $this->db_name='co_voiturage';
        $this->db_host='localhost';
        $this->db_user='root';
        $this->db_password='';

        $this->email=$email;
        $this->password=$password;

    }

    /***************************  Connexion a la base en creant l'objet PDO  ***************************/
    public function getPDO()
    {
        if($this->pdo == null)
        {
            $pdo = new PDO('mysql:dbname=co_voiturage;host=localhost','root','');
            $this->pdo=$pdo;
        }
        return $this->pdo ;
    }

    /***************************  Getters  ***************************/
    public function getNOM()
    {
        return $this->nom;
    }
    public function getPRENOM()
    {
        return $this->prenom;
    }
    public function getDATE_NAISS()
    {
        return $this->date_naissance;
    }
    public function getSEXE()
    {
        return $this->sexe;
    }
    public function getTEL()
    {
        return $this->tel;
    }
    public function getDATE_INSC()
    {
        return $this->date_inscription;
    }
    public function getEMAIL()
    {
        return $this->email;
    }
    public function getPASSWORD()
    {
        return $this->password;
    }
    public function getVILLE()
    {
        return $this->ville;
    }
    public function getQST()
    {
        return $this->qst_securite;
    }
    public function getREP()
    {
        return $this->reponse_securite;
    }

    /**************  Enregistrer tous le contenus de la table utilisateur dans un tableau $resultat  **************/
    public function query_affichage_complet()
    {
        $resultat=$this->getPDO()->query("select * from user");
        return $resultat ;
    }
    /************  Enregistrer le contenus de la clé $code de la table utilisateur dans un tableau $resultat *********/
    public function query_affichage_par_cle($code)
    {
        $resultat=$this->getPDO()->query("select * from user where Code_usr=".$code);
        return $resultat ;
    }
    /**************  Inserer tous les donnée saisie a partir de l'application dans la table utilisateur   **************/
    public function query_insertion()
    {

        $requet = "INSERT INTO user (nom,prenom,date_naissance,sexe,tel,date_inscription,email,password,ville,qst_securite,reponse_securite) VALUES (:nom,:prenom,:date_naissance,:sexe,:tel,:date_inscription,:email,:password,:ville,:qst_securite,:reponse_securite)";
        $q = $this->getPDO()->prepare($requet);
        $q->execute(array(':nom'=>$this->getNOM(),
            ':prenom'=>$this->getPRENOM(),
            ':date_naissance'=>$this->getDATE_NAISS(),
            ':sexe'=>$this->getSEXE(),
            ':tel'=>$this->getTEL(),
            ':date_inscription'=>$this->getDATE_INSC(),
            ':email'=>$this->getEMAIL(),
            ':password'=>$this->getPASSWORD(),
            ':ville'=>$this->getVILLE(),
            ':qst_securite'=>$this->getQST(),
            ':reponse_securite'=>$this->getREP()


        ));
    }

    /**************  Effacer un enregistrement par son code d'utilisateur  **************/
    public function query_delete_par_id($id)
    {
        $requet="DELETE FROM user WHERE Code_usr=".$id;
        $q = $this->getPDO()->exec($requet);
    }


    public function UserFound(){
        try{
            $dbh = new PDO('mysql:dbname=co_voiturage;host=127.0.0.1', 'root', '');
            $query=$dbh->prepare("Select Code_usr from user where email=:email and password=:password");
            $query->execute(array("email"=> $this->email, "password"=> $this->password));
            $row = $query->fetch(PDO::FETCH_ASSOC);

            if($row)
                return true;
            else
                return false;

        }catch(PDOException  $e ){
            echo "Error: ".$e;
        }
    }
}

?>



