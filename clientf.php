<?php 
require_once 'medoo.php';
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
        echo $_POST['tipo_identificacion'];
        echo $_POST['nacionalidad'];
        echo $_POST['canal_venta'];
        echo $_POST['genero'];
        echo $_POST['tipo_cliente'];
        echo $_POST['datos_credito'];

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
  "identificacion_id" => $_POST['tipo_identificacion'],
  "identificacion_principal" => $_POST['tipo_identificacion']
]);

$database->insert("entidades_identificaciones", [
  "entidad_id" => $last_user_id,
  "identificacion_id" => $_POST['tipo_identificacion'],
  "identificacion_principal" => $_POST['tipo_identificacion']
]);

$database->insert("identificaciones", [
  "entidad_id" => $last_user_id,
  "identificacion_tipo_id" => $_POST['tipo_identificacion']
]);


if ($database->has("entidades", ["user_name" => "foo"]))
{
	echo "Password is correct.";
}
else
{
	echo "Password error.";
}

        if (!file_exists($path.$last_user_id)) {
    mkdir($path.$last_user_id, 0777, true);
}

 ?>