<?php
require_once ('medoo.php');
require_once('funciones.php');
require_once('config.php');	

global $database;


	


	
 	$sucursal_id = $_GET["sucursal_id"];
 	$sucursal_id = $_GET["sucursal_id"];
 	$cia_id = $_GET["cia_id"];

	$database->delete("sucursales", ["sucursales.sucursal_id" => $sucursal_id]);	
	
	echo " <script> window.location='?pg=sucursales_cias&cia_id=".$cia_id."';</script>";
	

?>