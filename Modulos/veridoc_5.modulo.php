<?php 
$s = "";
if(isset($_GET['usr']))
  $usr = $_GET['usr'];
?>
  <ul class="pagination">
    
    <li class="waves-effect"><a href="?pg=veridoc&usr=<?php echo $usr ?>">Datos del Cliente</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_1&usr=<?php echo $usr ?>">Datos del Domicilio</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_2&usr=<?php echo $usr ?>">Trabajo</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_3&usr=<?php echo $usr ?>">Propiedades</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_4&usr=<?php echo $usr ?>">Referencias Personales</a></li>
    <li class="active teal"><a href="?pg=veridoc_5&usr=<?php echo $usr ?>">Datos de Venta</a></li>
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

$cliente = $database->select("clientes", "*",["entidad_id" => $usr]); 
$vendedorAlias = $database->get("clientes",["cliente_usuario_creacion"],["entidad_id" => $usr]);
$vendedor = $database->get("usuarios","*",["usuario_alias" => $vendedorAlias]);
$ciaID = $database->get("usuarios_cias","*",["usuario_id" => $vendedor["usuario_id"] ]);
$cia = $database->get("cias","*",["cia_id" => $ciaID]);
$solicitud = $database->select("solicitudes", "*",["entidad_id" => $usr]);
$entidad = $database->select("entidades", "*",["entidad_id" => $usr]);

$tid = $database->select("entidades_telefonos", "*",["entidad_id" => $usr]);
$telefonos  = $database->select("telefonos", "*",["telefono_id" => $tid[0]['telefono_id']]);
$telefonos2  = $database->select("telefonos", "*",["telefono_id" => $tid[0]['telefono_id2']]);
$telefonos3  = $database->select("telefonos", "*",["telefono_id" => $tid[0]['telefono_id3']]);

$empleo  = $database->select("empleos", "*",["entidad_id" => $usr]);
$telefonosT  = $database->select("telefonos", "*",["telefono_id" => $empleo[0]['telefono_id']]);

$entidadA = $database->select("referencias_personales","*",["entidad_id" => $usr ]);


 ?>
 <br>
 <br>
  <div class="row container">
    <form id="reporte" class="col s12" method="post" action="reporte.php" enctype="multipart/form-data">

        <div class="row">
            <div class="input-field col s12 m6">
              <i class="material-icons prefix">account_circle</i>
              <input style="color: grey;" disabled id="icon_prefix" name="solicitud_ingresada_por" type="text" class="validate" value="<?php echo $vendedorAlias["cliente_usuario_creacion"]; ?>">
              <label class="active" style="color: grey;" for="icon_prefix">Solicitud Ingresada Por:</label>
            </div>
            <div class="input-field col s12 m6">
              <i class="material-icons prefix">store</i>
              <input style="color: grey;" disabled id="icon_prefix" name="sucursal" type="text" class="validate" value="Sucursal La Ceiba - #2">
              <label class="active" style="color: grey;" for="icon_prefix">Sucursal</label>
            </div>
            <div class="input-field col s12 m12">
              <i class="material-icons prefix">business</i>
              <input style="color: grey;" disabled id="icon_prefix" name="cia" type="text" class="validate" value="<?php echo $cia["cia_descripcion"]; ?>">
              <label class="active" style="color: grey;" for="icon_prefix">Compañia</label>
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
        <label class="active" for="icon_prefix">Monto Solicitado</label>
      </div>
      <div class="input-field col s12 m4">
        <input id="icon_prefix" style="color: grey;" disabled name="snombre" type="text" class="validate" value="<?php echo $cliente[0]["cliente_cuota"]; ?>" >
        <label class="active" for="icon_prefix">Cuota Solicitada</label>
      </div>
      <div class="input-field col s12 m4">
        <input id="icon_prefix" style="color: grey;" disabled name="snombre" type="text" class="validate" value="<?php echo $cliente[0]["cliente_plazo"]; ?>" >
        <label class="active" for="icon_prefix">Plazo en Meses</label>
      </div>
  </div>
  <input type="hidden" name="usr" value="<?php echo $_GET['usr']; ?>"></input>

  <div class="col m12">
      <p class="right-align">
         
        

        
      </p>
    </div>

    <input type="hidden" id="telspersonal1" name="telspersonal1" value="No Revisado">
    <input type="hidden" id="telspersonal2" name="telspersonal2" value="No Revisado">
    <input type="hidden" id="telspersonal3" name="telspersonal3" value="No Revisado">
    <input type="hidden" id="teltrabajo" name="teltrabajo" value="No Revisado">
    <input type="hidden" id="telref1" name="telref1" value="No Revisado">
    <input type="hidden" id="telref2" name="telref2" value="No Revisado">

  </form>
  <button id="modalopener" data-target="modal1" class="btn modal-trigger">Evaluar políticas </button>

    <!-- Modal Trigger -->
  

  <!-- Modal Structure -->

        <div id="moda" class="modal modal-fixed-footer">
    <div class="modal-content">
      <h4>Verificacion de Informacion.</h4>
      <p>Telefonos del cliente.</p>
      <div class="row">
             <div class="input-field col s12 m5">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="pnombreA" type="text" class="validate" value='<?php echo $entidad[0]['entidad_primer_nombre'].' '.$entidad[0]['entidad_segundo_nombre'].' '.$entidad[0]['entidad_primer_apellido'].' '.$entidad[0]['entidad_segund_apellido']; ?>'>
              <label class="active" for="icon_prefix">Nombre</label>
          </div>
            <div class="input-field col s12 m5">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="telefono" type="text" class="validate" value="<?php echo $telefonos[0]['telefono_numero'] ?>">
              <label class="active" for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m2">
              <input id="icon_prefix" name="extension" type="text" class="validate" value="<?php echo $telefonos[0]['telefono_extesnion'] ?>">
              <label class="active" for="icon_prefix">Extension</label>
            </div>
        
    <div class="row">
    <p class="col push-m1 m4">
      <input type="checkbox" id="indeterminate-checkbox1" />
      <label for="indeterminate-checkbox1">Marcar una vez revisado</label>
    </p>

    <select class="col push-m1 m6" name="verioptions1" id="verioptions1">
      <option value="Positivo">Positivo</option>
      <option value="Negativo">Negativo</option>
      <option value="Pendiente">Pendiente</option>
      <option value="noinfo">No Proporciono Informacion</option>
    </select>
          
    </div>
            
        </div> 
         <div class="row">
             
            <div class="input-field col s12 m5">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="telefono2" type="text" class="validate" value="<?php echo $telefonos2[0]['telefono_numero'] ?>">
              <label class="active" for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m5">
              <input id="icon_prefix" name="extension2" type="text" class="validate" value="<?php echo $telefonos2[0]['telefono_extesnion'] ?>">
              <label class="active" for="icon_prefix">Extension</label>
            </div>
             <div class="row">
    <p class="col push-m1 m4">
      <input type="checkbox" id="indeterminate-checkbox2" />
      <label for="indeterminate-checkbox2">Marcar una vez revisado</label>
    </p>

    <select class="col push-m1 m6" name="verioptions2" id="verioptions2">
      <option value="Positivo">Positivo</option>
      <option value="Negativo">Negativo</option>
      <option value="Pendiente">Pendiente</option>
      <option value="noinfo">No Proporciono Informacion</option>
    </select>
          
    </div>
           
        </div> 
         <div class="row">

              
            <div class="input-field col s12 m5">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="telefono3" type="text" class="validate" value="<?php echo $telefonos3[0]['telefono_numero'] ?>">
              <label class="active" for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m5">
              <input id="icon_prefix" name="extension3" type="text" class="validate" value="<?php echo $telefonos3[0]['telefono_extesnion'] ?>">
              <label class="active" for="icon_prefix">Extension</label>
            </div>
           
            <div class="row">
    <p class="col push-m1 m4">
      <input type="checkbox" id="indeterminate-checkbox3" />
      <label for="indeterminate-checkbox3">Marcar una vez revisado</label>
    </p>

    <select class="col push-m1 m6" name="verioptions3" id="verioptions3">
      <option value="Positivo">Positivo</option>
      <option value="Negativo">Negativo</option>
      <option value="Pendiente">Pendiente</option>
      <option value="noinfo">No Proporciono Informacion</option>
    </select>
          
    </div>

        </div>
          <p>Telefonos del Trabajo.</p>
    <div class="row">
    <div class="input-field col s12 m5">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="cia" type="text" class="validate" value='<?php echo $empleo[0]['empleo_nombre']; ?>'>
              <label class="active" for="icon_prefix">Nombre Empresa</label>
          </div>
             
            <div class="input-field col s12 m5">
              <i class="material-icons prefix">phone</i>
              <input id="" name="tel" type="text" class="validate" value='<?php echo $telefonosT[0]['telefono_numero']; ?>'>
              <label class="active" for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m2">
              <input id="" name="ext" type="text" class="validate" value='<?php echo $telefonosT[0]['telefono_extesnion']; ?>'>
              <label class="active" for="icon_prefix">Extension</label>
            </div>
          
        <div class="row">
    <p class="col push-m1 m4">
      <input type="checkbox" id="indeterminate-checkbox4" />
      <label for="indeterminate-checkbox4">Marcar una vez revisado</label>
    </p>

    <select class="col push-m1 m6" name="verioptions4" id="verioptions4">
      <option value="Positivo">Positivo</option>
      <option value="Negativo">Negativo</option>
      <option value="Pendiente">Pendiente</option>
      <option value="noinfo">No Proporciono Informacion</option>
    </select>
          
    </div>


        </div>
        <p>Referencias Personales</p>
        <div class="row">
             <div class="input-field col s12 m5">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="pnombreA" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_pnombre'].' '.$entidadA[0]['referencia_snombre'].' '.$entidadA[0]['referencia_papellido'].' '.$entidadA[0]['referencia_sapellido']; ?>'>
              <label class="active" for="icon_prefix">Nombre</label>
          </div>
            <div class="input-field col s12 m3">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="telB" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_telefono']; ?>'>
              <label class="active" for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m2">
              <input id="icon_prefix" name="extB" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_extension']; ?>'>
              <label class="active" for="icon_prefix">Extension</label>
            </div>
            <div class="input-field col s12 m2">
              <input id="icon_prefix" name="hcB" type="text" class="validate" value='<?php echo $entidadA[0]['referencia_hora_contacto']; ?>'>
              <label class="active" for="icon_prefix">Hora Contactar</label>
            </div>
            <div class="row">
    <p class="col push-m1 m4">
      <input type="checkbox" id="indeterminate-checkbox5" />
      <label for="indeterminate-checkbox5">Marcar una vez revisado</label>
    </p>

    <select class="col push-m1 m6" name="verioptions5" id="verioptions5">
      <option value="Positivo">Positivo</option>
      <option value="Negativo">Negativo</option>
      <option value="Pendiente">Pendiente</option>
      <option value="noinfo">No Proporciono Informacion</option>
    </select>
          
    </div>
        </div>
        <br>
        <div class="row">
             <div class="input-field col s12 m5">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="pnombreA" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_pnombre'].' '.$entidadA[1]['referencia_snombre'].' '.$entidadA[1]['referencia_papellido'].' '.$entidadA[1]['referencia_sapellido']; ?>'>
              <label class="active" for="icon_prefix">Nombre</label>
          </div>
            <div class="input-field col s12 m3">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="telB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_telefono']; ?>'>
              <label class="active" for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m2">
              <input id="icon_prefix" name="extB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_extension']; ?>'>
              <label class="active" for="icon_prefix">Extension</label>
            </div>
            <div class="input-field col s12 m2">
              <input id="icon_prefix" name="hcB" type="text" class="validate" value='<?php echo $entidadA[1]['referencia_hora_contacto']; ?>'>
              <label class="active" for="icon_prefix">Hora Contactar</label>
            </div>
            <div class="row">
    <p class="col push-m1 m4">
      <input type="checkbox" id="indeterminate-checkbox6" />
      <label for="indeterminate-checkbox6">Marcar una vez revisado</label>
    </p>

    <select class="col push-m1 m6" name="verioptions6" id="verioptions6">
      <option value="Positivo">Positivo</option>
      <option value="Negativo">Negativo</option>
      <option value="Pendiente">Pendiente</option>
      <option value="noinfo">No Proporciono Informacion</option>
    </select>
          
    </div>
        </div>




    </div>
  
    

    <!-- FOOTER DEL MODAL  -->
    <div style="height: 60px !important;" class="modal-footer">
    
      <button id="mreport"  class="btn btn-small waves-effect waves-light" name="action">Mostrar Reporte</button>
      <a id="devoluciones" style="margin-right:10px;" class="waves-effect waves-light btn"><i class="material-icons right">call_missed</i>Devolver solicitud</a>
          <!--a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Agree</a-->
    </div>

  </div>

   
