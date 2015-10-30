<?php
/**
 * Created by PhpStorm.
 * User: Belhassen
 * Date: 29/10/2015
 * Time: 23:16
 */

class UserDAO {

    public function __construct($dsn, $user=NULL, $pass=NULL, $driver_options=NULL) {
        $this->PDO = new PDO($dsn, $user, $pass, $driver_options);
        $this->numExecutes = 0;
        $this->numStatements = 0;
    }
    public function __call($func, $args) {
        return call_user_func_array(array(&$this->PDO, $func), $args);
    }
    public function prepare() {
    }
    public function query() {
    }
    public function exec() {
    }

}