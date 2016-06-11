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




 ?>
 <br>
 <br>
  <div class="row container">
    <form id="leform" class="col s12" method="post" action="clientf.php" enctype="multipart/form-data">
      <div class="row">
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="text" name="pnombre" class="validate">
          <label for="icon_prefix">Primer Nombre</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="snombre" type="text" class="validate">
          <label for="icon_prefix">Segundo Nombre</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="papellido" type="text" class="validate">
          <label for="icon_prefix">Primer Apellido</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="sapellido" type="text" class="validate">
          <label for="icon_prefix">Segundo Apellido</label>
        </div>
        
      </div>
      
      <!-- div class="input-field col s12 m6">
          <i class="material-icons prefix">cake</i>
          <input id="icon_prefix2" type="date" name="fechanac" class="datepicker">
          <label for="icon_prefix2">Fecha Nacimiento</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">mail_outline</i>
          <input id="icon_prefix" type="text" name="correo" class="validate">
          <label for="icon_prefix">Correo</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">phone</i>
          <input id="icon_prefix" type="text" name="tel1" class="validate">
          <label for="icon_prefix">Telefono 1</label>
        </div>
        <div class="input-field col s12 m6" style="margin-bottom: 50px;">
          <i class="material-icons prefix">phone</i>
          <input id="icon_prefix" type="text" name="tel2" class="validate">
          <label for="icon_prefix">Telefono 2</label>
        </div -->

<br>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
  </div>
  
      
      <div class="input-field col s12 m6">
    <select name="tipo_id">
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
  <div class="input-field col s12 m6">
          <i class="material-icons prefix">fingerprint</i>
          <input id="icon_prefix" name="id" type="text" class="validate">
          <label for="icon_prefix">Numero de Identificacion</label>
        </div>

 <!-- div class="input-field col s12 m6">
    <select name="genero">
      <option value="" disabled selected>Elija una opcion</option>
      <option value="Femenino">Femenino</option>
      <option value="Masculino">Masculino</option>

    </select>
    <label>Genero</label>
  </div >

   <div class="input-field col s12 m6">
    <select name="nacionalidad">
      <option value="" disabled selected>Elija una opcion</option>
      <?php /*
        
        $datas = $database->select("pais", ["pais_nombre","pais_id"], ["pais_id[>]" => 0]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["pais_id"].'">'.$data["pais_nombre"].'</option>';
          } */
       ?>

    </select>
    <label>Nacionalidad</label>
  </div -->
  <div class="input-field col s12 m6">
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
<div class="input-field col s12 m6" >
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
  <!-- div class="input-field col s12 m6">
    <select name="estado_civil">
      <option value="" disabled selected>Elija una opcion</option>
      <?php /*
        
        $datas = $database->select("estados_civiles", ["estado_civil_descripcion","estado_civil_id"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["estado_civil_id"].'">'.$data["estado_civil_descripcion"].'</option>';
          }
       ?>

    </select>
    <label>Estado Civil</label>
  </div>
 
  <div class="input-field col s12 m6" style="margin-bottom: 50px;">
    <select name="nivel_educativo">
      <option value="" disabled selected>Elija una opcion</option>
      <?php 
        
        $datas = $database->select("nivel_educativo", ["nivel_edu_descrip","nivel_edu_id"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["nivel_edu_id"].'">'.$data["nivel_edu_descrip"].'</option>';
          }
       */ ?>

    </select>
    <label>Nivel educativo</label>
  </div -->


<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>
 

  <div class="row">
        <div class="input-field col s4">
          <input type="number" name="monto" class="validate">
          <label for="first_name">Monto Solicitado</label>
        </div>
        <div class="input-field col s4">
          <input id="last_name" name="cuota" type="number" class="validate">
          <label for="last_name">Cuota Solicitada</label>
        </div>
        <div class="input-field col s4">
          <input id="last_name" name="plazo" type="number" class="validate">
          <label for="last_name">Plazo en Meses</label>
        </div>
      </div>

      <div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>
  

  <div class="row" style="margin-top:50px !important;">
    
  <h3>Documentacion Grafica</h3>
  <label>Identificacion Personal. (cedula,licencia,pasaporte, o Carnet de seguro)</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input name="fileToUpload" id="fileToUpload" type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>

    <label>Documentos Laborales. (Hoja de Seguro Social,Constancia de Trabajo,Boucher de Pago, o Carnet de Trabajo)</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input  name="docla" id="docla" type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>

    <label>Documentacion Propia. (Permiso de operacion,Solvencia economica, o RTN)</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input  name="docpro" id="docpro" type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>

    <label>Recibos y Comprobantes. (Agua,Luz,Telefono, o comprobantes de remesas)</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input  name="recicom" id="recicom" type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
    <label>Solicitud Fisica</label>
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input  name="solifi" id="solifi" type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
  

  </div>
    
  <div class="row">
    <div class="col m12">
      <p class="right-align">
        <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Ingresar Cliente</button>
      </p>
    </div>
  </div>

</form>



  </div>  


