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

$tipo_telefono = ""; //done
$telefono = ""; //done
$extension = ""; //done

$tipo_telefono2 = ""; //done
$telefono2 = ""; //done
$extension2 = ""; //done
$tipo_telefono3 = ""; //done
$telefono3 = ""; //done
$extension3 = ""; //done

$usr = $_POST['usr']; //done
$year = $_POST['year'];
$month = $_POST['month'];

$tipo_direccion = $_POST['tipo_direccion']; //done
$estado_direccion = $_POST['estado_direccion']; //done
$tipo_propiedad = $_POST['tipo_propiedad']; //
$fechaantiguedad = ""; //done

if (isset($_POST['tipo_telefono'])) {
  $tipo_telefono = $_POST['tipo_telefono']; //done
}
if (isset($_POST['telefono'])) {
  $telefono = $_POST['telefono']; //done
}
if (isset($_POST['extension'])) {
  $extension = $_POST['extension']; //done
}

if (isset($_POST['tipo_telefono2'])) {
  $tipo_telefono2 = $_POST['tipo_telefono2']; //done
}
if (isset($_POST['telefono2'])) {
  $telefono2 = $_POST['telefono2']; //done
}
if (isset($_POST['extension2'])) {
  $extension2 = $_POST['extension2']; //done
}

if (isset($_POST['tipo_telefono3'])) {
  $tipo_telefono3 = $_POST['tipo_telefono3']; //done
}
if (isset($_POST['telefono3'])) {
  $telefono3 = $_POST['telefono3']; //done
}
if (isset($_POST['extension3'])) {
  $extension3 = $_POST['extension3']; //done
}

$pais = $_POST['pais']; //done
$departamento = $_POST['departamento'];//done
$municipio = $_POST['municipio'];//done
$direccion = $_POST['direccion'];//done
$cp = $_POST['cp'];//done
$pr = $_POST['pr'];//done
$nc = $_POST['nc'];//done

$dirID = $database->get("entidades_direcciones",["direccion_id"],["entidad_id" => $usr ]);
$telID = $database->get("entidades_telefonos",["telefono_id"],["entidad_id" => $usr ]);
$telID2 = $database->get("entidades_telefonos",["telefono_id2"],["entidad_id" => $usr ]);
$telID3 = $database->get("entidades_telefonos",["telefono_id3"],["entidad_id" => $usr ]);

$database->update("direcciones", [
  "direccion_descripcion" => $direccion,
  "direccion_tipo_id" => $tipo_direccion,
  "direccion_antiguedad" => $fechaantiguedad,
  "direccion_year" => $year,
  "direccion_month" => $month,
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

$database->update("telefonos", [
  "telefono_tipo_id" => $tipo_telefono2,
  "telefono_numero" => $telefono2,
  "telefono_extesnion" => $extension2,
  "estatus_id" => '7'
  
],["telefono_id" => $telID2 ]);

$database->update("telefonos", [
  "telefono_tipo_id" => $tipo_telefono3,
  "telefono_numero" => $telefono3,
  "telefono_extesnion" => $extension3,
  "estatus_id" => '7'
  
],["telefono_id" => $telID3 ]);



	$arr = array ('response'=>'correcto','user'=> $usr, 'comment'=> $fechaantiguedad);
	echo json_encode($arr);
//insert en telefonos primero
// insert en entidades_telefonos

 ?>
