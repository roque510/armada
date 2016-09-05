<?php
require_once('medoo.php');
GLOBAL $SVR,$USR,$PW,$DB;

$DB= "vimeyaso_db_credistart";
$SVR = "localhost";
//$PW = "C%7Nzl9mBeVc";
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