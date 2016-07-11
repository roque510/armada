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



$usr = $_POST['usr']; //done
$estatus_trabajo = $_POST['estatus_trabajo']; //*
$tipo_trabajo = $_POST['tipo_trabajo']; //*
$nempresa = $_POST['nempresa']; //*
$cargo_cliente = $_POST['cargo_cliente']; //*
$njefe = $_POST['njefe']; //*
$cargo_jefe = $_POST['cargo_jefe']; //*
$fechaempleo = $_POST['fechaempleo']; //*
$tipo_contrato = $_POST['tipo_contrato'];//*
$frecuencia_pago = $_POST['frecuencia_pago'];//*
$tipo_moneda = $_POST['tipo_moneda'];//*
$comision = ""; // $_POST['comision'];//*
$impuesto = "";// $_POST['impuesto'];//*
$ingreso_neto = $_POST['ingreso_neto'];//*
$bruto ="";// $_POST['bruto'];//*
$ingreso_declarado = " "; //$_POST['ingreso_declarado'];//*
$tipo_tel = $_POST['tipo_tel'];//
$tel = $_POST['tel'];//
$ext = $_POST['ext'];//
$pais = $_POST['pais'];//*
$dep = $_POST['dep'];//*
$mun = $_POST['mun'];//*
$dir_trab = $_POST['dir_trab'];//*
$cp = $_POST['cp'];//*
$pr = $_POST['pr'];//*
$horas_contact = $_POST['horas_contact'];//*

$dirID = $database->get("empleos",["direccion_id"],["entidad_id" => $usr ]);

$telID = $database->get("empleos",["telefono_id"],["entidad_id" => $usr ]);

$database->update("empleos", [
  "empleo_nombre" => $nempresa,
  "empleo_cargo_id" => $cargo_cliente,
  "empleo_tipo_id" => $tipo_trabajo,
  "empleo_antiguedad" => $fechaempleo,
  "empleo_jefe_nombre" => $njefe,
  "empleo_jefe_cargo_id" => $cargo_jefe,
  "contrato_tipo_id" => $tipo_contrato,
  "frecuencia_pago_id" => $frecuencia_pago,
  "moneda_id" => $tipo_moneda,
  "empleo_ingreso_neto" => $ingreso_neto,
  "empleo_hora_contactar" => $horas_contact,
  "estatus_id" => $estatus_trabajo
  
],[
  "entidad_id" => $usr
]);

$database->update("direcciones", [
  "direccion_descripcion" => $dir_trab,
  "direccion_tipo_id" => "1",  
  "pais_id" => $pais,
  "depto_id" => $dep,
  "municipio_id" => $mun,
  "direccion_codigo_postal" => $cp,
  "direccion_punto_referencia" => $pr,  
  "estatus_id" => "4"
  
],[
  "direccion_id" => $dirID
]);


$database->update("telefonos", [
  "telefono_tipo_id" => $tipo_tel,
  "telefono_numero" => $tel,
  "telefono_extesnion" => $ext,
  "estatus_id" => '7'
  
],["telefono_id" => $telID ]);



	$arr = array ('response'=>'correcto','user'=> $usr, 'comment'=> "hola");
	echo json_encode($arr);
//insert en telefonos primero
// insert en entidades_telefonos

 ?>
