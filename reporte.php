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

$database->update("verificacion_telefonos",[
	"telpersonal1" => $_POST['telspersonal1'],
	"telpersonal2" => $_POST['telspersonal2'],
	"telspersonales" => $_POST['telspersonal3'],
	"teltrabajo" => $_POST['teltrabajo'],
	"telref1" => $_POST['telref1'],
	"telref2" => $_POST['telref2']
	]);


	$arr = array ('response'=>'correcto','user'=> $usr, 'comment'=> $usr);
	echo json_encode($arr);
//insert en telefonos primero
// insert en entidades_telefonos

 ?>
