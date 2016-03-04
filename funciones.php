<?php
/**
 * Created by PhpStorm.
 * User: Armando Roque
 * Date: 20/04/15
 * Time: 11:39
 EXAMPLE
 $datas = $database->select("pais", ["pais_nombre","pais_id"], ["pais_id[>]" => 0]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["pais_id"].'">'.$data["pais_nombre"].'</option>';
          }
 */

function initDB(){
    require_once 'medoo.php';
      require_once 'config.php';
      
        $database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);
}

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


?>