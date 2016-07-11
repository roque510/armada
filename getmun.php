<?php 
require("config.php");
require_once("medoo.php");

$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);

$datas = $database->select("municipios", [
	"municipio_id",
	"municipio_nombre"
], [
	"depto_id" => $_POST["deptid"]
]);

echo json_encode($datas);

 ?>