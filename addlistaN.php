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

if ($database->has("blacklist_identidad", [
	"AND" => [
		
		"blacklist_identidad" => $_POST['id']
	]
]))
{
	
}
else
{
	
	$database->insert("blacklist_identidad", [
  	"blacklist_identidad" => $_POST['id'],
  	]);
}

  
  


$arr = array ('response'=>'correcto');
	echo json_encode($arr);

 ?>