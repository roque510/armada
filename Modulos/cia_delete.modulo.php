<?php
require_once ('medoo.php');
require_once('funciones.php');
require_once('config.php');	

global $database;
$cia_id = $_GET["cia_id"];
$database->delete("cias", ["cias.cia_id" => $cia_id]);	
echo " <script> window.location='?pg=mant_cias';</script>";
?>