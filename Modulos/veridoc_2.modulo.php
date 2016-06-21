<?php 
$usr = "";
if(isset($_GET['usr']))
  $usr = $_GET['usr'];
?>
  <ul class="pagination">
    
    <li class="waves-effect"><a href="#!">Datos del Cliente</a></li>
    <li class="waves-effect"><a href="#!">Datos del Domicilio</a></li>
    <li class="active teal"><a href="#!">Trabajo</a></li>
    <li class="waves-effect"><a href="#!">Propiedades</a></li>
    <li class="waves-effect"><a href="#!">Referencias Personales</a></li>
    <li class="waves-effect"><a href="#!">Datos de Venta</a></li>
    <a id="dvfrmbtn" class="waves-effect waves-light btn"><i class="material-icons right">call_missed</i>Devolver solicitud</a>    
  </ul>
   <form id="dvfrm" action="dvfrm.php" method="POST" >
    <input id="userVal" type="hidden" name="user" value="<?php echo $usr; ?>">    
    </form>
    
  </ul>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
</div>

<?php 
require_once 'funciones.php';
require 'config.php';
require_once 'config.php';
      
      $empleo  = $database->select("empleos", "*",["entidad_id" => $usr]);      
      $direcciones  = $database->select("direcciones", "*",["direccion_id" => $empleo[0]['direccion_id']]);
      $telefonos  = $database->select("telefonos", "*",["telefono_id" => $empleo[0]['telefono_id']]);


 ?>
 <br>
 <br>
  <div class="row container">
    <form id="veridocform2" class="col s12" method="post" action="veridocform2.php" enctype="multipart/form-data">
      <div class="row">
        <div class="col s12 m6">
          <label>Estatus del Trabajo</label>
            <select name="estatus_trabajo">
              <option value="" disabled selected>Elija el estatus</option>
              <?php 
        
        $datas = $database->select("estatus", ["estatus_id","estatus_desripcion"],["estatus_comentario" => "direccion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["estatus_id"].'" '; if($data["estatus_id"] == $empleo[0]['estatus_id']) { echo "selected";} echo ' >'.$data["estatus_desripcion"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="col s12 m6">
          <label>Tipo de Trabajo</label>
            <select name="tipo_trabajo">
              <option value="" disabled selected>Elija el Tipo</option>
              <?php 
        
        $datas = $database->select("empleos_tipos", ["empleo_tipo_id","empleo_tipo_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["empleo_tipo_id"].'" '; if($data["empleo_tipo_id"] == $empleo[0]['empleo_tipo_id']) { echo "selected";} echo ' >'.$data["empleo_tipo_descripcion"].'</option>';
          }
       ?>
            </select>
        </div >        
      </div>
        <div class="row">
            <div class="input-field col s12 m12">
              <i class="material-icons prefix">business</i>
              <input id="icon_prefix2" type="text" name="nempresa" class="validate" value="<?php echo $empleo[0]['empleo_nombre']; ?>">
              <label for="icon_prefix2">Nombre Empresa</label>
            </div>
            
        
        </div>
        <div class="row">
            <div class="col s12 m3">
              <label>Cargo del Solicitante</label>
                <select name="cargo_cliente">
                  <option value="" disabled selected>Elija Cargo</option>
                  <?php 
        
        $datas = $database->select("cargos", ["cargo_id","cargo_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["cargo_id"].'" '; if($data["cargo_id"] == $empleo[0]['empleo_cargo_id']) { echo "selected";} echo ' >'.$data["cargo_descripcion"].'</option>';
          }
       ?>
                </select>
            </div >
            <div class="input-field col s12 m6" style="margin-top:22px;">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="njefe" type="text" class="validate" value="<?php echo $empleo[0]['empleo_jefe_nombre']; ?>">
              <label for="icon_prefix">Nombre del Jefe</label>
            </div>
            <div class="col s12 m3">
              <label>Cargo del Jefe</label>
                <select name="cargo_jefe">
                  <option value="" disabled selected>Elija Cargo</option>
                  <?php 
        
        $datas = $database->select("cargos", ["cargo_id","cargo_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["cargo_id"].'" '; if($data["cargo_id"] == $empleo[0]['empleo_jefe_cargo_id']) { echo "selected";} echo ' >'.$data["cargo_descripcion"].'</option>';
          }
       ?>
                </select>
            </div >
        </div>
        <div class="row">
            <div class="input-field col s12 m12">
              <i class="material-icons prefix">date_range</i>
              <input id="icon_prefix2" type="date" name="fechaempleo" class="datepicker" value='<?php echo $empleo[0]['empleo_antiguedad']; ?>'>
              <label for="icon_prefix2">Antiguedad de Empleo</label>
            </div>
            
        </div>             
<br>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
  </div>
  
      
      <div class="row">
        <div class="col s12 m6">
          <label>Tipo de Contrato</label>
            <select name="tipo_contrato">
              <option value="" disabled selected>Elija el Tipo de Contrato</option>
              <?php 
        
        $datas = $database->select("contratos_tipos", ["contrato_tipo_id","contrato_tipo_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["contrato_tipo_id"].'" '; if($data["contrato_tipo_id"] == $empleo[0]['contrato_tipo_id']) { echo "selected";} echo ' >'.$data["contrato_tipo_descripcion"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="col s12 m6">
          <label>Frecuencia de Pago</label>
            <select name="frecuencia_pago" >
              <option value="" disabled selected>Elija La Frecuencia de Pago</option>
              <?php 
        
        $datas = $database->select("frecuencias_pagos", ["frecuencia_pago_id","frecuencia_pago_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["frecuencia_pago_id"].'" '; if($data["frecuencia_pago_id"] == $empleo[0]['frecuencia_pago_id']) { echo "selected";} echo ' >'.$data["frecuencia_pago_descripcion"].'</option>';
          }
       ?>
            </select>
        </div >
      </div>

      <div class="row">
        <div class="col s12 m3" style="margin-top:-7px;">
          <label>Tipo de Moneda</label>
            <select name="tipo_moneda">
              <option value="" disabled selected>Elija Moneda</option>
              <?php 
        
        $datas = $database->select("monedas", ["moneda_id","moneda_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["moneda_id"].'" '; if($data["moneda_id"] == $empleo[0]['moneda_id']) { echo "selected";} echo ' >'.$data["moneda_descripcion"].'</option>';
          }
       ?>
            </select>
        </div >
        
        <div class="input-field col s12 m4">
        <i class="material-icons prefix">monetization_on</i>
            <input id="comision" name="comision" type="number" class="validate" value='<?php echo $empleo[0]['empleo_comsiones_extras']; ?>'>
            <label for="icon_prefix">Comisiones y Extras</label>
        </div>
        <div class="input-field col s12 m5">
            <input id="impuesto" name="impuesto" type="number" class="validate" value='<?php echo $empleo[0]['empleo_imp_deduciones']; ?>'>
            <label for="icon_prefix">Impuestos y Deducciones</label>
        </div>
      </div>  

      <div class="row">

        <div class="input-field right col s12 m3">
        <label for="icon_prefix" class="right">Ingreso Neto</label>
            <input id="ingreso_neto" name="ingreso_neto" type="number" style="color: grey;" class="validate" value='<?php echo intval($empleo[0]['empleo_ingreso_neto']); ?>'>
            
        </div>
        <div class="input-field right col s12 m3">
            <i class="material-icons prefix">attach_money</i>
            <input id="ingreso_declarado" name="ingreso_declarado"  type="number" class="validate" value='<?php echo intval($empleo[0]['empleo_ingreso_declarado']); ?>'>
            <label for="icon_prefix">Ingreso Declarado</label>
        </div>        
      </div>

<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>

      <div class="row">
             <div class="col s12 m4">
              <label>Tipo Telefono</label>
                <select name="tipo_tel" >
                  <option value="" disabled selected>Elija Tipo Telefono</option>
                  <?php 
        
        $datas = $database->select("telefonos_tipos", ["telefono_tipo_id","telefono_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["telefono_tipo_id"].'" '; if($data["telefono_tipo_id"] == $telefonos[0]['telefono_tipo_id']) { echo "selected";} echo ' >'.$data["telefono_descripcion"].'</option>';
          }
       ?>
                </select>
            </div >
            <div class="input-field col s12 m5">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="tel" type="text" class="validate" value='<?php echo $telefonos[0]['telefono_numero']; ?>'>
              <label for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="ext" type="text" class="validate" value='<?php echo $telefonos[0]['telefono_extesnion']; ?>'>
              <label for="icon_prefix">Extension</label>
            </div>
        </div>

      <div class="row">
        <div class="col s12 m4">
          <label>Pais</label>
            <select name="pais">
              <option value="" disabled selected>Elija el Pais</option>
              <?php 
        
        $datas = $database->select("pais", ["pais_id","pais_nombre","flag"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option data-icon="img/'.$data["flag"].'.png" value="'.$data["pais_id"].'" '; if($data["pais_id"] == $direcciones[0]['pais_id']) { echo "selected";} echo ' >'.$data["pais_nombre"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="col s12 m4">
          <label>Tipo de Dirección</label>
            <select name="dep">
              <option value="" disabled selected>Elija el Departamento</option>
              
              <?php 
        
        $datas = $database->select("departamentos", ["depto_id","depto_nombre"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["depto_id"].'" '; if($data["depto_id"] == $direcciones[0]['depto_id']) { echo "selected";} echo ' >'.$data["depto_nombre"].'</option>';
          }
       ?>
              
            </select>
        </div >
        <div class="col s12 m4">
          <label>Municipio</label>
            <select name="mun">
              <option value="" disabled selected>Elija El Municipio</option>
              <?php 
        
        $datas = $database->select("municipios", ["municipio_id","municipio_nombre"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["municipio_id"].'" '; if($data["municipio_id"] == $direcciones[0]['municipio_id']) { echo "selected";} echo ' >'.$data["municipio_nombre"].'</option>';
          }
       ?>
              
            </select>
        </div >
      </div>  

      <div class="row">
          <div class="input-field col  s12">
            <i class="material-icons prefix">edit_location</i>
            <input id="icon_prefix" name="dir_trab" type="text" class="validate" value='<?php echo $direcciones[0]['direccion_descripcion']; ?>'>
            <label for="icon_prefix">Dirección de Trabajo</label>
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m3">
            <input id="icon_prefix" name="cp" type="text" class="validate" value='<?php echo $direcciones[0]['direccion_codigo_postal']; ?>'>
            <label for="icon_prefix">Código Postal</label>
          </div>
          <div class="input-field col s12 m6">
            <i class="material-icons prefix">my_location</i>
            <input id="icon_prefix" name="pr" type="text" class="validate" value='<?php echo $direcciones[0]['direccion_punto_referencia']; ?>'>
            <label for="icon_prefix">Punto de Referencia</label>
          </div>
          <div class="input-field col s12 m3">
            <input id="icon_prefix" name="horas_contact" type="text" class="validate" value='<?php echo $empleo[0]['empleo_hora_contactar']; ?>'>
            <label for="icon_prefix">Horas para Contactar</label>
          </div>
      </div>

      <div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>

      <input type="hidden" name="usr" value="<?php echo $_GET['usr']; ?>">

      <div class="row">
    <div class="col m12">
      <p class="right-align">
        <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Continuar</button>
      </p>
    </div>
  </div>

</form>