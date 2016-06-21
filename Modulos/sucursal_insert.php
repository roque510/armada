<?php
require_once ('../medoo.php');
require_once('../config.php');
global $database;	
	
	$sucursal_descripcion = strtoupper($_POST["sucursal_descripcion"]);
	$sucursal_abreviatura = strtoupper($_POST["sucursal_abreviatura"]);
	$sucursal_telefono1 = strtoupper($_POST["sucursal_telefono1"]);	
	$sucursal_telefono2 = strtoupper($_POST["sucursal_telefono2"]);	
	$sucursal_encargado = strtoupper($_POST["sucursal_encargado"]);
	$sucursal_pais_id = strtoupper($_POST["pais_id"]);
	$sucursal_depto_id = strtoupper($_POST["departamento_id"]);
	$sucursal_municipio_id = strtoupper($_POST["municipio_id"]);
	$sucursal_direccion = strtoupper($_POST["sucursal_direccion"]);
	$cia_id = $_POST["cia_id"];

	echo $sucursal_descripcion . '<br>';
	echo $sucursal_abreviatura . '<br>';
	echo $sucursal_telefono1 . '<br>';
	echo $sucursal_telefono2 . '<br>';
	echo $sucursal_encargado . '<br>';
	echo $sucursal_pais_id . '<br>';
	echo $sucursal_depto_id . '<br>';
	echo $sucursal_municipio_id . '<br>';
	echo $sucursal_direccion . '<br>';
	echo $cia_id . '<br>';


	$last_user_id = $database->insert("sucursales",["sucursales.sucursal_descripcion" => $sucursal_descripcion,
												  "sucursales.sucursal_abreviatura" => $sucursal_abreviatura,
												  "sucursales.sucrsal_telefono1" => $sucursal_telefono1,
												  "sucursales.sucrsal_telefono2" => $sucursal_telefono2,
												  "sucursales.sucrsal_encargado" => $sucursal_encargado,
												  "sucursales.sucursal_direccion" => $sucursal_direccion,
												  "sucursales.pais_id" => $sucursal_pais_id,
												  "sucursales.depto_id" => $sucursal_depto_id,
												  "sucursales.municipio_id" => $sucursal_municipio_id,
												  "sucursales.cia_id" => $cia_id,
												  "sucursales.estatus_id" => '1']);
	
	var_dump($database->error());												  
	/*
	if (is_null($database->error()[1]) && is_null($database->error()[2])){		
	}else{		
	}
	$datas = $database->select("usuarios",["usuarios.usuario_id"],["usuarios.usuario_alias" => $usuario_alias]);
	$id = 0;
	foreach($datas as $data)
	{
	$id = $data["usuario_id"];
	}
	
	if (isset($_POST["usuario_cia_id"])){
		foreach ($_POST["usuario_cia_id"] as $key => $value) {			
			$last_user_id = $database->insert("usuarios_cias",["usuarios_cias.usuario_id" => $id,
								  "usuarios_cias.cia_id" => $value]);
	} 	
	}else{		
	}
	$compañias = 0;
	if (isset($_POST["usuario_cia_id_asignadas"])){
		foreach ($_POST["usuario_cia_id_asignadas"] as $key => $value) {			
			$compañias ++;
		} 
	}else{		
	}
	$datas = $database->select("usuarios",["usuarios.usuario_id"],["usuarios.usuario_alias" => $usuario_alias]);
	$id = 0;
	foreach($datas as $data)
	{
		$id = $data["usuario_id"];
	}
	$grupos=0;
	if (isset($_POST["grupo_id_asignados"])){
		foreach ($_POST["grupo_id_asignados"] as $key => $value) {			
			$grupos++;
			$last_user_id = $database->insert("usuarios_grupos",["usuarios_grupos.usuario_id" => $id,
												  "usuarios_grupos.grupo_id" => $value]);
		} 
	}else{		
	}*/
	header('Location: ../?pg=sucursales_cias&cia_id='.$cia_id);
	?>