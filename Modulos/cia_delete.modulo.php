<?php
require_once ('medoo.php');
require_once('funciones.php');
require_once('config.php');	

global $database;


	echo "<b>cia_id:</b> ".$_GET["cia_id"] ."<br>";

	if(isset($_GET["cia_id"])) echo "usuarioid is set\n";
	if(!empty($_GET["cia_id"])) echo "usuarioid is not empty";
 	$cia_id = $_GET["cia_id"];

	$database->delete("cias", ["cias.cia_id" => $cia_id]);
	
	header('Location: ?mod=mant_cias');
	//echo "<script>window.location.href = '../?mod=mant_cias';</script>";	

?>