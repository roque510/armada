<?php 

require_once ('medoo.php');
require_once('funciones.php');
require_once('config.php');

$usr = "";
if (isset($_POST['usr'])) {
	$usr = $_POST['usr'];
}
$name = "";
if (isset($_POST['name'])) {
	$name = $_POST['name'];
}
$status = 8;

$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);

$mensaje = "";

$database->update("solicitudes", ["estatus_id" => $status,"soliciutd_comentario" => $name],["entidad_id" => $usr]);

$arr = array ('response'=>'Correct','comment'=> $name.' '.$usr );
	echo json_encode($arr);

 ?>