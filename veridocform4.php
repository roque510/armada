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
$tiporelacionA = $_POST['tiporelacionA']; //done
$antiguedadRelA = $_POST['antiguedadRelA']; //done
$pnombreA = $_POST['pnombreA']; //
$snombreA = $_POST['snombreA']; //done
$papellidoA = $_POST['papellidoA'];//done
$sapellidoA = $_POST['sapellidoA'];//done
$nidA = $_POST['nidA'];//done
$fechanacA = $_POST['fechanacA'];//done
$tipotelA = $_POST['tipotelA'];//done
$telA = $_POST['telA'];//done
$extA = $_POST['extA'];//done
$hcA = $_POST['hcA'];//done

$tiporelacionB = $_POST['tiporelacionB']; //done
$antiguedadRelB = $_POST['antiguedadRelB']; //done
$pnombreB = $_POST['pnombreB']; //
$snombreB = $_POST['snombreB']; //done
$papellidoB = $_POST['papellidoB'];//done
$sapellidoB = $_POST['sapellidoB'];//done
$nidB = $_POST['nidB'];//done
$fechanacB = $_POST['fechanacB'];//done
$tipotelB = $_POST['tipotelB'];//done
$telB = $_POST['telB'];//done
$extB = $_POST['extB'];//done
$hcB = $_POST['hcB'];//done



$entidadA = $database->select("referencias_personales","*",["entidad_id" => $usr ]);

$database->update("referencias_personales", [  
  "referencia_relacion_id" => $tiporelacionA,  
  "referencias_personales_antiguedad" => $antiguedadRelA,
  "estatus_id" => 1,
  "referencia_pnombre" => $pnombreA,
  "referencia_snombre" => $snombreA,
  "referencia_papellido" => $papellidoA,
  "referencia_sapellido" => $sapellidoA,
  "referencia_nid" => $nidA,
  "referencia_fechanac" => $fechanacA,
  "referencia_tipo_tel" => $tipotelA,
  "referencia_telefono" => $telA,
  "referencia_extension" => $extA,
  "referencia_hora_contacto" => $hcA

],[
  "referencia_personal_id" => $entidadA[0]["referencia_personal_id"]
]);

$database->update("referencias_personales", [  
  "referencia_relacion_id" => $tiporelacionB,  
  "referencias_personales_antiguedad" => $antiguedadRelB,
  "estatus_id" => 1,
  "referencia_pnombre" => $pnombreB,
  "referencia_snombre" => $snombreB,
  "referencia_papellido" => $papellidoB,
  "referencia_sapellido" => $sapellidoB,
  "referencia_nid" => $nidB,
  "referencia_fechanac" => $fechanacB,
  "referencia_tipo_tel" => $tipotelB,
  "referencia_telefono" => $telB,
  "referencia_extension" => $extB,
  "referencia_hora_contacto" => $hcB

],[
  "referencia_personal_id" => $entidadA[1]["referencia_personal_id"]
]);


	$arr = array ('response'=>'correcto','user'=> $usr, 'comment'=> $extB);
	echo json_encode($arr);
//insert en telefonos primero
// insert en entidades_telefonos

 ?>
