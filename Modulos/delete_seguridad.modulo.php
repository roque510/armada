<?php
require_once ('medoo.php');
require_once('funciones.php');
require_once('config.php');

global $database;

	echo "<b>usuario_alias:</b> ".$_GET["usuarioid"] ."<br>";
 	$usuario_alias = $_GET["usuarioid"];

 	$datas = $database->select("usuarios",["usuarios.usuario_id"],["usuarios.usuario_alias" => $usuario_alias]);
	$id = 0;
	foreach($datas as $data)
	{
		$id = $data["usuario_id"]."<br/>";
	}

	echo "<b>usuario_id</b>: ".$id."<br>";

	$database->delete("usuarios_cias", ["usuario_id" => $id]);
	$database->delete("usuarios_grupos", ["usuario_id" => $id]);
	$database->delete("usuarios", ["usuario_id" => $id]);
	

	header('Location:.?mod=mant_seguridad');

?>