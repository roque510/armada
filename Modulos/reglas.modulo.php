<?php
  global $database;  
?>


<div class="row">
  <div class="col s12">    
    <i class="material-icons large left" style="color:#b2dfdb; text-shadow:0.01em 0.01em 0.1em #b2dfdb"> build</i>
    <h1 class="left" style="font-size:2.5rem; color:teal;">Configuración de Reglas Globales</h1>            
  </div>  
</div>

<form id="add_user_form" action="modulos/update_reglas.php" method="POST">  
  <div cl-ass="row user_info">

    <!-- Codigos de Colores TEAL
    #e0f2f1 teal lighten-5
    #b2dfdb teal lighten-4
    #80cbc4 teal lighten-3
    #4db6ac teal lighten-2
    #26a69a teal lighten-1 -->    
    <div class="card-panel hoverable" style="width: 95%; margin: 0px auto 20px;">            
      <div class="row" style="margin-bottom:0px">
        <div class="col s12 m4 l3" style="background:rgba(0, 0, 0, 0) url('title.png') repeat scroll 0 0 / 100% auto; color:snow; margin-top:-20px; margin-left:-20px; margin-bottom:10px"><i>Reglas Generales</i></div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12">
          <div class="input-field col s12 m12">        
            <i class="material-icons prefix">perm_contact_calendar</i>
            <?php
               $datas = $database->select("config_reglas", [
                                        "config_regla_descripcion",
                                        "config_regla_valor",
                                        "config_reglas_abreviatura"],["config_regla_descripcion" => "EDAD"]);  

              foreach($datas as $data)
              {
                $regla_descrip = $data["config_regla_descripcion"];
                $regla_valor = $data["config_regla_valor"];
                $config_regla_abreviatura = $data["config_reglas_abreviatura"];
              }
            ?>
            <input id="regla_edad" name="regla_edad" type="number" class="validate" style='text-align:center' value="<?php echo $regla_valor;  ?>">
            <label class="active" for="icon_prefix">Edad (años)</label>
            <div id="error_edad" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;">              
            </div>
          </div>
        </div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12" >
          <div class="input-field col s12 m12">
            <i class="material-icons prefix">date_range</i>
            <?php
               $datas = $database->select("config_reglas", [
                                        "config_regla_descripcion",
                                        "config_regla_valor",
                                        "config_reglas_abreviatura"],["config_regla_descripcion" => "ANTIGUEDAD LABORAL"]);  

              foreach($datas as $data)
              {
                $regla_descrip = $data["config_regla_descripcion"];
                $regla_valor = $data["config_regla_valor"];
                $config_regla_abreviatura = $data["config_reglas_abreviatura"];
              }
            ?>
            <input id="regla_antigudad_laboral" name="regla_antigudad_laboral" type="number" class="validate" style='text-align:center' value="<?php echo $regla_valor;  ?>">
            <label class="active" for="icon_prefix">Antiguedad Laboral (meses)</label>
            <div id="error_antiguedad_laboral" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;">              
            </div>
          </div>
        </div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12" >
          <div class="input-field col s12 m12">        
            <i class="material-icons prefix">style</i>
            <?php
               $datas = $database->select("config_reglas", [
                                        "config_regla_descripcion",
                                        "config_regla_valor",
                                        "config_reglas_abreviatura"],["config_regla_descripcion" => "INGRESO SALARIAL"]);  

              foreach($datas as $data)
              {
                $regla_descrip = $data["config_regla_descripcion"];
                $regla_valor = $data["config_regla_valor"];
                $config_regla_abreviatura = $data["config_reglas_abreviatura"];
              }
            ?>
            <input id="regla_ingreso_salarial" name="regla_ingreso_salarial" type="number" class="validate" style='text-align:center'value="<?php echo $regla_valor;  ?>">
            <label class="active" for="icon_prefix">Ingreso Salarial</label>
            <div id="error_ingreso_salarial" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;">              
            </div>
          </div>
        </div>

      </div>

  <div class="row container user_buttons" style="text-align:right; margin-top:20px;">
    <div class="col s12 m6">
      <a id="btn_cancelar" href="?pg=home" class="waves-effect waves-light btn col s12 m12">Cancelar</a>    
      <!--<a class="waves-effect waves-light btn col s12 m4 push-m2" type="submit">Guardar</a>-->
    </div>
    <div class="col s12 m6">      
      <button id="btn_submit" class="btn waves-effect waves-light col s12 m12" type="submit" >Submit
        <i class="material-icons right">send</i>
      </button>
    </div>     
  </div>
</form>    

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>

$(document).ready(function() {

    $('#error_edad').hide();
    $('#error_antiguedad_laboral').hide();
    $('#error_ingreso_salarial').hide();
    
    var error_edad = false;
    var error_antiguedad_laboral = false;
    var error_ingreso_salarial = false;
    
    $("#regla_edad").focusout(function(){
      check_edad();
    });

    $("#regla_antigudad_laboral").focusout(function(){
      check_antiguedad_laboral();
    });

    $("#regla_ingreso_salarial").focusout(function(){
      check_ingreso_salarial();
    });

    
    function check_edad(){
      var edad = $("#regla_edad").val().length;
      var edad_val=  $("#regla_edad").val();

      if(edad == 0 || edad_val == 0){
        $("#error_edad").html("<i>* Favor ingrese una edad</i>");
        $("#error_edad").show();
        error_edad = true;
      }else{
        $("#error_edad").hide();
      }

    }

      function check_antiguedad_laboral(){
      var antiguedad_laboral = $("#regla_antigudad_laboral").val().length;  
      var antiguedad_laboral_val = $("#regla_antigudad_laboral").val(); 

      if(antiguedad_laboral == 0 || antiguedad_laboral_val == 0){
        $("#error_antiguedad_laboral").html("<i>* Favor ingrese una antiguedad laboral</i>");
        $("#error_antiguedad_laboral").show();
        error_antiguedad_laboral = true;
      }else{
        $("#error_antiguedad_laboral").hide();
      }

    }

      function check_ingreso_salarial(){
      var ingreso_salarial = $("#regla_ingreso_salarial").val().length;
      var ingreso_salarial_val = $("#regla_ingreso_salarial").val();

      if(ingreso_salarial == 0 || ingreso_salarial_val == 0){
        $("#error_ingreso_salarial").html("<i>* Favor ingrese un salario</i>");
        $("#error_ingreso_salarial").show();
        error_ingreso_salarial = true;
      }else{
        $("#error_ingreso_salarial").hide();
      }

    }


// Pendiente de verificar primero que lea si el alias ya esta creado en la base de datos //
    $("#btn_submit").on('click',function(e){
      e.preventDefault();
      error_edad = false;
      error_antiguedad_laboral = false; 
      error_ingreso_salarial = false;

      check_edad();
      check_antiguedad_laboral();
      check_ingreso_salarial();

      if(error_edad==false && error_antiguedad_laboral==false && error_ingreso_salarial==false){
        swal({
          title: "Completado",
          text: "Se ha registrado el usuario correctamente",
          type: "success",
          confirmButtonColor: "#b3dfdb",
          confirmButtonText: "Ok"
        },
        function(){
          $("#add_user_form").submit();
        });
        return true;        
      }else{
        //sweetAlert("Faltan campos", "Favor ingresar los campos restantes (*)!", "error","#b3dfdb");
        swal({
          title: "Faltan Campos",
          text: "Favor ingresar los campos restantes (*)!",
          type: "error",
          confirmButtonColor: "#b3dfdb",
          confirmButtonText: "Cancelar"
        });
        return false;
      }

    });

    $("#btn_cancelar").click(function(){
     //     alert("cancelar");   

        });

});

</script>