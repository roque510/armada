<?php 
$usr = "";
if(isset($_GET['usr']))
  $usr = $_GET['usr'];
?>
  <ul class="pagination">
    
    <li class="waves-effect"><a href="?pg=veridoc&usr=<?php echo $usr ?>">Datos del Cliente</a></li>
    <li class="active teal"><a href="?pg=veridoc_1&usr=<?php echo $usr ?>">Datos del Domicilio</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_2&usr=<?php echo $usr ?>">Trabajo</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_3&usr=<?php echo $usr ?>">Propiedades</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_4&usr=<?php echo $usr ?>">Referencias Personales</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_5&usr=<?php echo $usr ?>">Datos de Venta</a></li>
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

$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);

$subsid = $database->get("solicitudes", "subestatus_id",["entidad_id" => $usr]);
$string = 'Location: ?pg=error&msg=usuario_no_definido';
$string1 = 'Location: ?pg=error';
$string2 = 'Location: ?pg=error&msg=solicitud_terminada';
if (!isset($_GET['usr'])) {
  header($string);
}
if(!isset($_SESSION['anl']) && $_SESSION['grpid'] != 2){  
  header($string1);
}
if ($subsid == 1) {
  if (!isset($_SESSION['anl'])) {
    header($string2);
  }
  
}

        $num = $_GET['usr'];
        
        $entidad = $database->select("entidades", "*",["entidad_id" => $num]);
        $did = $database->select("entidades_direcciones", "*",["entidad_id" => $num]);
        $direcciones  = $database->select("direcciones", "*",["direccion_id" => $did[0]['direccion_id']]);
        $propiedades  = $database->select("propiedades", "*",["direccion_id" => $did[0]['direccion_id']]);
        $tid = $database->select("entidades_telefonos", "*",["entidad_id" => $num]);
        $telefonos  = $database->select("telefonos", "*",["telefono_id" => $tid[0]['telefono_id']]);
        $telefonos2  = $database->select("telefonos", "*",["telefono_id" => $tid[0]['telefono_id2']]);
        $telefonos3  = $database->select("telefonos", "*",["telefono_id" => $tid[0]['telefono_id3']]);
      
      /*var_dump($entidad);
      var_dump($did);
      var_dump($direcciones);
      var_dump($propiedades);
      var_dump($tid);
      var_dump($telefonos);*/

 ?>
 <br>
 <br>
  <div class="row container">
    <form id="veridocform1" class="col s12" method="post" action="veridocform1.php" enctype="multipart/form-data">
      <div class="row">
        <div class="col s12 m4">
          <label>Estado Dirección</label>
            <select name="estado_direccion">
              <option value="" disabled selected="">Elija el estatus</option>
              <?php 
        
        $datas = $database->select("estatus", ["estatus_id","estatus_desripcion"],["estatus_comentario" => "direccion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["estatus_id"].'" '; if($data["estatus_id"] == $direcciones[0]['estatus_id']) { echo "selected";} echo ' >'.$data["estatus_desripcion"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="col s12 m4">
          <label>Tipo de Dirección</label>
            <select name="tipo_direccion">
              <option value="" disabled selected>Elija el Tipo</option>
              <?php 
        
        $datas = $database->select("direcciones_tipos", ["direccion_tipo_id","direccion_tipo_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["direccion_tipo_id"].'" '; if($data["direccion_tipo_id"] == $direcciones[0]['direccion_tipo_id']) { echo "selected";} echo ' >'.$data["direccion_tipo_descripcion"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="col s12 m4">
          <label>Tipo de Propiedad</label>
            <select name="tipo_propiedad">
              <option value="" disabled selected>Elija la Propiedad</option>
              <?php 
        
        $datas = $database->select("propiedades_tipos", ["propiedad_tipo_id","propiedad_tipo_descripcion"],["propiedad_descripcion" => 'domicilio']);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["propiedad_tipo_id"].'" '; if($data["propiedad_tipo_id"] == $propiedades[0]['propiedad_tipo_id']) { echo "selected";} echo ' >'.$data["propiedad_tipo_descripcion"].'</option>';
          }
       ?>
            </select>
        </div >
      </div>
        <div class="row">
            <div class="input-field col s12 m6">
              <i class="material-icons prefix">date_range</i>
              <input id="icon_prefix2" type="date" name="fechaantiguedad" class="datepicker active" value='<?php echo $direcciones[0]['direccion_antiguedad']; ?>'>
              <label class="active" for="icon_prefix2">Antiguedad de la propiedad</label>
            </div>
            <b id="Diasanti" class="col s12 m6">-</b>
            <!--div class="input-field col s12 m3">
              <i class="material-icons prefix">history</i>
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Años</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Meses</label>
            </div -->
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
         <div class="row">
             <div class="col s12 m4">
              <label>Tipo Telefono</label>
                <select name="tipo_telefono2">
                  <option value="" disabled selected>Elija Tipo Telefono</option>
                  <?php 
        
        $datas = $database->select("telefonos_tipos", ["telefono_tipo_id","telefono_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["telefono_tipo_id"].'" '; if($data["telefono_tipo_id"] == $telefonos2[0]['telefono_tipo_id']) { echo "selected";} echo ' >'.$data["telefono_descripcion"].'</option>';
          }
       ?>
                </select>
            </div >
            <div class="input-field col s12 m5">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="telefono2" type="text" class="validate" value="<?php echo $telefonos2[0]['telefono_numero'] ?>">
              <label class="active" for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="extension2" type="text" class="validate" value="<?php echo $telefonos2[0]['telefono_extesnion'] ?>">
              <label class="active" for="icon_prefix">Extension</label>
            </div>
        </div> 
         <div class="row">
             <div class="col s12 m4">
              <label>Tipo Telefono</label>
                <select name="tipo_telefono3">
                  <option value="" disabled selected>Elija Tipo Telefono</option>
                  <?php 
        
        $datas = $database->select("telefonos_tipos", ["telefono_tipo_id","telefono_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["telefono_tipo_id"].'" '; if($data["telefono_tipo_id"] == $telefonos3[0]['telefono_tipo_id']) { echo "selected";} echo ' >'.$data["telefono_descripcion"].'</option>';
          }
       ?>
                </select>
            </div >
            <div class="input-field col s12 m5">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="telefono3" type="text" class="validate" value="<?php echo $telefonos3[0]['telefono_numero'] ?>">
              <label class="active" for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="extension3" type="text" class="validate" value="<?php echo $telefonos3[0]['telefono_extesnion'] ?>">
              <label class="active" for="icon_prefix">Extension</label>
            </div>
        </div>             
<br>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
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
          <label>Departamento</label>
            <select name="departamento">
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
            <select name="municipio">
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
            <input id="icon_prefix" name="direccion" type="text" class="validate" value="<?php echo $direcciones[0]['direccion_descripcion']; ?>">
            <label class="active" for="icon_prefix">Dirección</label>
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m3">
            <input id="icon_prefix" name="cp" type="text" class="validate" value="<?php echo $direcciones[0]['direccion_codigo_postal']; ?>">
            <label class="active" for="icon_prefix">Código Postal</label>
          </div>
          <div class="input-field col s12 m6">
            <i class="material-icons prefix">my_location</i>
            <input id="icon_prefix" name="pr" type="text" class="validate" value="<?php echo $direcciones[0]['direccion_punto_referencia']; ?>">
            <label class="active" for="icon_prefix">Punto de Referencia</label>
          </div>
          <div class="input-field col s12 m3">
            <input id="icon_prefix" name="nc" type="text" class="validate" value="<?php echo $direcciones[0]['direccion_numero_casa']; ?>">
            <label class="active" for="icon_prefix">Numero Casa</label>
          </div>
      </div>

<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>

      <input type="hidden" name="usr" value="<?php echo $_GET['usr']; ?>">

      <div class="row">
    <div class="col m12">
      <p class="right-align">
        <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Salvar</button>
      </p>
    </div>
  </div>

</form>
