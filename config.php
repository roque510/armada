<?php
GLOBAL $SVR,$USR,$PW,$DB;

$DB= "db_credistar";
$SVR = "localhost";
$PW = "";
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