<?php
require_once ('medoo.php');
      require_once('funciones.php');
require_once('config.php');
session_start();

$usuario = "";
$entidad = "";
$estatus = "";
$solicitud = "";

if (isset($_POST['usuario_id'])) {
	$usuario = $_POST['usuario_id'];

}

if (isset($_POST['estatus_id'])) {
	$estatus = $_POST['estatus_id'];

}

if (isset($_POST['entidad_id'])) {
	$entidad = $_POST['entidad_id'];

}

if (isset($_POST['solicitud_id'])) {
	$solicitud = $_POST['solicitud_id'];

}




$database->insert("usuarios_solicitudes", [
	"usuario_id" => $usuario,
	"estatus_id" => $estatus,
	"entidad_id" => $entidad,
	"solicitud_id" => $solicitud,
	"#fecha_solicitud_tomada" => "CURDATE()"
]);

$database->update("solicitudes", ["estatus_id" => 9],["solicitud_id" => $solicitud]);

$arr = array ('response'=>'correcto');
	echo json_encode($arr);



?>