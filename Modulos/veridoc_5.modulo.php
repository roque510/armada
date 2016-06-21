<?php 
$s = "";
if(isset($_GET['usr']))
  $usr = $_GET['usr'];
?>
  <ul class="pagination">
    
    <li class="waves-effect"><a href="#!">Datos del Cliente</a></li>
    <li class="waves-effect"><a href="#!">Datos del Domicilio</a></li>
    <li class="waves-effect"><a href="#!">Trabajo</a></li>
    <li class="waves-effect"><a href="#!">Propiedades</a></li>
    <li class="waves-effect"><a href="#!">Referencias Personales</a></li>
    <li class="active teal"><a href="#!">Datos de Venta</a></li>
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
   
$cliente = $database->select("clientes", "*",["entidad_id" => $usr]); 
$vendedorAlias = $database->get("clientes",["cliente_usuario_creacion"],["entidad_id" => $usr]);
$vendedor = $database->get("usuarios","*",["usuario_alias" => $vendedorAlias]);
$ciaID = $database->get("usuarios_cias","*",["usuario_id" => $vendedor["usuario_id"] ]);
$cia = $database->get("cias","*",["cia_id" => $ciaID]);
$solicitud = $database->select("solicitudes", "*",["entidad_id" => $usr]);


 ?>
 <br>
 <br>
  <div class="row container">
    <form id="reporte" class="col s12" method="post" action="reporte.php" enctype="multipart/form-data">

        <div class="row">
            <div class="input-field col s12 m6">
              <i class="material-icons prefix">account_circle</i>
              <input style="color: grey;" disabled id="icon_prefix" name="solicitud_ingresada_por" type="text" class="validate" value="<?php echo $vendedorAlias["cliente_usuario_creacion"]; ?>">
              <label style="color: grey;" for="icon_prefix">Solicitud Ingresada Por:</label>
            </div>
            <div class="input-field col s12 m6">
              <i class="material-icons prefix">store</i>
              <input style="color: grey;" disabled id="icon_prefix" name="sucursal" type="text" class="validate" value="Sucursal La Ceiba - #2">
              <label style="color: grey;" for="icon_prefix">Sucursal</label>
            </div>
            <div class="input-field col s12 m12">
              <i class="material-icons prefix">business</i>
              <input style="color: grey;" disabled id="icon_prefix" name="cia" type="text" class="validate" value="<?php echo $cia["cia_descripcion"]; ?>">
              <label style="color: grey;" for="icon_prefix">Compañia</label>
            </div>
            
        </div>
      <div class="progress">
            <div class="determinate" style="width: 100%"></div>
      </div>
      <div class="row">
        <div class="input-field col s12 m6">
            <select name="tipo_cliente">
              <option value="" disabled selected>Elija Tipo Cliente</option>
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
        <div class="input-field col s12 m6">
            <select name="canal_venta">
              <option value="" disabled selected>Elija Canal de Ventas</option>
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
        
      </div>
<br>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
  </div>
  <div class="row">
      <div class="input-field col s12 m4">
        <i class="material-icons prefix">credit_card</i>
        <input id="icon_prefix" style="color: grey;" disabled name="snombre" type="text" class="validate" value="<?php echo $cliente[0]["cliente_limite_credito"]; ?>">
        <label for="icon_prefix">Monto Solicitado</label>
      </div>
      <div class="input-field col s12 m4">
        <input id="icon_prefix" style="color: grey;" disabled name="snombre" type="text" class="validate" value="<?php echo $cliente[0]["cliente_cuota"]; ?>" >
        <label for="icon_prefix">Cuota Solicitada</label>
      </div>
      <div class="input-field col s12 m4">
        <input id="icon_prefix" style="color: grey;" disabled name="snombre" type="text" class="validate" value="<?php echo $cliente[0]["cliente_plazo"]; ?>" >
        <label for="icon_prefix">Plazo en Meses</label>
      </div>
  </div>
  <input type="hidden" name="usr" value="<?php echo $_GET['usr']; ?>"></input>

  <div class="col m12">
      <p class="right-align">
        <button class="btn btn-large waves-effect waves-light" type="submit" name="action"><i class="material-icons">done</i><span style="margin-bottom: 10px;">Mostrar Reporte</span></button>
      </p>
    </div>
  </form>
   
