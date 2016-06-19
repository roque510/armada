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
$tpropiedad = $_POST['tpropiedad']; //done
$nregistro = $_POST['nregistro']; //done
$vpropiedad = $_POST['vpropiedad']; //
$pais = $_POST['pais']; //done
$dpto = $_POST['dpto'];//done
$mun = $_POST['mun'];//done
$dir = $_POST['dir'];//done
$cp = $_POST['cp'];//done
$pr = $_POST['pr'];//done
$nc = $_POST['nc'];//done

$observaciones = $_POST['observaciones'];//done

$dirID = $database->get("propiedades",["direccion_id"],["entidad_id" => $usr ]);

$database->update("direcciones", [
  "direccion_descripcion" => $dir,
  "direccion_tipo_id" => 1,
  "pais_id" => $pais,
  "depto_id" => $dpto,
  "municipio_id" => $mun,
  "direccion_codigo_postal" => $cp,
  "direccion_punto_referencia" => $pr,
  "direccion_numero_casa" => $nc,
  "estatus_id" => 4
  
],[
  "direccion_id" => $dirID
]);

$database->update("propiedades", [
  "propiedad_tipo_id" => $tpropiedad,
  "propiedad_valor" => $vpropiedad,
  "propiedad_registro" => $nregistro,
  "propiedad_comentario" => $observaciones
  
],[
  "direccion_id" => $dirID
]);


	$arr = array ('response'=>'correcto','user'=> $usr, 'comment'=> $observaciones);
	echo json_encode($arr);
//insert en telefonos primero
// insert en entidades_telefonos

 ?>
