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

        $num = $_GET['usr'];
        
        $entidad = $database->select("entidades", "*",["entidad_id" => $num]);
        $cliente = $database->select("clientes", "*",["entidad_id" => $num]);
        $solicitud = $database->select("solicitudes", "*",["entidad_id" => $num]);
        $id = $database->select("identificaciones", "*",["entidad_id" => $num]);
      

 ?>
 <br>
 <br>
  <div class="row container">
    <form id="veridocform1" class="col s12" method="post" action="veridocform1.php" enctype="multipart/form-data">
      <div class="row">
        <div class="col s12 m4">
          <label>Estado Dirección</label>
            <select >
              <option value="" disabled selected="">Elija el estatus</option>
              <?php 
        
        $datas = $database->select("estatus", ["estatus_id","estatus_desripcion"],["estatus_comentario" => "direccion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["estatus_id"].'" '; if($data["estatus_id"] == 1/*$cliente[0]['nivel_edu_id']*/) { echo "selected";} echo ' >'.$data["estatus_desripcion"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="col s12 m4">
          <label>Tipo de Dirección</label>
            <select >
              <option value="" disabled selected>Elija el Tipo</option>
              <?php 
        
        $datas = $database->select("direcciones_tipos", ["direccion_tipo_id","direccion_tipo_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["direccion_tipo_id"].'" '; if($data["direccion_tipo_id"] == 4/*$cliente[0]['nivel_edu_id']*/) { echo "selected";} echo ' >'.$data["direccion_tipo_descripcion"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="col s12 m4">
          <label>Tipo de Propiedad</label>
            <select >
              <option value="" disabled selected>Elija la Propiedad</option>
              <?php 
        
        $datas = $database->select("propiedades_tipos", ["propiedad_tipo_id","propiedad_tipo_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["propiedad_tipo_id"].'" '; if($data["propiedad_tipo_id"] == 9/*$cliente[0]['nivel_edu_id']*/) { echo "selected";} echo ' >'.$data["propiedad_tipo_descripcion"].'</option>';
          }
       ?>
            </select>
        </div >
      </div>
        <div class="row">
            <div class="input-field col s12 m6">
              <i class="material-icons prefix">date_range</i>
              <input id="icon_prefix2" type="date" name="fechanac" class="datepicker">
              <label for="icon_prefix2">Antiguedad de la propiedad</label>
            </div>
            <div class="input-field col s12 m3">
              <i class="material-icons prefix">history</i>
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Años</slabel>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Meses</label>
            </div>
        </div>
        <div class="row">
             <div class="col s12 m4">
              <label>Tipo Telefono</label>
                <select >
                  <option value="" disabled selected>Elija Tipo Telefono</option>
                  <?php 
        
        $datas = $database->select("telefonos_tipos", ["telefono_tipo_id","telefono_descripcion"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["telefono_tipo_id"].'" '; if($data["telefono_tipo_id"] == 65/*$cliente[0]['nivel_edu_id']*/) { echo "selected";} echo ' >'.$data["telefono_descripcion"].'</option>';
          }
       ?>
                </select>
            </div >
            <div class="input-field col s12 m5">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Extension</label>
            </div>
        </div>             
<br>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
  </div>
  
      
      <div class="row">
        <div class="col s12 m4">
          <label>Pais</label>
            <select >
              <option value="" disabled selected>Elija el Pais</option>

<?php 
        
        $datas = $database->select("pais", ["pais_id","pais_nombre","flag"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option data-icon="img/'.$data["flag"].'.png" value="'.$data["pais_id"].'" '; if($data["pais_id"] == 65/*$cliente[0]['nivel_edu_id']*/) { echo "selected";} echo ' >'.$data["pais_nombre"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="col s12 m4">
          <label>Tipo de Dirección</label>
            <select >
              <option value="" disabled selected>Elija el Departamento</option>
               <?php 
        
        $datas = $database->select("departamentos", ["depto_id","depto_nombre"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["depto_id"].'" '; if($data["depto_id"] == 65/*$cliente[0]['nivel_edu_id']*/) { echo "selected";} echo ' >'.$data["depto_nombre"].'</option>';
          }
       ?>
            </select>
        </div >
        <div class="col s12 m4">
          <label>Municipio</label>
            <select >
              <option value="" disabled selected>Elija El Municipio</option>
              <?php 
        
        $datas = $database->select("municipios", ["municipio_id","municipio_nombre"]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["municipio_id"].'" '; if($data["municipio_id"] == 65/*$cliente[0]['nivel_edu_id']*/) { echo "selected";} echo ' >'.$data["municipio_nombre"].'</option>';
          }
       ?>
            </select>
        </div >
      </div>  

      <div class="row">
          <div class="input-field col  s12">
            <i class="material-icons prefix">edit_location</i>
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Dirección</label>
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m3">
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Código Postal</label>
          </div>
          <div class="input-field col s12 m6">
            <i class="material-icons prefix">my_location</i>
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Punto de Referencia</label>
          </div>
          <div class="input-field col s12 m3">
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Numero Casa</label>
          </div>
      </div>

</form>
<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>