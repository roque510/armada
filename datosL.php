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

 $usr = $_POST['usuario'];
        $queryA = "SELECT concat(`entidad_primer_nombre`,' ', `entidad_segundo_nombre`,' ',`entidad_primer_apellido`,' ',`entidad_segund_apellido`) FROM `entidades` where `entidad_id` = ".$usr;
        $queryB = "SELECT `empleo_year`,`empleo_month` from `empleos` where `entidad_id` = ".$usr;

        $did = $database->select("entidades_direcciones", "*",["entidad_id" => $usr]);
        
        $queryC = "SELECT TIMESTAMPDIFF(YEAR, `direccion_antiguedad`, CURDATE()) AS age from `direcciones` where `direccion_id` = ".$did[0]["direccion_id"];
        
        $cliente = $database->select("clientes", "*",["entidad_id" => $usr]); 
        $empleo  = $database->select("empleos", "*",["entidad_id" => $usr]);

        $fpago = $database->select("frecuencias_pagos", ["frecuencia_pago_id","frecuencia_pago_descripcion"],["frecuencia_pago_id" => $empleo[0]["frecuencia_pago_id"]]);

        $entidad = $database->query($queryA)->fetchAll();
        $edadEmpleo = $database->query($queryB)->fetchAll();
        $edadDIR = $database->query($queryC)->fetchAll();
        //SELECT TIMESTAMPDIFF(YEAR, `entidad_fecha_nacimiento`, CURDATE()) AS age from `entidades` where `entidad_id` = 85
        $edad = $database->query("SELECT TIMESTAMPDIFF(YEAR, `entidad_fecha_nacimiento`, CURDATE()) AS age from `entidades` where `entidad_id` = ".$usr)->fetchAll();
        $entidadi = $database->select("entidades", "*",["entidad_id" => $usr]);
        $estadoCIV = $database->select("estados_civiles", ["estado_civil_descripcion"],["estado_civil_id" => $entidadi[0]["estado_civil_id"]]);
        $id = $database->select("identificaciones", "*",["entidad_id" => $usr]);




//limite sugerido linea_sugerida
// cuota sugerida cuota_sugerida
// id usuario
// usuario analista tomar de usuarios
// fecha de mod today

$limite = $_POST['linea_sugerida'];
$cuota = $_POST['cuota_sugerida'];
$usu = $_POST['usuario'];
$txt = "";

if (isset($_POST['textarea1'])) {
  $txt = $_POST['textarea1'];
}

$IDanalista = $database->get('usuarios_solicitudes','usuario_id',["entidad_id" => $usu]);
$analista = $database->get("usuarios", "usuario_alias", ["usuario_id" => $IDanalista]);

$database->update("clientes", [
  //"nivel_edu_id" => $_POST['nivel_educativo'],
  "cliente_cuota_sugerida" => $cuota,
  "cliente_limite_sugerido" => $limite, 
  "cliente_cuota" => $cuota,
  "cliente_limite_credito" => $limite, 
  "cliente_usuario_modificacion" => $analista,
  "cliente_fecha_modificacion" => date("Y-m-d H:i:s")
],["entidad_id" => $usu]);

$database->update("solicitudes", ["subestatus_id" => 1, "solicitud_comentario_analista" => $txt ],["entidad_id" => $usu]);
     






$arr = array ('response'=> 'success','user'=> $usu, 'comment'=> $txt);
	echo json_encode($arr);
 ?>