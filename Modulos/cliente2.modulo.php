<?php 
require_once 'funciones.php';
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




 ?>
  <div class="row">
    <form class="col s12" action="clientf.php" method="post">
      <div class="row">
        <div class="input-field col m3 s12">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="text" name="pnombre" class="validate">
          <label for="icon_prefix">Primer Nombre</label>
        </div>
        <div class="input-field col m3 s12">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="snombre" type="text" class="validate">
          <label for="icon_prefix">Segundo Nombre</label>
        </div>
        <div class="input-field col m3 s12">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="papellido" type="text" class="validate">
          <label for="icon_prefix">Primer Apellido</label>
        </div>
        <div class="input-field col m3 s12">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="sapellido" type="text" class="validate">
          <label for="icon_prefix">Segundo Apellido</label>
        </div>
        
      </div>
      <div class="input-field col s6">
    <select name="tipo_identificacion">
      <option value="" disabled selected>Elija una opcion</option>
      <?php 
        
        $datas = $database->select("identificaciones_tipos", ["identificacion_tipo_descripcion","identificacion_tipo_id"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["identificacion_tipo_id"].'">'.$data["identificacion_tipo_descripcion"].'</option>';
          }
       ?>
      

    </select>
    <label>Tipo de Identificacion</label>
  </div>

 <div class="input-field col s6">
    <select name="genero">
      <option value="" disabled selected>Elija una opcion</option>
      <option value="1">Femenino</option>
      <option value="2">Masculino</option>

    </select>
    <label>Genero</label>
  </div>

   <div class="input-field col s6">
    <select name="nacionalidad">
      <option value="" disabled selected>Elija una opcion</option>
      <?php 
        
        $datas = $database->select("pais", ["pais_nombre","pais_id"], ["pais_id[>]" => 0]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["pais_id"].'">'.$data["pais_nombre"].'</option>';
          }
       ?>

    </select>
    <label>Nacionalidad</label>
  </div>
  <div class="input-field col s6">
    <select name="tipo_cliente">
      <option value="" disabled selected>Elija una opcion</option>
      <?php 
        
        $datas = $database->select("entidades_tipos", ["entidad_tipo_descripcion","entidad_tipo_id"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["entidad_tipo_id"].'">'.$data["entidad_tipo_descripcion"].'</option>';
          }
       ?>

    </select>
    <label>Tipo Cliente</label>
  </div>
<div class="input-field col s6">
    <select name="canal_venta">
      <option value="" disabled selected>Elija una opcion</option>
      <?php 
        
        $datas = $database->select("solicitudes_canales", ["solicitud_canal_descripcion","solicitud_canal_id"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["solicitud_canal_id"].'">'.$data["solicitud_canal_descripcion"].'</option>';
          }
       ?>

    </select>
    <label>Canal de Venta</label>
  </div>
  <div class="input-field col s6">
    <select name="datos_credito">
      <option value="" disabled selected>Elija una opcion</option>
      <option value="1">Monto Solicitado</option>
      <option value="2">Cuota Solicitada</option>
      <option value="3">Plazo en Meses</option>

    </select>
    <label>Datos de Credito</label>
  </div>

  <div class="row" style="margin-top:300px !important;">
    
  <h3>Documentacion Grafica</h3>
  <label>Identificacion Personal. (cedula,licencia,pasaporte, o Carnet de seguro)</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>

    <label>Documentos Laborales. (Hoja de Seguro Social,Constancia de Trabajo,Boucher de Pago, o Carnet de Trabajo)</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>

    <label>Documentacion Propia. (Permiso de operacion,Solvencia economica, o RTN)</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>

    <label>Recibos y Comprobantes. (Agua,Luz,Telefono, o comprobantes de remesas)</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
    <label>Solicitud Fisica</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
  

  </div>
    
  <div class="row">
    <div class="col m12">
      <p class="right-align">
        <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Login</button>
      </p>
    </div>
  </div>

</form>



  </div>  


