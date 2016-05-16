<?php
require_once ('medoo.php');
      require_once('funciones.php');
require_once('config.php');
session_start();

$estado = "1";
$id = "";
$pasa = "ni paso";

if (isset($_POST['radio'])) {
	$estado = $_POST['radio'];
	$pasa = "pasa";
}




if (isset($_POST['id'])) {
	$id = $_POST['id'];
}

if ($estado == 0) {
	$estado++;
}

$database->update("solicitudes", [
	"estatus_id" => $estado
], [
	"entidad_id" => $id
]);

$arr = array ('response'=>'correcto','estado'=> $estado ,'pasa'=> $pasa);
	echo json_encode($arr);



?>