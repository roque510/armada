<?php 
require('config.php');
require_once('funciones.php');
require_once('medoo.php');
$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);


//SCORE BAJO: if score es menor a socre de correcto
//EDAD INSUFICIENTE: if edad < a 18
//INGRESO INSUFICIENTE: < 3000
//ANTIGUEDAD LABORAL MINIMA: < 3 meses
//LISTA NEGRA: lista de vime.



$usr = ""; //done

$arr = array ('response'=>'correcto','user'=> $usr, 'comment'=> 'hehe');
	echo json_encode($arr);
 ?>