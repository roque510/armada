<?php 
require('config.php');
require_once('funciones.php');
require_once('medoo.php');
$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);



$usr = $_POST['usr']; //done
$pnombre = $_POST['pnombre']; //done
$snombre = $_POST['snombre']; //done
$papellido = $_POST['papellido']; //done
$sapellido = $_POST['sapellido']; //done
$fechanac = $_POST['fechanac']; //done
$correo = $_POST['correo']; //done
$tipo_id = $_POST['tipo_id']; //done
$genero = $_POST['genero']; //done
$estado_civil = $_POST['estado_civil']; //done
$id = $_POST['id'];//done
$nivel_educativo = $_POST['nivel_educativo'];//done
$canal_venta = $_POST['canal_venta'];//done
$tipo_cliente = $_POST['tipo_cliente'];//done

$nacionalidad = $_POST['nacionalidad'];//done

$database->update("entidades", [
  "entidad_primer_nombre" => $pnombre,
  "entidad_segundo_nombre" => $snombre,
  "entidad_primer_apellido" => $papellido, 
  "entidad_segund_apellido" => $sapellido,
  "estado_civil_id" => $estado_civil,
  "entidad_genero" => $genero,  
  "entidad_correo" => $correo,
  "entidad_fecha_nacimiento" => $fechanac,
  "entidad_nacionalidad" => $nacionalidad,  
  "entidad_tipo_id" => $tipo_id
], [
	"entidad_id" => $usr
]);

$database->update("clientes", [
  "nivel_edu_id" => $nivel_educativo
], [
	"entidad_id" => $usr
]);

$database->update("identificaciones", [
  "identificacion_numero" => $id
], [
	"entidad_id" => $usr
]);

$database->update("solicitudes", [
  "solicitud_canal_id" => $canal_venta
  
], [
	"entidad_id" => $usr
]);


	$arr = array ('response'=>'correcto','user'=> $usr, 'comment'=> $fechanac);
	echo json_encode($arr);
//insert en telefonos primero
// insert en entidades_telefonos

 ?>











