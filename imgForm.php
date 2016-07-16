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

        echo $_POST['id'];
        echo $_POST['tipo'];
       
      

     $target_dir = "clientes/".$_POST['id']."/";
     
upload($_FILES["fileToUpload"],$target_dir,$_POST['tipo']);

?>