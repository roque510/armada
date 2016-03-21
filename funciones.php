<?php
/**
 * Created by PhpStorm.
 * User: Armando Roque
 * Date: 20/04/15
 * Time: 11:39
 */

function modulo($modulo, $cssclase="",$cssid="")
{


    if($cssclase!=""){
        $cssclase='class="'.$cssclase.'"';
    }

    if($cssid!=""){
        $cssid='id="'.$cssid.'"';
    }
    echo '<div '.$cssclase.' '.$cssid.'>';
    require('Modulos/'.$modulo.".modulo.php");
    echo '</div>';

}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

function initDB(){
      require_once 'medoo.php';
      require_once 'config.php';
      GLOBAL $DB,$SVR,$USR,$PW;
      
        $database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);
      return $database;
}

function test_query() {
    $mysqli = new mysqli($SVR, $USR, $PW, $DB);
    $query = "SELECT COUNT(`cia_id`) FROM `cias`";
    $result = $mysqli->query($query);
    $row = $result->fetch_array(0);
    return $row;
}

?>