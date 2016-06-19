<?php 
$usr = "";
if(isset($_GET['usr']))
  $usr = $_GET['usr'];
?>
  <ul class="pagination">
    
    <li class="waves-effect"><a href="?pg=veridoc&usr=<?php echo $usr ?>">Datos del Cliente</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_1&usr=<?php echo $usr ?>">Datos del Domicilio</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_2&usr=<?php echo $usr ?>">Trabajo</a></li>
    <li class="active teal"><a href="?pg=veridoc_3&usr=<?php echo $usr ?>">Propiedades</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_4&usr=<?php echo $usr ?>">Referencias Personales</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_5&usr=<?php echo $usr ?>">Datos de Venta</a></li>
    
  </ul>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
</div>

<?php 
require_once 'funciones.php';
require 'config.php';
require_once 'config.php';

$propiedades  = $database->select("propiedades", "*",["entidad_id" => $usr]);
$direcciones  = $database->select("direcciones", "*",["direccion_id" => $propiedades[0]['direccion_id']]);
      
 ?>
 <br>
 <br>
  <div class="row container">
    <form id="veridocform3" class="col s12" method="post" action="veridocform3.php" enctype="multipart/form-data">
      <div class="row">
        <div class="col s12 m4">
          <label>Tipo de Propiedad</label>
            <select name="tpropiedad">
              <option value="" disabled selected>Elija Tipo Propiedad</option>
              <?php 
        
        $datas = $database->select("propiedades_tipos", ["propiedad_tipo_id","propiedad_tipo_descripcion"],["propiedad_descripcion" => 'propiedades']);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["propiedad_tipo_id"].'" '; if($data["propiedad_tipo_id"] == $propiedades[0]['propiedad_tipo_id']) { echo "selected";} echo ' >'.$data["propiedad_tipo_descripcion"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="input-field col s12 m4">
            <i class="material-icons prefix">navigation</i>
            <input id="icon_prefix" name="nregistro" type="text" class="validate" value='<?php echo $propiedades[0]['propiedad_registro']; ?>' >
            <label for="icon_prefix">Numero de Registro</label>
        </div>
        <div class="input-field col s12 m4">
            <i class="material-icons prefix">local_atm</i>
            <input id="icon_prefix" name="vpropiedad" type="text" class="validate" value='<?php echo $propiedades[0]['propiedad_valor']; ?>' >
            <label for="icon_prefix">Valor de Propiedad</label>
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
          <label>Tipo de Dirección</label>
            <select name="dpto">
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
            <input id="icon_prefix" name="dir" type="text" class="validate" value='<?php echo $direcciones[0]['direccion_descripcion']; ?>' >
            <label for="icon_prefix">Dirección</label>
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
            <input id="icon_prefix" name="nc" type="text" class="validate" value='<?php echo $direcciones[0]['direccion_numero_casa']; ?>'>
            <label for="icon_prefix">Numero Casa</label>
          </div>
      </div>    
  

<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>

  <div class="row">
        <div class="input-field col s12">
          <textarea id="textarea1" class="materialize-textarea" name="observaciones"><?php echo $propiedades[0]['propiedad_comentario']; ?></textarea>
          <label for="textarea1">Observaciones</label>
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

