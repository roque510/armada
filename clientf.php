<?php
date_default_timezone_set('America/Tegucigalpa');

require_once 'medoo.php';
require_once 'funciones.php';
      require_once 'config.php';
      session_start();
      
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

        if (isset($_POST['tipo_telefono'])) {
          $tipo_telefono = $_POST['tipo_telefono']; //done
        } //done
        if (isset($_POST['telefono'])) {
          $telefono = $_POST['telefono']; //done
        } //done
        if (isset($_POST['extension'])) {
          $extension = $_POST['extension']; //done
        } //done
        

        $error = false;

        if (!isset($_POST['pnombre'])) {
          $error = true;
        } //done
        if (!isset($_POST['snombre'])) {
          $error = true;
        } //done
        if (!isset($_POST['papellido'])) {
          $error = true;
        } //done
        if (!isset($_POST['sapellido'])) {
          $error = true;
        } //done
        if (!isset($_POST['tipo_id'])) {
          $error = true;
        } //done
        if (!isset($_POST['id'])) {
          $error = true;
        } //done
        if (!isset($_POST['canal_venta'])) {
          $error = true;
        } //done
        if (!isset($_POST['tipo_cliente'])) {
          $error = true;
        } //done
        if (!isset($_POST['monto'])) {
          $error = true;
        } //done
        if (!isset($_POST['cuota'])) {
          $error = true;
        } //done
        if (!isset($_POST['plazo'])) {
          $error = true;
        } //done
        
        if ($error) {
          $arr = array ('response'=>'error');
            echo json_encode($arr);
        }
        else {
        
        

$path = "clientes/";
$id = "2";

$max = $database->max("entidades", "entidad_id");
//echo '<script>alert('.$max.');</script>';
$max ++;

$last_user_id = $database->insert("entidades", [
  "entidad_primer_nombre" => $_POST['pnombre'],
  "entidad_segundo_nombre" => $_POST['snombre'],
  "entidad_primer_apellido" => $_POST['papellido'], 
  "entidad_segund_apellido" => $_POST['sapellido'],
  //"estado_civil_id" => $_POST['estado_civil'],
  //"entidad_genero" => $_POST['genero'],  
  "entidad_correo" => "",
  "entidad_fecha_nacimiento" => "",
  "entidad_identidad_principal" => "",
  "entidad_rtn" => "",
  "entidad_imagen" => "",
  "entidad_tipo_id" => $_POST['tipo_id'],
  "entidad_generado" => "",
  "entidad_usuario_creacion" => "",
  "#entidad_fecha_creacion" => "CURDATE()",
  "estatus_id" => ""
]);



$ultimoID = $database->insert("identificaciones", [
  "entidad_id" => $last_user_id,
  "identificacion_tipo_id" => $_POST['tipo_id'],
  "identificacion_numero" => trim($_POST['id']," ")
]);

$database->insert("entidades_identificaciones", [
  "entidad_id" => $last_user_id,
  "identificacion_id" => $ultimoID,
  "identificacion_principal" => $_POST['tipo_id']
]);

$database->insert("clientes", [
  //"nivel_edu_id" => $_POST['nivel_educativo'],
  "cliente_limite_credito" => $_POST['monto'],
  "cliente_cuota" => $_POST['cuota'],
  "cliente_tipo" => $_POST['tipo_cliente'],
  "cliente_usuario_creacion" => $_SESSION['usr'],
  "cliente_fecha_creacion" => date("Y-m-d H:i:s"),
  "cliente_plazo" => $_POST['plazo'],
  "entidad_id" => $last_user_id
]);

//HAY QUE AGREGAR INFORMACION SOBRA LE FECHA Y LA PERSONA QUE AGREGO A ESTE CLIENTE!
$database->insert("solicitudes", [
  "entidad_id" => $last_user_id,
  "solicitud_canal_id" => $_POST['canal_venta'],
  "solicitud_monto" => $_POST['monto'],
  "solicitud_cuota" => $_POST['cuota'], 
  "estatus_id" => 1,
  "solicitud_fecha_inicio" => date("Y-m-d H:i:s"),
  "solicitud_plazo" => $_POST['plazo']
]);


$last_dir = $database->insert("direcciones", [ 
]);

$database->insert("entidades_direcciones", [
  "entidad_id" => $last_user_id,
  "direccion_id" => $last_dir
  
]);

$propiedades = $database->insert("propiedades", [  
  "direccion_id" => $last_dir
  
]);

$ultimoTel = $database->insert("telefonos", [
  
]);
$ultimoTel2 = $database->insert("telefonos", [
  
]);
$ultimoTel3 = $database->insert("telefonos", [
  
]);

$ultimoTelEmp = $database->insert("telefonos", [
  
]);

$database->insert("entidades_telefonos", [
  "entidad_id" => $last_user_id,
  "telefono_id" => $ultimoTel,
  "telefono_id2" => $ultimoTel2,
  "telefono_id3" => $ultimoTel3
  
]);

$last_dir_emp = $database->insert("direcciones", [ 
]);

$last_empleo = $database->insert("empleos", [
  "entidad_id" => $last_user_id ,
  "telefono_id" => $ultimoTelEmp ,
  "direccion_id" => $last_dir_emp  
  
]);

$last_dir_pro = $database->insert("direcciones", [ 
]);

$last_empleo = $database->insert("propiedades", [
  "entidad_id" => $last_user_id ,  
  "direccion_id" => $last_dir_pro  
  
]);

$database->insert("referencias_personales", [
  "entidad_id" => $last_user_id 
]);
//verificacion_telefonos

$database->insert("verificacion_telefonos", [
  "entidad_id" => $last_user_id 
]);

$database->insert("referencias_personales", [
  "entidad_id" => $last_user_id 
]);

$telID = $database->get("entidades_telefonos",["telefono_id"],["entidad_id" => $last_user_id ]);

$database->update("telefonos", [
  "telefono_tipo_id" => $tipo_telefono,
  "telefono_numero" => $telefono,
  "telefono_extesnion" => $extension,
  "estatus_id" => '7'
  
],["telefono_id" => $telID ]);




/*if ($database->has("entidades", ["user_name" => "foo"]))
{
	echo "Password is correct.";
}
else
{
	echo "Password error.";
}*/

        if (!file_exists($path.$last_user_id)) {
    mkdir($path.$last_user_id, 0777, true);
}

$target_dir = "clientes/".$last_user_id."/";
upload($_FILES["fileToUpload"],$target_dir,"Identificacion");
upload($_FILES["docla"],$target_dir,"Documentacion_Laboral");
upload($_FILES["docpro"],$target_dir,"Documentacion_Propia");
upload($_FILES["recicom"],$target_dir,"Recibo_Comprobante");
upload($_FILES["solifi"],$target_dir,"Solicitud_fisica");

$arr = array ('response'=>'correcto');
  echo json_encode($arr);
}



 ?>