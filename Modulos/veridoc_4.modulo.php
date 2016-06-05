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
    <li class="waves-effect"><a href="?pg=veridoc_3&usr=<?php echo $usr ?>">Propiedades</a></li>
    <li class="active teal"><a href="?pg=veridoc_4&usr=<?php echo $usr ?>">Referencias Personales</a></li>
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
          <div class="col s12 m3">
            <label>Tipo Relación</label>
              <select >
                <option value="" disabled selected>Elija El Tipo Relación</option>
                <option value= "1">Amigo</option>
                <option value="2">Familiar</option>
                <option value="3">Compañero de Trabajo</option>
              </select>
          </div >
            <div class="input-field col s12 m3">
              <i class="material-icons prefix">date_range</i>
              <input id="icon_prefix2" type="date" name="fechanac" class="datepicker">
              <label for="icon_prefix2">Antiguedad de Relación</label>
            </div>
            <div class="input-field col s12 m3">
              <i class="material-icons prefix">history</i>
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Años</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Meses</label>
            </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m6">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="id" type="text" class="validate">
              <label for="icon_prefix">Primer Nombre</label>
          </div>
          <div class="input-field col s12 m6">
              <input id="icon_prefix" name="id" type="text" class="validate">
              <label for="icon_prefix">Segundo Nombre</label>
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m6">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="id" type="text" class="validate">
              <label for="icon_prefix">Primer Apellido</label>
          </div>
          <div class="input-field col s12 m6">
              <input id="icon_prefix" name="id" type="text" class="validate">
              <label for="icon_prefix">Segundo Apellido</label>
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m6">
              <i class="material-icons prefix">fingerprint</i>
              <input id="icon_prefix" name="id" type="text" class="validate">
              <label for="icon_prefix">Numero Identificación</label>
          </div>
          <div class="input-field col s12 m6">
              <i class="material-icons prefix">cake</i>
              <input id="icon_prefix2" type="date" name="fechanac" class="datepicker">
              <label for="icon_prefix2">Fecha Nacimiento</label>
            </div>
      </div>
      <div class="row">
             <div class="col s12 m3">
              <label>Tipo Telefono</label>
                <select >
                  <option value="" disabled selected>Elija Tipo Telefono</option>
                  <option value= "1">Fijo</option>
                  <option value="2">Celular</option>
                </select>
            </div >
            <div class="input-field col s12 m3">
              <i class="material-icons prefix">phone</i>
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Telefono</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Extension</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Hora Contactar</label>
            </div>
        </div>
<br>

<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>