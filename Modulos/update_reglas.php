<?php
require_once ('../medoo.php');
require_once('../config.php');
global $database;
 	$regla_edad = $_POST["regla_edad"];	
	$regla_antigudad_laboral = strtoupper($_POST["regla_antigudad_laboral"]);		
	$regla_ingreso_salarial = strtoupper($_POST["regla_ingreso_salarial"]);

	//echo $regla_edad. '<br>';
	//echo $regla_antigudad_laboral. '<br>';
	//echo $regla_ingreso_salarial. '<br>';

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


$last_user_id = $database->update("config_reglas",["config_regla_valor" => $regla_edad],
												  ["config_regla_descripcion" => 'EDAD']);

$last_user_id = $database->update("config_reglas",["config_regla_valor" => $regla_antigudad_laboral],
												  ["config_regla_descripcion" => 'ANTIGUEDAD LABORAL']);

$last_user_id = $database->update("config_reglas",["config_regla_valor" => $regla_ingreso_salarial],
												  ["config_regla_descripcion" => 'INGRESO SALARIAL']);
												  

@header('Location:../?pg=home');
?>