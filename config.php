<?php
require_once('medoo.php');
GLOBAL $SVR,$USR,$PW,$DB;

$DB= "db_credistar";
$SVR = "localhost";
$PW = "golden sun";
$USR = "root";

$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);




?>