<div class="row container">
  <h3>Reporte Resumen</h3>
</div>

<div class="progress">
      <div class="determinate" style="width: 100%; background-color:#bf360c"></div>
</div>

<?php 
require_once 'funciones.php';
require 'config.php';
require_once 'config.php';
      

 ?>
 <div class="row container">
    <p><b>Datos del Cliente</b></p>
 </div>
  <div class="row container">
    <form id="leform" class="col s12" method="post" action="clientf.php" enctype="multipart/form-data">
      <div class="row">
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">account_circle</i>
            <label for="icon_prefix2" style="color:black;">Nombre del Solicitante</label>
          </div>
          <div class="input-field col s12 m10">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="Primer Nombre, Segundo Nombre, Apellidos" style="border-color:#bf360c; color: gray;">
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m1">
            <i class="material-icons prefix" style="color:#bf360c;">cake</i>
            <label for="icon_prefix2" style="color:black;">Edad</label>
          </div>
          <div class="input-field col s12 m1">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="### años" style="border-color:#bf360c; color:gray;">
          </div>
          <div class="input-field col s12 m1">
            <i class="material-icons prefix" style="color:#bf360c;">supervisor_account</i>
            <label for="icon_prefix2" style="color:black;">Estado Civil</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="Estado" style="border-color:#bf360c; color:gray;">
          </div>
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">work</i>
            <label for="icon_prefix2" style="color:black;">Profesion</label>
          </div>
          <div class="input-field col s12 m5">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="Profesion" style="border-color:#bf360c; color:gray;">
          </div>        
      </div>
        <div class="row">
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">history</i>
            <label for="icon_prefix2" style="color:black;">Antiguedad Laboral</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="##Años ##Meses" style="border-color:#bf360c; color:gray;">
          </div>
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">history</i>
            <label for="icon_prefix2" style="color:black;">Antiguedad Residencia</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="##Años ##Meses" style="border-color:#bf360c; color:gray;">
          </div>
        </div>
    </div>



<div class="row container">
  <div class="progress">
      <div class="determinate" style="width: 100%; background-color:#bf360c"></div>
  </div>
</div>

 <div class="row container">
    <p><b>Datos de Score e Ingresos</b></p>
 </div>
  <div class="row container">
    <form id="leform" class="col s12" method="post" action="clientf.php" enctype="multipart/form-data">
      <div class="row">
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">star_rate</i>
            <label for="icon_prefix2" style="color:black;">Resultado Score</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="###" style="border-color:#bf360c; color: gray;">
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">attach_money</i>
            <label for="icon_prefix2" style="color:black;">Ingresos Reportados</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="###,###.##" style="border-color:#bf360c; color: gray;">
          </div>
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">money_off</i>
            <label for="icon_prefix2" style="color:black;">Ingresos Verificados</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="###,###.##" style="border-color:#bf360c; color: gray;">
          </div>
      </div>
    </div>


<div class="row container">
  <div class="progress">
      <div class="determinate" style="width: 100%; background-color:#bf360c"></div>
  </div>
</div>

<div class="row container">
    <p><b>Datos de Linea de Credito</b></p>
 </div>
  <div class="row container">
    <form id="leform" class="col s12" method="post" action="clientf.php" enctype="multipart/form-data">
      <div class="row">
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">trending_flat</i>
            <label for="icon_prefix2" style="color:black;">Linea Sugerida</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="###,###.##" style="border-color:#bf360c; color: gray;">
          </div>
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">trending_up</i>
            <label for="icon_prefix2" style="color:black;">Linea Solicitada</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="###,###.##" style="border-color:#bf360c; color: gray;">
          </div>
      </div>
      <div class="row">
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">done_all</i>
            <label for="icon_prefix2" style="color:black;">Cuota Maxima</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="###,###.##" style="border-color:#bf360c; color: gray;">
          </div>
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">done</i>
            <label for="icon_prefix2" style="color:black;">Cuota Solicitada</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="###,###.##" style="border-color:#bf360c; color: gray;">
          </div>
          <div class="input-field col s12 m2">
            <i class="material-icons prefix" style="color:#bf360c;">iso</i>
            <label for="icon_prefix2" style="color:black;">Porcentaje de Afectación</label>
          </div>
          <div class="input-field col s12 m2">
            <input readonly id="icon_prefix2" type="text" name="fechanac" class="validate" value="##.##%" style="border-color:#bf360c; color: gray;">
          </div>
      </div>
    </div>    

    <div class="row container">
      <div class="row">
            <a href="javascript: save_score()" class="waves-effect waves-light btn deep-orange darken-3 col s12 m4 right"><i class="material-icons left">verified_user</i>Finalizar Solicitud</a>
      </div>      
    </div>


<script type="text/javascript">
    function save_score(){
        swal({
          title: "Soliciutd Finalizada",
          text: "Se ha finalizado la atencion de la solicitud de credito",
          type: "success",
          showCancelButton: false,
          animation: "slide-from-top",
          confirmButtonColor: "#009688"
        },function(){redriect()});

    }

    function redriect(){

      //hay que cambiar este codigo de redireccion por que lo esta mandando fijo a una solicitud en especifico
      window.location.href = "?pg=perfil&usr=77";
      //window.location.href = "www.google.com"
  }
</script>
    