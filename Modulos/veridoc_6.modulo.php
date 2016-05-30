
  <ul class="pagination">
    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
    <li class="waves-effect"><a href="?pg=veridoc">Datos del Cliente</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_1">Datos del Domicilio</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_2">Trabajo</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_3">Propiedades</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_4">Referencias Personales</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_5">Datos de Venta</a></li>
    <li class="active teal"><a href="?pg=veridoc_6"><i class="material-icons">chevron_right</i></a></li>
  </ul>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
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




 ?>
 <br>
 <br>
  <div class="row container">
    <form id="leform" class="col s12" method="post" action="clientf.php" enctype="multipart/form-data">
      <div class="row">
        <div class="input-field col  s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="text" name="pnombre" class="validate">
          <label for="icon_prefix">Primer Nombre</label>
        </div>
        <div class="input-field col  s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="snombre" type="text" class="validate">
          <label for="icon_prefix">Segundo Nombre</label>
        </div>
        <div class="input-field col  s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="papellido" type="text" class="validate">
          <label for="icon_prefix">Primer Apellido</label>
        </div>
        <div class="input-field col  s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="sapellido" type="text" class="validate">
          <label for="icon_prefix">Segundo Apellido</label>
        </div>
        
      </div>
<br>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
  </div>
  
      
      <div class="input-field col s6">
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
  <div class="input-field col  s6">
          <i class="material-icons prefix">fingerprint</i>
          <input id="icon_prefix" name="id" type="text" class="validate">
          <label for="icon_prefix">Numero de Identificacion</label>
        </div>

 <div class="input-field col s6">
    <select name="genero">
      <option value="" disabled selected>Elija una opcion</option>
      <option value="Femenino">Femenino</option>
      <option value="Masculino">Masculino</option>

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
<div class="input-field col s6" style="margin-bottom: 50px;">
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


<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>