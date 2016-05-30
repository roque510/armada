
  <ul class="pagination">
    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
    <li class="waves-effect"><a href="?pg=veridoc">Datos del Cliente</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_1">Datos del Domicilio</a></li>
    <li class="active teal"><a href="?pg=veridoc_2">Trabajo</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_3">Propiedades</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_4">Referencias Personales</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_5">Datos de Venta</a></li>
    <li class="waves-effect"><a href="?pg=veridoc_6"><i class="material-icons">chevron_right</i></a></li>
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
        <div class="col s12 m6">
          <label>Estatus del Trabajo</label>
            <select >
              <option value="" disabled selected>Elija el estatus</option>
              <option value= "1">Actual</option>
              <option value="2">Anterior</option>
              <option value="3">Provicional</option>
            </select>
        </div >
        <div class="col s12 m6">
          <label>Tipo de Trabajo</label>
            <select >
              <option value="" disabled selected>Elija el Tipo</option>
              <option value= "1">Principal</option>
              <option value="2">Secundario</option>
              <option value="3">Temporal</option>
            </select>
        </div >        
      </div>
        <div class="row">
            <div class="input-field col s12 m4">
              <i class="material-icons prefix">business</i>
              <input id="icon_prefix2" type="text" name="fechanac" class="validate">
              <label for="icon_prefix2">Empresa</label>
            </div>
            <div class="input-field col s12 m5">
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Nombre Comercial</label>
            </div>
            <div class="input-field col s12 m3">
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">RTN Empresa</label>
            </div>
        </div>
        <div class="row">
            <div class="col s12 m3">
              <label>Cargo del Solicitante</label>
                <select >
                  <option value="" disabled selected>Elija Cargo</option>
                  <option value= "1">Administrador</option>
                  <option value="2">Vendedor</option>
                  <option value="3">Supervisor</option>
                  <option value="4">Jefe de Area</option>
                  <option value="5">Contador</option>
                  <option value="6">Director</option>
                  <option value="7">Otro</option>
                </select>
            </div >
            <div class="input-field col s12 m6" style="margin-top:22px;">
              <i class="material-icons prefix">account_circle</i>
              <input id="icon_prefix" name="snombre" type="text" class="validate">
              <label for="icon_prefix">Nombre del Jefe</label>
            </div>
            <div class="col s12 m3">
              <label>Cargo del Jefe</label>
                <select >
                  <option value="" disabled selected>Elija Cargo</option>
                  <option value= "1">Administrador</option>
                  <option value="2">Vendedor</option>
                  <option value="3">Supervisor</option>
                  <option value="4">Jefe de Area</option>
                  <option value="5">Contador</option>
                  <option value="6">Director</option>
                  <option value="7">Otro</option>
                </select>
            </div >
        </div>
        <div class="row">
            <div class="input-field col s12 m6">
              <i class="material-icons prefix">date_range</i>
              <input id="icon_prefix2" type="date" name="fechanac" class="datepicker">
              <label for="icon_prefix2">Antiguedad de Empleo</label>
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
<br>
<div class="progress">
      <div class="determinate" style="width: 100%"></div>
  </div>
  
      
      <div class="row">
        <div class="col s12 m6">
          <label>Tipo de Contrato</label>
            <select >
              <option value="" disabled selected>Elija el Tipo de Contrato</option>
              <option value="1">Independiente Informal</option>
              <option value="2">Independiente Formal</option>
              <option value="3">Asalariado Privado</option>
              <option value="4">Gobierno</option>
            </select>
        </div >
        <div class="col s12 m6">
          <label>Frecuencia de Pago</label>
            <select >
              <option value="" disabled selected>Elija La Frecuencia de Pago</option>
              <option value="1">Mensual</option>
              <option value="2">Quincenal</option>
              <option value="3">Semanal</option>
              <option value="4">Diario</option>
            </select>
        </div >
      </div>

      <div class="row">
        <div class="col s12 m3" style="margin-top:-7px;">
          <label>Tipo de Moneda</label>
            <select >
              <option value="" disabled selected>Elija Moneda</option>
              <option value="1">Lempira</option>
              <option value="2">Dolares</option>
              <option value="3">Euros</option>
            </select>
        </div >
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">monetization_on</i>
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Ingreso Bruto</label>
        </div>
        <div class="input-field col s12 m3">
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Comisiones y Extras</label>
        </div>
        <div class="input-field col s12 m3">
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Impuestos y Deducciones</label>
        </div>
      </div>  

      <div class="row">
        <div class="input-field right col s12 m3">
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Ingreso Neto</label>
        </div>
        <div class="input-field right col s12 m3">
            <i class="material-icons prefix">attach_money</i>
            <input id="icon_prefix" name="id" type="text" class="validate">
            <label for="icon_prefix">Ingreso Declarado</label>
        </div>        
      </div>

<div class="progress" >
      <div class="determinate" style="width: 100%"></div>
  </div>

      <div class="row">
             <div class="col s12 m4">
              <label>Tipo Telefono</label>
                <select >
                  <option value="" disabled selected>Elija Tipo Telefono</option>
                  <option value= "1">Fijo</option>
                  <option value="2">Celular</option>
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
            <label for="icon_prefix">Dirección de Trabajo</label>
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
            <label for="icon_prefix">Horas para Contactar</label>
          </div>
      </div>