<?php 
$usr = "";
if(isset($_GET['usr']))
  $usr = $_GET['usr'];
?>
  <ul class="pagination">
    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
    <li class="waves-effect"><a href="?pg=veridoc&usr=<?php echo $usr ?>">Datos del Cliente</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_1&usr=<?php echo $usr ?>">Datos del Domicilio</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_2&usr=<?php echo $usr ?>">Trabajo</a></li>
    <li class="active teal"><a href="?pg=veridoc_3&usr=<?php echo $usr ?>">Propiedades</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_4&usr=<?php echo $usr ?>">Referencias Personales</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_5&usr=<?php echo $usr ?>">Datos de Venta</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_6&usr=<?php echo $usr ?>"><i class="material-icons">chevron_right</i></a></li>
  </ul>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
</div>

<?php 
require_once 'funciones.php';
require 'config.php';
require_once 'config.php';
      
 ?>
 <br>
 <br>
  <div class="row container">
    <form id="leform" class="col s12" method="post" action="clientf.php" enctype="multipart/form-data">
      <div class="row">
        <div class="col s12 m4">
          <label>Tipo de Propiedad</label>
            <select >
              <option value="" disabled selected>Elija Tipo Propiedad</option>
              <option value="1">Casa</option>
              <option value="2">Carro</option>
              <option value="3">Terreno</option>
              <option value="4">Negocio</option>
            </select>
        </div >
        <div class="input-field col s12 m4">
            <i class="material-icons prefix">navigation</i>
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Numero de Registro</label>
        </div>
        <div class="input-field col s12 m4">
            <i class="material-icons prefix">local_atm</i>
            <input id="icon_prefix" name="id" type="text" class="validate">
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
            <select >
              <option value="" disabled selected>Elija el Pais</option>
              <option value="1" data-icon="img/flag_hnd.png" class="circle">Honduras</option>
              <option value="2" data-icon="img/flag_sal.png" class="circle">El Salvador</option>
              <option value="3" data-icon="img/flag_nic.png" class="circle">Nicaragua</option>
              <option value="4" data-icon="img/flag_gtm.png" class="circle">Guatemala</option>
              <option value="5" data-icon="img/flag_crc.png" class="circle">Costa Rica</option>
              <option value="5" data-icon="img/flag_pan.png" class="circle">Panama</option>
            </select>
        </div >
        <div class="col s12 m4">
          <label>Tipo de Dirección</label>
            <select >
              <option value="" disabled selected>Elija el Departamento</option>
              <option value="1">Atlántida</option>
              <option value="2">Colón</option>
              <option value="3">Comayagua</option>
              <option value="4">Copán</option>
              <option value="5">Cortes</option>
              <option value="6">Choluteca</option>
              <option value="7">El Paraíso</option>
              <option value="8">Francisco Morazán</option>
              <option value="9">Gracias a Dios</option>
              <option value="10">Intibucá</option>
              <option value="11">Islas de la Bahía</option>
              <option value="12">La Paz</option>
              <option value="13">Lempira</option>
              <option value="14">Ocotepeque</option>
              <option value="15">Olancho</option>
              <option value="16">Santa Bárbara</option>
              <option value="17">Valle</option>
              <option value="18">Yoro</option>
            </select>
        </div >
        <div class="col s12 m4">
          <label>Municipio</label>
            <select >
              <option value="" disabled selected>Elija El Municipio</option>
              <option value= "1">San Pedro Sula</option>
              <option value="2">Tegucigalpa</option>
              <option value="3">Comayagua</option>
              <option value="4">La Ceiba</option>
              <option value="5">Trujillo</option>
              <option value="6">La Esperanza</option>
              <option value="7">La Paz</option>
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
  

<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>

  <div class="row">
        <div class="input-field col s12">
          <textarea id="textarea1" class="materialize-textarea"></textarea>
          <label for="textarea1">Observaciones</label>
        </div>
      </div>

