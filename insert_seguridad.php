<?php
require_once ('medoo.php');
require_once('config.php');
global $database;	
 	$usuario_nombres = $_POST["usuario_nombres"];	
	$usuario_apellidos = $_POST["usuario_apellidos"];	
	$usuario_alias = $_POST["usuario_alias"];	
	$usuario_password = md5($_POST["usuario_password"]);	
	$usuario_cell = $_POST["usuario_cell"];
	if (isset($_POST["usuario_telefono"])){
		$usuario_telefono = $_POST["usuario_telefono"];	
	}else{
		$usuario_telefono = "1";
	}	
	$usuario_estatus = $_POST["usuario_estatus"];
	if (isset($_POST["usuario_isAdmin"])){
		$usuario_isadmin = 1;	
	}
	else{
		$usuario_isadmin = 0;		
	}
	$last_user_id = $database->insert("usuarios",["usuarios.usuario_alias" => strtolower($usuario_alias),
												  "usuarios.usuario_nombre" => strtoupper($usuario_nombres),
												  "usuarios.usuario_apellido" => strtoupper($usuario_apellidos),
												  "usuarios.usuario_cel" => strtoupper($usuario_cell),
												  "usuarios.usuario_telefono" => strtoupper($usuario_telefono),
												  "usuarios.usuario_pass" => strtolower($usuario_password),
												  "usuarios.estatus_id" => strtoupper($usuario_estatus),
												  "usuarios.usuario_isadmin" => strtoupper($usuario_isadmin)]);	
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
	}
	header('Location: ../?mod=mant_seguridad');
	?>