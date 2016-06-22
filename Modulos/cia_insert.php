<?php
require_once ('../medoo.php');
require_once('../config.php');
global $database;	
	
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

	$last_user_id = $database->insert("cias",["cias.cia_descripcion" => $cia_descripcion,
												  "cias.cia_abreviatura" => $cia_abreviatura,
												  "cias.cia_rtn" => $cia_rtn,
												  "cias.cia_rubro" => $cia_rubro,
												  "cias.cia_direccion" => $cia_direccion,
												  "cias.cia_telefono" => $cia_telefono,
												  "cias.cia_telefono1" => $cia_telefono1,
												  "cias.cia_contacto" => $cia_contacto,
												  "cias.cia_generico1" => $cia_generico1,
												  "cias.cia_generico2" => $cia_generico2,
												  "cias.estatus_id" => '1']);
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
	header('Location: ../?mod=mant_cias');
	?>