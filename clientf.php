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

 ?>