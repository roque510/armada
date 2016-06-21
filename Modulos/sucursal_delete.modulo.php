<?php
require_once ('medoo.php');
require_once('funciones.php');
require_once('config.php');	

global $database;


	echo "<b>sucursal_id:</b> ".$_GET["sucursal_id"] ."<br>";


	if(isset($_GET["sucursal_id"])) echo "usuarioid is set\n";
	if(!empty($_GET["sucursal_id"])) echo "usuarioid is not empty";
 	$sucursal_id = $_GET["sucursal_id"];
 	$sucursal_id = $_GET["sucursal_id"];
 	$cia_id = $_GET["cia_id"];

	$database->delete("sucursales", ["sucursales.sucursal_id" => $sucursal_id]);
	
	header('Location: ?pg=sucursales_cias&cia_id='.$cia_id);
	//echo "<script>window.location.href = '../?mod=mant_cias';</script>";	

?>