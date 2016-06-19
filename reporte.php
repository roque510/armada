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



$usr = $_POST['usr']; //done


	$arr = array ('response'=>'correcto','user'=> $usr, 'comment'=> $usr);
	echo json_encode($arr);
//insert en telefonos primero
// insert en entidades_telefonos

 ?>
