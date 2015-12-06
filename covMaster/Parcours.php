<?php


class Parcours {
    private $num_p;
    private $dt_dep;
    private $hr_dep;
    private $id_user;
    private $ville_dep;
    private $ville_arr;
    private $score;
    private $tarif;
    private $animal,$fume,$bagage;
    private $nbr_place;
    private $description;

    function __construct()
    {
    }

    /**
     * @return mixed
     */
    public function getNumP()
    {
        return $this->num_p;
    }

    /**
     * @return mixed
     */
    public function getTarif()
    {
        return $this->tarif;
    }

    /**
     * @param mixed $tarif
     */
    public function setTarif($tarif)
    {
        $this->tarif = $tarif;
    }

    /**
     * @return mixed
     */
    public function getHrDep()
    {
        return $this->hr_dep;
    }

    /**
     * @param mixed $hr_dep
     */
    public function setHrDep($hr_dep)
    {
        $this->hr_dep = $hr_dep;
    }

    /**
     * @return mixed
     */
    public function getAnimal()
    {
        return $this->animal;
    }

    /**
     * @param mixed $animal
     */
    public function setAnimal($animal)
    {
        $this->animal = $animal;
    }

    /**
     * @return mixed
     */
    public function getFume()
    {
        return $this->fume;
    }

    /**
     * @param mixed $fume
     */
    public function setFume($fume)
    {
        $this->fume = $fume;
    }

    /**
     * @return mixed
     */
    public function getBagage()
    {
        return $this->bagage;
    }

    /**
     * @param mixed $bagage
     */
    public function setBagage($bagage)
    {
        $this->bagage = $bagage;
    }

    /**
     * @return mixed
     */
    public function getNbrPlace()
    {
        return $this->nbr_place;
    }

    /**
     * @param mixed $nbr_place
     */
    public function setNbrPlace($nbr_place)
    {
        $this->nbr_place = $nbr_place;
    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param mixed $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * @param mixed $num_p
     */
    public function setNumP($num_p)
    {
        $this->num_p = $num_p;
    }

    /**
     * @return mixed
     */
    public function getDtDep()
    {
        return $this->dt_dep;
    }

    /**
     * @param mixed $dt_dep
     */
    public function setDtDep($dt_dep)
    {
        $this->dt_dep = $dt_dep;
    }

    /**
     * @return mixed
     */
    public function getIdUser()
    {
        return $this->id_user;
    }

    /**
     * @param mixed $id_user
     */
    public function setIdUser($id_user)
    {
        $this->id_user = $id_user;
    }

    /**
     * @return mixed
     */
    public function getVilleDep()
    {
        return $this->ville_dep;
    }

    /**
     * @param mixed $ville_dep
     */
    public function setVilleDep($ville_dep)
    {
        $this->ville_dep = $ville_dep;
    }

    /**
     * @return mixed
     */
    public function getVilleArr()
    {
        return $this->ville_arr;
    }

    /**
     * @param mixed $ville_arr
     */
    public function setVilleArr($ville_arr)
    {
        $this->ville_arr = $ville_arr;
    }

    /**
     * @return mixed
     */
    public function getScore()
    {
        return $this->score;
    }

    /**
     * @param mixed $score
     */
    public function setScore($score)
    {
        $this->score = $score;
    }



}