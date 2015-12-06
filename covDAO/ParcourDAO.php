<?php
use \PDO;

class ParcourDAO {
    private $db_name;
    private $db_user;
    private $db_password;
    private $db_host;
    private $pdo;

    private $code_parcours;
    private $code_usr;
    private $heure_depart;
    private $date_depart;
    private $code_ville_depart;
    private $code_ville_arrive;
    private $fume;
    private $bagage;
    private $animal;
    private $etat;
    private $nbr_place;
    private $description;
    private $tarif;

    public function __construct($code_usr,$heure_depart,$date_depart,$code_ville_depart,$code_ville_arrive,$fume,$bagage,$animal,$etat,$nbr_place,$description,$tarif){
        $this->db_name='co_voiturage';
        $this->db_host='localhost';
        $this->db_user='root';
        $this->db_password='';

        $this->code_usr=$code_usr;
        $this->heure_depart=$heure_depart;
        $this->date_depart=$date_depart;
        $this->code_ville_depart=$code_ville_depart;
        $this->code_ville_arrive=$code_ville_arrive;
        $this->fumé=$fume;
        $this->bagage=$bagage;
        $this->animal=$animal;
        $this->etat=$etat;
        $this->nbr_place=$nbr_place;
        $this->description=$description;
        $this->tarif=$tarif;


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

    /**
     * @return mixed
     */

    /***************************  Getters  ***************************/
    public function getCodeParcours()
    {
        return $this->code_parcours;
    }

    public function getCODE_USR(){
        return $this->code_usr;
    }
    public function getHEURE_DEPART(){
        return $this->heure_depart;
    }
    public function getDATE_DEPART(){
        return $this->date_depart;
    }
    public function getCODE_VILLE_DEPART(){
        return $this->code_ville_depart;
    }
    public function getCODE_VILLE_ARRIVE(){
        return $this->code_ville_arrive;
    }
    public function getFUME(){
        return $this->fume;
    }
    public function getBAGAGE(){
        return $this->bagage;
    }
    public function getANIMAL(){
        return $this->animal;
    }
    public function getETAT(){
        return $this->etat;
    }
    public function getNBR_PLACE(){
        return $this->nbr_place;
    }
    public function getDESCRIPTION(){
        return $this->description;
    }
    public function getTARIF(){
        return $this->tarif;
    }
    /**************  Enregistrer tous le contenus de la table PARCOURS dans un tableau $resultat  **************/
    public function query_affichage_complet()
    {
        $resultat=$this->getPDO()->query("select * from parcours");
        return $resultat ;  //tableau qui contient tous les utilisateurs enregistrer dans la TABLE
    }


    public function query_insertion()
    {



        $requet = "INSERT INTO parcours (Code_usr,heure_depart,date_depart,Code_ville_depart,Code_ville_arrive,fume,bagage,animal,etat,nbr_place,description,tarif) VALUES (:code_usr,:heure_depart,:date_depart,:code_ville_depart,:code_ville_arrive,:fume,:bagage,:animal,:etat,:nbr_place,:description,:tarif)";

        $q = $this->getPDO()->prepare($requet);

        $q->execute(array(
            ':code_usr' => $this->getCODE_USR(),
            ':heure_depart' => $this->getHEURE_DEPART(),
            ':date_depart' => $this->getDATE_DEPART(),
            ':code_ville_depart' => $this->getCODE_VILLE_DEPART(),
            ':code_ville_arrive' => $this->getCODE_VILLE_ARRIVE(),
            ':fume' => $this->getFUME(),
            ':bagage' => $this->getBAGAGE(),
            ':animal' => $this->getANIMAL(),
            ':etat' => $this->getETAT(),
            ':nbr_place' => $this->getNBR_PLACE(),
            ':description' => $this->getDESCRIPTION(),
            ':tarif' => $this->getTARIF()


        ));

    }

    public function UpdateDate($code_parcours,$date_depart){

        $sql ="UPDATE parcours SET date_depart=".$date_depart." WHERE Code_parcours =".$code_parcours;
        $q = $this->getPDO()->exec($sql);
    }
    public function UpdateVilleDep($code_parcours,$code_ville_depart){
        $sql ="UPDATE parcours SET code_ville_depart=".$code_ville_depart." WHERE Code_parcours =".$code_parcours;
        $q = $this->getPDO()->exec($sql);
    }
    public function UpdateVilleArr($code_parcours,$code_ville_arrive){
        $sql ="UPDATE parcours SET code_ville_arrive=".$code_ville_arrive." WHERE Code_parcours =".$code_parcours;
        $q = $this->getPDO()->exec($sql);
    }
    public function UpdateHeure($code_parcours,$heure_depart){
        $sql ="UPDATE parcours SET heure_depart=".$heure_depart." WHERE Code_parcours =".$code_parcours;
        $q = $this->getPDO()->exec($sql);
    }
    public function query_delete_parcours($code_parcours)
    {
        $requet="DELETE FROM parcours WHERE Code_parcours=".$code_parcours;
        $q = $this->getPDO()->exec($requet);
    }
    public function Reservation(){
        
            $nb_place = $this->getNBR_PLACE() - 1;
            $code_parcours = $this->getCodeParcours();
            $sql = "UPDATE parcours SET nbr_place=" . $nb_place . " WHERE Code_parcours =" . $code_parcours;
            $q = $this->getPDO()->exec($sql);


    }

}

?>