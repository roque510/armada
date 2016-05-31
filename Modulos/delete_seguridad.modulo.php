<?php
require_once ('medoo.php');
require_once('funciones.php');
require_once('config.php');
global $database;
	
 	$usuario_alias = $_GET["usuarioid"];
 	$datas = $database->select("usuarios",["usuarios.usuario_id"],["usuarios.usuario_alias" => $usuario_alias]);
	$id = 0;
	foreach($datas as $data)
	{
		$id = $data["usuario_id"]."<br/>";
	}
	
	$database->delete("usuarios_cias", ["usuario_id" => $id]);
	$database->delete("usuarios_grupos", ["usuario_id" => $id]);
	$database->delete("usuarios", ["usuario_id" => $id]);
echo "<script>window.location.href = '../?mod=mant_seguridad';</script>";
?>