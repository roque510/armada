<?php 
$usr = "";
if(isset($_GET['usr']))
  $usr = $_GET['usr'];
?>
  <ul class="pagination">
    
    <li class="waves-effect"><a href="?pg=veridoc&usr=<?php echo $usr ?>">Datos del Cliente</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_1&usr=<?php echo $usr ?>">Datos del Domicilio</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_2&usr=<?php echo $usr ?>">Trabajo</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_3&usr=<?php echo $usr ?>">Propiedades</a></li>
    <li class="active teal"><a href="?pg=veridoc_4&usr=<?php echo $usr ?>">Referencias Personales</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_5&usr=<?php echo $usr ?>">Datos de Venta</a></li>
    <a id="devoluciones" class="waves-effect waves-light btn"><i class="material-icons right">call_missed</i>Devolver solicitud</a>    
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

$entidadA = $database->select("referencias_personales","*",["entidad_id" => $usr ]);


 ?>
 <br>
 <br>
  <div class="row container">
    <form id="veridocform4" class="col s12" method="post" action="veridocform4.php" enctype="multipart/form-data">
      <div class="row">
          <div class="col s12 m3">
            <label>Tipo Relación</label>
              <select name="tiporelacionA">
                <option value="" disabled selected>Elija El Tipo Relación</option>
                <?php 
        
        $datas = $database->select("referencias_relaciones", ["referencia_relacion_id","referencia_relacion_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["referencia_relacion_id"].'" '; if($data["referencia_relacion_id"] == $entidadA[0]['referencia_relacion_id']) { echo "selected";} echo ' >'.$data["referencia_relacion_descripcion"].'</option>';
          }
       ?>
              </select>
          </div >
            <div class="input-field col s12 m9">
              <i class="material-icons prefix">date_range</i>
              <input id="icon_prefix2" type="date" name="antiguedadRelA" class="datepicker" value='<?php echo $entidadA[0]['referencias_personales_antiguedad']; ?>'>
              <label for="icon_prefix2">Antiguedad de Relación</label>
            </div>
            
      </div>
      <div class="row">
          <div class="input-field col s12 m6">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="pnombreA" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_pnombre']; ?>'>
              <label for="icon_prefix">Primer Nombre</label>
          </div>
          <div class="input-field col s12 m6">
              <input id="icon_prefix" name="snombreA" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_snombre']; ?>'>
              <label for="icon_prefix">Segundo Nombre</label>
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m6">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="papellidoA" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_papellido']; ?>'>
              <label for="icon_prefix">Primer Apellido</label>
          </div>
          <div class="input-field col s12 m6">
              <input id="icon_prefix" name="sapellidoA" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_sapellido']; ?>'>
              <label for="icon_prefix">Segundo Apellido</label>
          </div>
      </div>
      
      <div class="row">
             <div class="col s12 m3">
              <label>Tipo Telefono</label>
                <select name="tipotelA">
                  <option value="" disabled selected>Elija Tipo Telefono</option>
                   <?php 
        
        $datas = $database->select("telefonos_tipos", ["telefono_tipo_id","telefono_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["telefono_tipo_id"].'" '; if($data["telefono_tipo_id"] == $entidadA[0]['referencia_tipo_tel']) { echo "selected";} echo ' >'.$data["telefono_descripcion"].'</option>';
          }
       ?>
                </select>
            </div >
            <div class="input-field col s12 m3">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="telA" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_telefono']; ?>'>
              <label for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="extA" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_extension']; ?>'>
              <label for="icon_prefix">Extension</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="hcA" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_hora_contacto']; ?>'>
              <label for="icon_prefix">Hora Contactar</label>
            </div>
        </div>
<br>

<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>

 <div class="row">
          <div class="col s12 m3">
            <label>Tipo Relación</label>
              <select name="tiporelacionB">
                <option value="" disabled selected>Elija El Tipo Relación</option>
                <?php 
        
        $datas = $database->select("referencias_relaciones", ["referencia_relacion_id","referencia_relacion_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["referencia_relacion_id"].'" '; if($data["referencia_relacion_id"] == $entidadA[1]['referencia_relacion_id']) { echo "selected";} echo ' >'.$data["referencia_relacion_descripcion"].'</option>';
          }
       ?>
              </select>
          </div >
            <div class="input-field col s12 m9">
              <i class="material-icons prefix">date_range</i>
              <input id="sdfsdf" type="date" name="antiguedadRelB" class="datepicker" value='<?php echo $entidadA[1]['referencias_personales_antiguedad']; ?>'>
              <label for="sdfsdf">Antiguedad de Relación</label>
            </div>
            
      </div>
      <div class="row">
          <div class="input-field col s12 m6">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="pnombreB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_pnombre']; ?>'>
              <label for="icon_prefix">Primer Nombre</label>
          </div>
          <div class="input-field col s12 m6">
              <input id="icon_prefix" name="snombreB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_snombre']; ?>'>
              <label for="icon_prefix">Segundo Nombre</label>
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m6">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="papellidoB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_papellido']; ?>'>
              <label for="icon_prefix">Primer Apellido</label>
          </div>
          <div class="input-field col s12 m6">
              <input id="icon_prefix" name="sapellidoB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_sapellido']; ?>'>
              <label for="icon_prefix">Segundo Apellido</label>
          </div>
      </div>
      
      <div class="row">
             <div class="col s12 m3">
              <label>Tipo Telefono</label>
                <select name="tipotelB">
                  <option value="" disabled selected>Elija Tipo Telefono</option>
                   <?php 
        
        $datas = $database->select("telefonos_tipos", ["telefono_tipo_id","telefono_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["telefono_tipo_id"].'" '; if($data["telefono_tipo_id"] == $entidadA[1]['referencia_tipo_tel']) { echo "selected";} echo ' >'.$data["telefono_descripcion"].'</option>';
          }
       ?>
                </select>
            </div >
            <div class="input-field col s12 m3">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="telB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_telefono']; ?>'>
              <label for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="extB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_extension']; ?>'>
              <label for="icon_prefix">Extension</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="hcB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_hora_contacto']; ?>'>
              <label for="icon_prefix">Hora Contactar</label>
            </div>
        </div>
<br>

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