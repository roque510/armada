<?php
require_once ('medoo.php');
require_once('funciones.php');
require_once('config.php');

global $database;

	echo "<b>usuario_nombre:</b> ".$_POST["usuario_nombres"] ."<br>";
 	$usuario_nombres = $_POST["usuario_nombres"];
	echo "<b>usuario_apellido</b>: ".$_POST["usuario_apellidos"] ."<br>";
	$usuario_apellidos = $_POST["usuario_apellidos"];
	echo "<b>usuario_alias:</b> ".$_POST["usuario_alias"] ."<br>";
	$usuario_alias = $_POST["usuario_alias"];
	echo "<b>usuario_password:</b> ".$_POST["usuario_password"] ."<br>";
	$usuario_password = md5($_POST["usuario_password"]);
	echo "<b>usuario_cell:</b> ".$_POST["usuario_cell"] ."<br>";
	$usuario_cell = $_POST["usuario_cell"];
	if (isset($_POST["usuario_telefono"])){
		$usuario_telefono = $_POST["usuario_telefono"];	
	}else{
		$usuario_telefono = "1";
	}
	echo "<b>usuario_telefono:</b> ".$_POST["usuario_telefono"] ."<br>";
	
	echo "<b>usuario_estatus:</b> ".$_POST["usuario_estatus"] ."<br>";	
	$usuario_estatus = $_POST["usuario_estatus"];
	if (isset($_POST["usuario_isAdmin"])){
		echo "<b>usuario_isAdmin:</b> 1<br>";
		$usuario_isadmin = $_POST["usuario_isAdmin"];
	}
	else{
		echo "<b>usuario_isAdmin:</b> 0<br>";
		$usuario_isadmin = "0";
	}
//recordar agregar el campo de la contraseña ya encritpada con laa nueva base de datos.
	$last_user_id = $database->insert("usuarios",["usuarios.usuario_alias" => $usuario_alias,
												  "usuarios.usuario_nombre" => $usuario_nombres,
												  "usuarios.usuario_apellido" => $usuario_apellidos,
												  "usuarios.usuario_cel" => $usuario_cell,
												  "usuarios.estatus_id" => $usuario_estatus,
												  "usuarios.usuario_isadmin" => $usuario_isadmin]);
	/*
		$last_user_id = $database->insert("usuarios",["usuarios.usuario_alias" => $usuario_alias,
												  "usuarios.usuario_nombres" => $usuario_nombres,
												  "usuarios.usuario_apellidos" => $usuario_apellidos,
												  "usuarios.usuario_password" => $usuario_password,
												  "usuarios.usuario_cel" => $usuario_cell,
												  "usuarios.estatus_id" => $usuario_estatus,
												  "usuarios.usuario_isadmin" => $usuario_isadmin]);
	*/
	//---------------Insert a tabla de usuarios -----------------------------

	echo "<b>usuario_cia_id(multiples): </b><br>";

	if (isset($_POST["usuario_cia_id"])){
		foreach ($_POST["usuario_cia_id"] as $key => $value) {
			echo $value."<br>";
		} 	
	}else{
		echo 'en blanco<br>';
	}
	

	echo "<b>usuario_cia_id_asignadas:</b> <br>";

	if (isset($_POST["usuario_cia_id_asignadas"])){
		foreach ($_POST["usuario_cia_id_asignadas"] as $key => $value) {
			echo $value."<br>";
		} 
	}else{
		echo 'en blanco<br>';	
	}

	echo "<b>grupos_asignados_id:</b> <br>";

	if (isset($_POST["grupo_id_asignados"])){
		foreach ($_POST["grupo_id_asignados"] as $key => $value) {
			echo $value."<br>";
		} 
	}else{
		echo 'en blanco';
	}

	header('Location:.?mod=mant_seguridad');


?>