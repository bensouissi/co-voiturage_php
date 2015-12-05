<?php
use \PDO;

class iteneraireDAO
{
    private $db_name;
    private $db_user;
    private $db_password;
    private $db_host;
    private $pdo;

    private $Code_ville;
    private $code_parcours;

    public function __construct($Code_ville,$code_parcours)
    {
        $this->db_name = 'co_voiturage';
        $this->db_host = 'localhost';
        $this->db_user = 'root';
        $this->db_password = '';

        $this->code_usr = $Code_ville;
        $this->heure_depart = $code_parcours;
    }

    public function getPDO()
    {
        if($this->pdo == null)
        {
            $pdo = new PDO('mysql:dbname=co_voiturage;host=localhost','root','');
            $this->pdo=$pdo;
        }
        return $this->pdo ;
    }

    public function getCODE_VILLE(){
        return $this->Code_ville;
    }
    public function getCODE_PARCOURS(){
        return $this->code_parcours;
    }

    public function query_affichage_complet()
    {
        $resultat=$this->getPDO()->query("select * from ville_etape");
        return $resultat ;
    }


    public function query_insertion()
    {
    $requet = "INSERT INTO parcours (Code_ville,code_parcours) VALUES (:Code_ville,:code_parcours)";

        $q = $this->getPDO()->prepare($requet);

        $q->execute(array(
            ':Code_ville' => $this->getCODE_VILLE(),
            ':hcode_parcours' => $this->getCODE_PARCOURS()

        ));

    }
}
?>