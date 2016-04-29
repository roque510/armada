<?php
require_once ('medoo.php');
require_once('funciones.php');
require_once('config.php');

global $database;


	echo "<b>usuario_alias:</b> ".$_GET["usuarioid"] ."<br>";

	if(isset($_GET["usuarioid"])) echo "usuarioid is set\n";
	if(!empty($_GET["usuarioid"])) echo "usuarioid is not empty";

 	$usuario_alias = $_GET["usuarioid"];

 	$datas = $database->select("usuarios",["usuarios.usuario_id"],["usuarios.usuario_alias" => $usuario_alias]);
	$id = 0;
	foreach($datas as $data)
	{
		echo $id = $data["usuario_id"]."<br/>";
	}

	echo "<b>usuario_id</b>: ".$id."<br>";
	

?>