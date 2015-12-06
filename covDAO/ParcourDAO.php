<?php
use \PDO;

class ParcourDAO {
    private $db_name;
    private $db_user;
    private $db_password;
    private $db_host;
    private $pdo;
    private $parcour;


    public function __construct(){
        $this->db_name='co_voiturage';
        $this->db_host='localhost';
        $this->db_user='root';
        $this->db_password='';
        $this->parcour = new Parcours();




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


    /**************  Enregistrer tous le contenus de la table PARCOURS dans un tableau $resultat  **************/
    public function query_affichage_complet()
    {
        $resultat=$this->getPDO()->query("select * from parcours");
        return $resultat ;  //tableau qui contient tous les utilisateurs enregistrer dans la TABLE
    }


    public function query_insertion()
    {



        $requet = "INSERT INTO parcours (Code_usr,heure_depart,date_depart,Code_ville_depart,Code_ville_arrive,fume,bagage,animal,score,nbr_place,description,tarif) VALUES (:code_usr,:heure_depart,:date_depart,:code_ville_depart,:code_ville_arrive,:fume,:bagage,:animal,:score,:nbr_place,:description,:tarif)";

        $q = $this->getPDO()->prepare($requet);

        $q->execute(array(
            ':code_usr' => $this->parcour->getIdUser(),
            ':heure_depart' => $this->parcour->getHrDep(),
            ':date_depart' => $this->parcour->getDtDep(),


            ':code_ville_depart' => $this->parcour->getVilleDep(),
            ':code_ville_arrive' => $this->parcour->getVilleArr(),


            ':fume' => $this->parcour->getFume(),
            ':bagage' => $this->parcour->getBagage(),
            ':animal' => $this->parcour->getAnimal(),
            ':score' => $this->parcour->getScore(),

            ':nbr_place' => $this->parcour->getNbrPlace(),
            ':description' => $this->parcour->getDescription(),
            ':tarif' => $this->parcour->getTarif()


        ));

    }




        public function UpdateVilleDepart($ville_dep)
        {
            $sql = "UPDATE parcours SET code_ville_depart=" . $this->parcour->setVilleDep($ville_dep) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function UpdateVilleArrive($ville_arr)
        {
            $sql = "UPDATE parcours SET code_ville_arrive=" . $this->parcour->setVilleArr($ville_arr) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function UpdateDate($date)
        {

            $sql = "UPDATE parcours SET date_depart=" . $this->parcour->setDtDep($date) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function UpdateHeure($hr_dep)
        {
            $sql = "UPDATE parcours SET heure_depart=" . $this->parcour->setHrDep($hr_dep) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function UpdateTarif($tarif)
        {
            $sql = "UPDATE parcours SET tarif=". $this->parcour->setTarif($tarif) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function UpdateFume($fume)
        {
            $sql = "UPDATE parcours SET fume=" . $this->parcour->setFume($fume) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function UpdateBagage($bagage)
        {
            $sql = "UPDATE parcours SET bagage=" . $this->parcour->setBagage($bagage) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }
         public function UpdateAnimal($animal){
            $sql = "UPDATE parcours SET animal=" . $this->parcour->setBagage($animal) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function UpdateDiscription($disc)
        {
            $sql = "UPDATE parcours SET description=" . $this->parcour->setDescription($disc) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function UpdateNbrePlace($nbr_place)
        {
            $sql = "UPDATE parcours SET nbr_place=" . $this->parcour->setNbrPlace($nbr_place) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function UpdateScore($score)
        {
            $sql = "UPDATE parcours SET score=" . $this->parcour->setScore($score) . " WHERE Code_parcours =" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);
        }

        public function query_delete_parcours()
        {
            $requet = "DELETE FROM parcours WHERE Code_parcours=" . $this->parcour->getNumP();
            $q = $this->getPDO()->exec($requet);
        }

    public function Reservation(){
        
            $nb_place = $this->parcour->getNbrPlace() - 1;
            $this->parcour->setNbrPlace($nb_place);

            $sql = "UPDATE parcours SET nbr_place=".$nb_place." WHERE Code_parcours =" .$this->parcour->getNumP();
            $q = $this->getPDO()->exec($sql);


    }

}

?>
