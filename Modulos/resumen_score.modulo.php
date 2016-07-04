<div class="row container">
  <h3>Reporte Resumen</h3>
</div>

<div class="progress">
      <div class="determinate" style="width: 100%; background-color:#bf360c"></div>
</div>

<?php 
require_once 'funciones.php';
require 'config.php';
require_once 'config.php';

$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);

        $usr = $_GET['usr'];

        $queryA = "SELECT concat(`entidad_primer_nombre`,' ', `entidad_segundo_nombre`,' ',`entidad_primer_apellido`,' ',`entidad_segund_apellido`) FROM `entidades` where `entidad_id` = ".$usr;
        $queryB = "SELECT TIMESTAMPDIFF(YEAR, `empleo_antiguedad`, CURDATE()) AS age from `empleos` where `entidad_id` = ".$usr;

        $did = $database->select("entidades_direcciones", "*",["entidad_id" => $usr]);
        
        $queryC = "SELECT TIMESTAMPDIFF(YEAR, `direccion_antiguedad`, CURDATE()) AS age from `direcciones` where `direccion_id` = ".$did[0]["direccion_id"];
        
        $cliente = $database->select("clientes", "*",["entidad_id" => $usr]); 
        $empleo  = $database->select("empleos", "*",["entidad_id" => $usr]);
        $veri  = $database->select("verificacion_telefonos", "*",["entidad_id" => $usr]);

        $fpago = $database->select("frecuencias_pagos", ["frecuencia_pago_id","frecuencia_pago_descripcion"],["frecuencia_pago_id" => $empleo[0]["frecuencia_pago_id"]]);

        $entidad = $database->query($queryA)->fetchAll();
        $edadEmpleo = $database->query($queryB)->fetchAll();
        $edadDIR = $database->query($queryC)->fetchAll();
        //SELECT TIMESTAMPDIFF(YEAR, `entidad_fecha_nacimiento`, CURDATE()) AS age from `entidades` where `entidad_id` = 85
        $edad = $database->query("SELECT TIMESTAMPDIFF(YEAR, `entidad_fecha_nacimiento`, CURDATE()) AS age from `entidades` where `entidad_id` = ".$usr)->fetchAll();
        $entidadi = $database->select("entidades", "*",["entidad_id" => $usr]);
        $estadoCIV = $database->select("estados_civiles", ["estado_civil_descripcion"],["estado_civil_id" => $entidadi[0]["estado_civil_id"]]);

        

        
        
      

 ?>
 <div class="row container">
    <p><b>Datos del Cliente</b></p>
 </div>
  <div class="row container">
    <form id="leformatone" class="col s12" method="post" action="clientf.php" enctype="multipart/form-data">
      <div class="row">
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">account_circle</i>
            <label for="icon_prefix2" style="color:black;">Nombre del Solicitante</label>
          </div>
          <div class="input-field col s12 m10">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="<?php echo $entidad[0][0]; ?>" style="border-color:#bf360c; color: gray;">
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m3">
          <i class="material-icons prefix" style="color:#bf360c;">cake</i>
            <label for="icon_prefix2" style="color:black;">Edad</label>
            <input readonly id="icon_prefix2" type="text" class="validate" value="<?php echo $edad[0][0]; ?>" style="border-color:#bf360c; color:gray;">
          </div>
          
          <div class="input-field col s12 m3">
          <i class="material-icons prefix" style="color:#bf360c;">supervisor_account</i>
            <label for="icon_prefix2" style="color:black;">Estado Civil</label>
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="<?php echo $estadoCIV[0]['estado_civil_descripcion']; ?>" style="border-color:#bf360c; color:gray;">
          </div>
          
          <div class="input-field col s12 m6">
          <i class="material-icons prefix" style="color:#bf360c;">work</i>
            <label for="icon_prefix2" style="color:black;">Trabaja en: </label>
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="<?php echo $empleo[0]['empleo_nombre']; ?>" style="border-color:#bf360c; color:gray;">
          </div>        
      </div>
        <div class="row">
          
          <div class="input-field col s12 m6">
          <i class="material-icons prefix" style="color:#bf360c;">history</i>
            <label for="icon_prefix2" style="color:black;">Antiguedad Laboral</label>
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="<?php echo $edadEmpleo[0][0]; ?> Años" style="border-color:#bf360c; color:gray;">
          </div>
          
          <div class="input-field col s12 m6">
          <i class="material-icons prefix" style="color:#bf360c;">history</i>
            <label for="icon_prefix2" style="color:black;">Antiguedad Residencia</label>
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="<?php echo $edadDIR[0][0]; ?> Años" style="border-color:#bf360c; color:gray;">
          </div>
        </div>
        <div class="row">
          
          <div class="input-field col s12 m6">
          <i class="material-icons prefix" style="color:#bf360c;">attach_money</i>
            <label for="icon_prefix2" style="color:black;">Sueldo Neto</label>
            <input readonly id="ingreso_neto" type="text" name="fechanac" class="validate" value="<?php echo $empleo[0]['empleo_ingreso_neto']; ?> Lps" style="border-color:#bf360c; color:gray;">
          </div>
          
          <div class="input-field col s12 m6">
          <i class="material-icons prefix" style="color:#bf360c;">short_text</i>
            <label for="icon_prefix2" style="color:black;">Frecuencia de pago</label>
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="<?php echo $fpago[0]['frecuencia_pago_descripcion']; ?> " style="border-color:#bf360c; color:gray;">
          </div>
        </div>

        <div class="row container">
  <div class="progress">
      <div class="determinate" style="width: 100%; background-color:#bf360c"></div>
  </div>
</div>

        <div class="row">
          <p><b>Verificacion Telefonos</b></p>

          <div class="input-field col s12 m6">
          <i class="material-icons prefix" style="color:#bf360c;">attach_money</i>
            <label for="icon_prefix2" style="color:black;">Telefonos Personales</label>
            <input readonly id="ingreso_neto" type="text" name="fechanac" class="validate" value="<?php echo $veri[0]['telspersonales']; ?>" style="border-color:#bf360c; color:gray;">
          </div>
          
          <div class="input-field col s12 m6">
          <i class="material-icons prefix" style="color:#bf360c;">short_text</i>
            <label for="icon_prefix2" style="color:black;">Telefono Empleo</label>
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="<?php echo $veri[0]['teltrabajo']; ?> " style="border-color:#bf360c; color:gray;">
          </div>
        </div>
        <div class="row">
          
          <div class="input-field col s12 m6">
          <i class="material-icons prefix" style="color:#bf360c;">attach_money</i>
            <label for="icon_prefix2" style="color:black;">Telefono Referencia 1</label>
            <input readonly id="ingreso_neto" type="text" name="fechanac" class="validate" value="<?php echo $veri[0]['telref1']; ?>" style="border-color:#bf360c; color:gray;">
          </div>
          
          <div class="input-field col s12 m6">
          <i class="material-icons prefix" style="color:#bf360c;">short_text</i>
            <label for="icon_prefix2" style="color:black;">Telefono Referencia 2</label>
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="<?php echo $veri[0]['telref2']; ?> " style="border-color:#bf360c; color:gray;">
          </div>
        </div>
    </div>



</form>

<div class="row container">
  <div class="progress">
      <div class="determinate" style="width: 100%; background-color:#bf360c"></div>
  </div>
</div>

<div class="row container">
    <p><b>Datos de Linea de Credito</b></p>
 </div>
  <div class="row container">
    <form id="datosL" class="col s12" method="post" action="datosL.php" enctype="multipart/form-data">
      <div class="row">
      <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">done_all</i>
            <label for="icon_prefix2" style="color:black;">Cuota Maxima</label>
          </div>
          <div class="input-field col s12 m2">     
            <input id="cuota_max" type="text" name="cuota_sugerida" class="validate" value="" style="border-color:#bf360c; color: gray;">
          </div>
          
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">trending_up</i>
            <label for="icon_prefix2" style="color:black;">Linea Solicitada</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="<?php echo $cliente[0]["cliente_limite_credito"]; ?>" style="border-color:#bf360c; color: gray;">
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">trending_flat</i>
            <label for="icon_prefix2" style="color:black;">Linea Sugerida</label>
          </div>
          <div class="input-field col s12 m2">
            <input  id="icon_prefix2" type="text" name="linea_sugerida" class="validate"  style="border-color:#bf360c; color: gray;">
          </div>
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">done</i>
            <label for="icon_prefix2" style="color:black;">Cuota Solicitada</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="cuota_sugeridas" class="validate" value="<?php echo $cliente[0]["cliente_cuota"]; ?>" style="border-color:#bf360c; color: gray;">
          </div>
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">iso</i>
            <label for="icon_prefix2" style="color:black;">Porcentaje de Afectación</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="porafec" type="text" name="fechanac" class="validate" value="##.##%" style="border-color:#bf360c; color: gray;">
          </div>
      </div>
    </div>    
    
    <input type="hidden" name="usuario" value="<?php echo $_GET['usr']; ?>">

    <div class="row container">
  <div class="progress">
      <div class="determinate" style="width: 100%; background-color:#bf360c"></div>
  </div>

  <div class="input-field col s12">
            <textarea id="textarea1" name="textarea1" class="materialize-textarea" length="120"></textarea>
            <label for="textarea1">Bitacora de analista</label>
          </div>
</div>
    
          
    
    

    <div class="row container">
      <div class="row">
            <a id="submitDatos"  class="waves-effect waves-light btn deep-orange darken-3 col s12 m4 right"><i class="material-icons left">verified_user</i>Finalizar Solicitud</a>
      </div>      
    </div>

    </form>


<script type="text/javascript">
    function save_score(){
        swal({
          title: "Soliciutd Finalizada",
          text: "Se ha finalizado la atencion de la solicitud de credito",
          type: "success",
          showCancelButton: false,
          animation: "slide-from-top",
          confirmButtonColor: "#009688"
        },function(){redriect()});

    }

    function redriect(){

      //hay que cambiar este codigo de redireccion por que lo esta mandando fijo a una solicitud en especifico
      window.location.href = "?pg=perfil&usr=77";
      //window.location.href = "www.google.com"
  }
</script>
    