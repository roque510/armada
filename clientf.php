<?php 
require_once 'medoo.php';
require_once 'funciones.php';
      require_once 'config.php';
      
        $database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);

        echo $_POST['pnombre'];
        echo $_POST['snombre'];
        echo $_POST['papellido'];
        echo $_POST['sapellido'];
        echo $_POST['tipo_id'];
        echo $_POST['nacionalidad'];
        echo $_POST['canal_venta'];
        echo $_POST['genero'];
        echo $_POST['tipo_cliente'];
        

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
  "entidad_genero" => $_POST['genero'],  
  "entidad_correo" => "",
  "entidad_fecha_nacimiento" => "",
  "entidad_identidad_principal" => "",
  "entidad_rtn" => "",
  "entidad_imagen" => "",
  "entidad_generado" => "",
  "entidad_usuario_creacion" => "",
  "entidad_fecha_creacion" => "",
  "estatus_id" => ""
]);

$database->insert("entidades_identificaciones", [
  "entidad_id" => $last_user_id,
  "identificacion_id" => $_POST['tipo_id'],
  "identificacion_principal" => $_POST['tipo_id']
]);

$database->insert("identificaciones", [
  "entidad_id" => $last_user_id,
  "identificacion_tipo_id" => $_POST['tipo_id']
]);

//HAY QUE AGREGAR INFORMACION SOBRA LE FECHA Y LA PERSONA QUE AGREGO A ESTE CLIENTE!
$database->insert("clientes", [
  "entidad_id" => $last_user_id,
  "cliente_limite_credito" => $_POST['monto'],
  "cliente_cuota" => $_POST['cuota'], 
  "cliente_plazo" => $_POST['plazo']
]);


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




 ?>