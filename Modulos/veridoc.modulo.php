<?php 
$usr = "";
if(isset($_GET['usr']))
  $usr = $_GET['usr'];


?>
  <ul class="pagination center">
    
    <li class="active teal"><a href="?pg=veridoc&usr=<?php echo $usr ?>">Datos del Cliente</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_1&usr=<?php echo $usr ?>">Datos del Domicilio</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_2&usr=<?php echo $usr ?>">Trabajo</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_3&usr=<?php echo $usr ?>">Propiedades</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_4&usr=<?php echo $usr ?>">Referencias Personales</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_5&usr=<?php echo $usr ?>">Datos de Venta</a></li>
    <a id="dvfrmbtn" class="waves-effect waves-light btn"><i class="material-icons right">call_missed</i>Devolver solicitud</a>    
  </ul>
   <form id="dvfrm" action="dvfrm.php" method="POST" >
    <input id="userVal" type="hidden" name="user" value="<?php echo $usr; ?>">    
    </form>

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


$subsid = $database->get("solicitudes", "subestatus_id",["entidad_id" => $usr]);
$string = '?pg=error&msg=usuario_no_definido';
$string1 = '?pg=error';
$string2 = '?pg=error&msg=solicitud_terminada';
if (!isset($_GET['usr'])) {
  echo " <script> window.location='".$string."';</script>";
}
if(!isset($_SESSION['anl']) && $_SESSION['grpid'] != 2){  
  echo " <script> window.location='".$string1."';</script>";
}
if ($subsid == 1) {
  if (!isset($_SESSION['anl'])) {
    echo " <script> window.location='".$string2."';</script>";
  }
  
}

        $num = $_GET['usr'];
        
        $entidad = $database->select("entidades", "*",["entidad_id" => $num]);
        $cliente = $database->select("clientes", "*",["entidad_id" => $num]);
        $solicitud = $database->select("solicitudes", "*",["entidad_id" => $num]);
        $id = $database->select("identificaciones", "*",["entidad_id" => $num]);
         $tid = $database->select("entidades_telefonos", "*",["entidad_id" => $num]);
        $telefonos  = $database->select("telefonos", "*",["telefono_id" => $tid[0]['telefono_id']]);

 
 //

 if ($database->has("blacklist_identidad", [
  "AND" => [
    
    "blacklist_identidad" => trim($id[0]['identificacion_numero']," ")
  ]
]))
{
  echo '<div id="infolista" class="row"><div class="col s12"><div id="card-alert" class="card red lighten-5"><div class="card-content red-text"><p>OJO : este usuario se encuentra en la lista negra.</p></div></div> </div>';
  
}
else
{
  
  
}      


 ?>
 
 

   
 </div>
 
 <br>
 <br>
  <div class="row container">
    <form id="veridocform" class="col s12" method="post" action="veridocform.php" enctype="multipart/form-data">
      <div class="row">
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="text" name="pnombre" class="validate" value='<?php echo $entidad[0]['entidad_primer_nombre']; ?>'>
          <label class="active" for="icon_prefix">Primer Nombre</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="snombre" type="text" class="validate" value='<?php echo $entidad[0]['entidad_segundo_nombre']; ?>' >
          <label class="active" for="icon_prefix">Segundo Nombre</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="papellido" type="text" class="validate" value='<?php echo $entidad[0]['entidad_primer_apellido']; ?>' >
          <label class="active" for="icon_prefix">Primer Apellido</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" name="sapellido" type="text" class="validate" value='<?php echo $entidad[0]['entidad_segund_apellido']; ?>' >
          <label class="active" for="icon_prefix">Segundo Apellido</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">cake</i>
          <input id="icon_prefix2" type="date" name="fechanac" class="datepicker" value='<?php echo $entidad[0]['entidad_fecha_nacimiento']; ?>'>
          <label  class="active" for="icon_prefix2">Fecha Nacimiento</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">mail_outline</i>
          <input id="icon_prefix" type="text" name="correo" class="validate" value='<?php echo $entidad[0]['entidad_correo']; ?>' >
          <label class="active" for="icon_prefix">Correo</label>
        </div>
        <div class="input-field col s12 m6">
          <i class="material-icons prefix">fingerprint</i>
          <input id="icon_prefixid" name="id" type="text" value=" <?php echo $id[0]['identificacion_numero'];?> " class="validate">
          <label class="active" for="icon_prefix">Numero de Identificacion</label>
        </div>

        <div class="col s12 m6">
          <a id="listanegra" class="btn-floating btn-large waves-effect waves-light red "><i class="material-icons">add</i></a>
          <label>Agregar a lista negra</label>
        </div>

        
        
        
      </div>
      <div class="row">
             <div class="col s12 m4">
              <label>Tipo Telefono</label>
                <select name="tipo_telefono">
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
              <input id="icon_prefix" name="telefono" type="text" class="validate" value="<?php echo $telefonos[0]['telefono_numero'] ?>">
              <label class="active" for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="extension" type="text" class="validate" value="<?php echo $telefonos[0]['telefono_extesnion'] ?>">
              <label class="active" for="icon_prefix">Extension</label>
            </div>
        </div> 
<br>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
  </div>
  
      
      <div class="input-field col s12 m6">
    <select name="tipo_id">
      
      <?php 
        
        $datas = $database->select("identificaciones_tipos", ["identificacion_tipo_descripcion","identificacion_tipo_id"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["identificacion_tipo_id"].'" '; if($data["identificacion_tipo_id"] == $entidad[0]["entidad_tipo_id"]) { echo "selected";} echo ' >'.$data["identificacion_tipo_descripcion"].'</option>';
          }
       ?>
      

    </select>
    <label>Tipo de Identificacion</label>
  </div>
  

 <div class="input-field col s12 m6">
    <select name="genero">
      <option value="" disabled <?php if(!$entidad[0]["entidad_genero"]) { echo "selected";} ?> >Elija una opcion</option>
      <option value="Femenino" <?php if("Femenino" == $entidad[0]["entidad_genero"]) { echo "selected";} ?> >Femenino</option>
      <option value="Masculino" <?php if("Masculino" == $entidad[0]["entidad_genero"]) { echo "selected";} ?> >Masculino</option>

    </select>
    <label>Genero</label>
  </div>

   <div class="input-field col s12 m6">
    <select name="nacionalidad">
      <option value="" disabled selected>Elija una opcion</option>
      <?php 
        
        $datas = $database->select("pais", ["pais_nombre","pais_id"], ["pais_id[>]" => 0]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["pais_id"].'" '; if($data["pais_id"] == $entidad[0]['entidad_nacionalidad']) { echo "selected";} echo ' >'.$data["pais_nombre"].'</option>';
          }
       ?>

    </select>
    <label>Nacionalidad</label>
  </div>
  <div class="input-field col s12 m6">
    <select name="tipo_cliente">
      <option value="" disabled selected>Elija una opcion</option>
      <?php 
        
        $datas = $database->select("entidades_tipos", ["entidad_tipo_descripcion","entidad_tipo_id"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["entidad_tipo_id"].'" '; if($data["entidad_tipo_id"] == $cliente[0]['cliente_tipo']) { echo "selected";} echo ' >'.$data["entidad_tipo_descripcion"].'</option>';
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
            echo '<option value="'.$data["solicitud_canal_id"].'" '; if($solicitud[0]["solicitud_canal_id"] == $data["solicitud_canal_id"] ) { echo "selected";} echo ' >'.$data["solicitud_canal_descripcion"].'</option>';
          }
       ?>

    </select>
    <label>Canal de Venta</label>
  </div>
  <div class="input-field col s12 m6">
    <select name="estado_civil">
      <option value="" disabled selected>Elija una opcion</option>
      <?php 
        
        $datas = $database->select("estados_civiles", ["estado_civil_descripcion","estado_civil_id"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["estado_civil_id"].'" '; if($data["estado_civil_id"] == $entidad[0]['estado_civil_id']) { echo "selected";} echo ' >'.$data["estado_civil_descripcion"].'</option>';
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
            echo '<option value="'.$data["nivel_edu_id"].'" '; if($data["nivel_edu_id"] == $cliente[0]['nivel_edu_id']) { echo "selected";} echo ' >'.$data["nivel_edu_descrip"].'</option>';
          }
       ?>

    </select>
    <label>Nivel educativo</label>
  </div>




  <input type="hidden" name="usr" value="<?php echo $_GET['usr']; ?>">


<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>  
<div class="row">
    <div class="col m12">
      <p class="right-align">
        <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Salvar</button>
      </p>
    </div>
  </div>

  </form>