<?php 
require_once ('medoo.php');
      require_once('funciones.php');
require_once('config.php');
session_start();

$alias = "";
$pass = "";
$admin = "no es admin";

if (isset($_POST['alias'])) {
	$alias = $_POST['alias'];
}
if (isset($_POST['pass'])) {
	$pass = md5($_POST['pass']);
}

$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);


$admin = $database->get("usuarios", "usuario_isadmin", [
	"usuario_alias" => $alias
]);

if ($database->has("usuarios", [
	"AND" => [
		"OR" => [
			"usuario_alias" => $alias
		]
		
		,
		"usuario_pass" => $pass
	]
]))
{
	if ($admin == 1) {
		$_SESSION['anl'] = $alias;
	}
	
	$_SESSION['usr'] = $alias;
	$arr = array ('response'=>'correcto','user'=> $alias, 'comment'=>$admin);
	echo json_encode($arr);
}
else
{
	$arr = array ('response'=>'Error','comment'=> 'Usuario o Contraseña incorrecta.' );
	echo json_encode($arr);
}





?>