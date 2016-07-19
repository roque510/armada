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
        $usu = $_POST['usuario'];


$database->update("solicitudes", ["estatus_id" => 2,"soliciutd_comentario" => "Aprobado","soliciutd_forzada" => 1 ],["entidad_id" => $usu]);

$arr = array ('response'=> "correct",'user'=> $usu, 'comment'=> "done");
	echo json_encode($arr);
 ?>