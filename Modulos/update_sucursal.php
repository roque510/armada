<?php
require_once ('../medoo.php');
require_once('../config.php');
global $database;
 //	$cia_id = $_POST["cia_id"];	
 	//echo 'PHP</br>';

 	$sucursal_id = $_POST["sucursal_id"];
 	$usuario_cia = $_POST["usuario_cia"];
 	$usuario_id = $_POST["usuario_id"];

 	$datas = $database->select("usuarios",["usuarios.usuario_alias"],["usuarios.usuario_id" => $usuario_id]);
 	foreach($datas as $data)
	{
		$alias = $data["usuario_alias"];
	}	

	//echo $alias.'</br>';
 	//echo $usuario_cia.'</br>';
 	//echo $usuario_id.'</br>';

 	$database->delete("usuarios_sucursales", ["AND"=>["usuario_id" => $usuario_id,"cia_id" => $usuario_cia]]);	

	foreach ($_POST["sucursal_id"] as $key => $value){
 		//echo $value[0].'</br>';		

 		$last_user_id = $database->insert("usuarios_sucursales",["usuario_id" => $usuario_id,
								  "cia_id" => $usuario_cia, "sucursal_id" => $value[0]]);		
	}			
 	
@header('Location:../?pg=edit_seguridad&usr='.$alias.'&usrid='.$usuario_id);
?>