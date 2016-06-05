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
    <li class="waves-effect"><a href="?pg=veridoc_4&usr=<?php echo $usr ?>">Referencias Personales</a></li>
    <li class="active teal"><a href="?pg=veridoc_5&usr=<?php echo $usr ?>">Datos de Venta</a></li>
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
            <div class="input-field col s12 m4">
              <i class="material-icons prefix">account_circle</i>
              <input disabled id="icon_prefix" name="snombre" type="text" class="validate" value="vendedor.generico">
              <label for="icon_prefix">Solicitud Ingresada Por:</label>
            </div>
            <div class="input-field col s12 m4">
              <i class="material-icons prefix">business</i>
              <input disabled id="icon_prefix" name="snombre" type="text" class="validate" value="Nombre de Compañia">
              <label for="icon_prefix">Compañia</label>
            </div>
            <div class="input-field col s12 m4">
              <i class="material-icons prefix">store</i>
              <input disabled id="icon_prefix" name="snombre" type="text" class="validate" value="Sucursal La Ceiba - #2">
              <label for="icon_prefix">Sucursal</label>
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
                    echo '<option value="'.$data["entidad_tipo_id"].'">'.$data["entidad_tipo_descripcion"].'</option>';
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
                    echo '<option value="'.$data["solicitud_canal_id"].'">'.$data["solicitud_canal_descripcion"].'</option>';
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
        <input id="icon_prefix" name="snombre" type="text" class="validate">
        <label for="icon_prefix">Monto Solicitado</label>
      </div>
      <div class="input-field col s12 m4">
        <input id="icon_prefix" name="snombre" type="text" class="validate">
        <label for="icon_prefix">Cuota Solicitada</label>
      </div>
      <div class="input-field col s12 m4">
        <input id="icon_prefix" name="snombre" type="text" class="validate">
        <label for="icon_prefix">Plazo en Meses</label>
      </div>
  </div>

  <div class="row" style="margin-top:65px;">
    <a class="right waves-effect waves-light btn col s12 m3" href="javascript: run_score()"><i class="material-icons left">done</i>Determinar Score</a>
  </div>
   
<script type="text/javascript">
    function sweet_alert(){
        swal({
          title: "Motivo de Devolución",
          text: "Ingresar el motivo detallado del porque se esta devolviendo la solicitud de credito al vendedor en tienda:",
          type: "input",
          input: "textarea",
          showCancelButton: true,
          closeOnConfirm: false,
          animation: "slide-from-top",
          inputPlaceholder: "Motivo",
          confirmButtonColor: "#009688"
        },
        function(inputValue){
          if (inputValue === false) return false;
          
          if (inputValue === "") {
            swal.showInputError("Debe detallar un motivio de devolución!");
            return false
          }
          
          swal({title:"Solicitud Devuelta", 
                text: "Motivo de devolucións: " + inputValue, 
                type: "success"},function(){redriect_solicitud()});
        });      
    }

    function redriect_solicitud(){

      window.location.href = "?pg=estado";
      //window.location.href = "www.google.com"
  }

  function run_score(){
        swal({
          title: "Esta seguro de calcular el Score",
          text: "El Score sera determinado por las diferentes variables y reglas definidas en relación con los datos del la solicitud",
          type: "info",
          showCancelButton: true,
          closeOnConfirm: false,
          showLoaderOnConfirm: true,
          animation: "slide-from-top",
          confirmButtonColor: "#009688"
        },
          function(){
            setTimeout(function(){
              swal({title:"Calculando...", timer: 2000},function(){redriect_resumen()});
            }, 2000);
          });      
    }

    function redriect_resumen(){

      window.location.href = "?pg=resumen_score";
      //window.location.href = "www.google.com"
  }
</script>