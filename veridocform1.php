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
$tipo_direccion = $_POST['tipo_direccion']; //done
$estado_direccion = $_POST['estado_direccion']; //done
$tipo_propiedad = $_POST['tipo_propiedad']; //
$fechaantiguedad = $_POST['fechaantiguedad']; //done
$tipo_telefono = $_POST['tipo_telefono']; //done
$telefono = $_POST['telefono']; //done
$extension = $_POST['extension']; //done
$pais = $_POST['pais']; //done
$departamento = $_POST['departamento'];//done
$municipio = $_POST['municipio'];//done
$direccion = $_POST['direccion'];//done
$cp = $_POST['cp'];//done
$pr = $_POST['pr'];//done
$nc = $_POST['nc'];//done

$dirID = $database->get("entidades_direcciones",["direccion_id"],["entidad_id" => $usr ]);
$telID = $database->get("entidades_telefonos",["telefono_id"],["entidad_id" => $usr ]);

$database->update("direcciones", [
  "direccion_descripcion" => $direccion,
  "direccion_tipo_id" => $tipo_direccion,
  "direccion_antiguedad" => $fechaantiguedad,
  "pais_id" => $pais,
  "depto_id" => $departamento,
  "municipio_id" => $municipio,
  "direccion_codigo_postal" => $cp,
  "direccion_punto_referencia" => $pr,
  "direccion_numero_casa" => $nc,
  "estatus_id" => $estado_direccion
  
],[
  "direccion_id" => $dirID
]);

$database->update("propiedades",["propiedad_tipo_id" => $tipo_propiedad],["direccion_id" => $dirID]);

$database->update("telefonos", [
  "telefono_tipo_id" => $tipo_telefono,
  "telefono_numero" => $telefono,
  "telefono_extesnion" => $extension,
  "estatus_id" => '7'
  
],["telefono_id" => $telID ]);



	$arr = array ('response'=>'correcto','user'=> $usr, 'comment'=> $fechaantiguedad);
	echo json_encode($arr);
//insert en telefonos primero
// insert en entidades_telefonos

 ?>
