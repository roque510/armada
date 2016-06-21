<?php
require_once ('../medoo.php');
require_once('../config.php');
global $database;
- 	$cia_id = $_POST["cia_id"];	
	$cia_descripcion = strtoupper($_POST["cia_descripcion"]);		
	$cia_abreviatura = strtoupper($_POST["cia_abreviatura"]);		
	$cia_rtn = strtoupper($_POST["cia_rtn"]);		
	$cia_rubro = strtoupper($_POST["cia_rubro"]);		
	$cia_direccion = strtoupper($_POST["cia_direccion"]);		
	$cia_telefono = strtoupper($_POST["cia_telefono"]);		
	$cia_telefono1 = strtoupper($_POST["cia_telefono1"]);
	$cia_contacto = strtoupper($_POST["cia_contacto"]);
	$cia_generico1 = strtoupper($_POST["cia_generico1"]);
	$cia_generico2 = strtoupper($_POST["cia_generico2"]);
	$cia_estatus_id = strtoupper($_POST["cia_estatus_id"]);

/*	echo $cia_id . '<br>';
	echo $cia_descripcion . '<br>';
	echo $cia_abreviatura . '<br>';
	echo $cia_rtn . '<br>';
	echo $cia_rubro . '<br>';
	echo $cia_direccion . '<br>';
	echo $cia_telefono . '<br>';
	echo $cia_telefono1 . '<br>';
	echo $cia_contacto . '<br>';
	echo $cia_generico1 . '<br>';
	echo $cia_generico2 . '<br>';
	echo $cia_estatus_id . '<br>'; */


	$last_user_id = $database->update("cias",["cias.cia_descripcion" => $cia_descripcion,
												  "cias.cia_abreviatura" => $cia_abreviatura,
												  "cias.cia_rtn" => $cia_rtn,
												  "cias.cia_rubro" => $cia_rubro,
												  "cias.cia_direccion" => $cia_direccion,
												  "cias.cia_telefono" => $cia_telefono,
												  "cias.cia_telefono1" =>$cia_telefono1,
												  "cias.cia_contacto" => $cia_contacto,
												  "cias.cia_generico1" => $cia_generico1,
												  "cias.cia_generico2" => $cia_generico2,
												  "cias.estatus_id" => $cia_estatus_id],
												  ["cias.cia_id" => $cia_id]);

@header('Location:../?pg=mant_cias');
?>