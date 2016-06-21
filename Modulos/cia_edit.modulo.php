<?php
  global $database;  
  
  $cia_id = $_GET["cia_id"];
  $datas = $database->select("cias", [
  "cia_descripcion",
  "cia_abreviatura",
  "cia_rtn",
  "cia_rubro",
  "cia_direccion",
  "cia_telefono",
  "cia_telefono1",
  "cia_contacto",
  "cia_generico1",
  "cia_generico2",
  "estatus_id"
      ], [
        "cia_id" => $cia_id
      ]);

  foreach($datas as $data)
  {
    $cia_descripcion = $data["cia_descripcion"];
    $cia_abreviatura = $data["cia_abreviatura"];
    $cia_rtn = $data["cia_rtn"];
    $cia_rubro = $data["cia_rubro"];
    $cia_direccion = $data["cia_direccion"];
    $cia_telefono = $data["cia_telefono"];
    $cia_telefono1 = $data["cia_telefono1"];
    $cia_contacto = $data["cia_contacto"];
    $cia_generico1 = $data["cia_generico1"];
    $cia_generico2 = $data["cia_generico2"];
    $cia_estatus_id = $data["estatus_id"];
  }
  //echo $usr_id.'<br>'.$usr_alias . '<br>' . $usr_nombre. '<br>'. $usr_apellido. '<br>'. $usr_cel. '<br>'. $usr_telefono. '<br>'. $usr_isadmin. '<br>'. $usr_estatus_id. '<br>';
?> 


<div class="row">
  <div class="col s12">     
    <i class="material-icons large left" style="color:#ffccbc; text-shadow:0.01em 0.01em 0.1em #ffccbc"> border_color</i>
    <h1 class="left" style="font-size:2.5rem; color:#ff7043;">Actualización de Compañias</h1>            
  </div>
</div>

<form id="add_cia_form" action="Modulos/update_cia.php" method="POST">  
  <div cl-ass="row user_info">

    <!-- Codigos de Colores TEAL
    #e0f2f1 teal lighten-5
    #b2dfdb teal lighten-4
    #80cbc4 teal lighten-3
    #4db6ac teal lighten-2
    #26a69a teal lighten-1 -->    
    <div class="card-panel hoverable" style="width: 95%; margin: 0px auto 20px;">            
      <div class="row" style="margin-bottom:0px">
        <div class="col s12 m4 l3" style="background:rgba(0, 0, 0, 0) url('title.png') repeat scroll 0 0 / 100% auto; color:snow; margin-top:-20px; margin-left:-20px; margin-bottom:10px"><i>Información de Compañia</i></div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12">
          <div class="input-field col s12 m8">        
            <i class="material-icons prefix">business </i>
            <input id="cia_descripcion" name="cia_descripcion" type="text" class="validate" style='text-align:center' value="<?php echo $cia_descripcion;?>">
            <input id="cia_id" name="cia_id" type="hidden" class="validate" style='text-align:center' value="<?php echo $cia_id;?>">
            <label class="active" for="icon_prefix">Compañía</label>
            <div id="error_cia_descripcion" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;"></div>
          </div>
          <div class="input-field col s12 m4  ">        
            <input id="cia_abreviatura" name="cia_abreviatura" type="text" class="validate" style='text-align:center' value="<?php echo $cia_abreviatura;?>">
            <label class="active" for="icon_prefix">Abreviatura</label>
          </div>
        </div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12" >
          <div class="input-field col s12 m6">
            <i class="material-icons prefix">mode_edit</i>
            <input id="cia_rtn" name="cia_rtn" type="text" class="validate" style='text-align:center' value="<?php echo $cia_rtn;?>">
            <label class="active" for="icon_prefix">RTN</label>            
          </div>
          <div class="input-field col s12 m6">
            <input id="cia_rubro" name="cia_rubro" type="text" class="validate" style='text-align:center' value="<?php echo $cia_rubro;?>">
            <label class="active" for="icon_prefix">Rubro</label>
          </div>
        </div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12" >
          <div class="input-field col s12 m6">        
            <i class="material-icons prefix">phone</i>
            <input id="cia_telefono" name="cia_telefono" type="text" class="validate" style='text-align:center' value="<?php echo $cia_telefono;?>">
            <label class="active" for="icon_prefix">Teléfono #1</label>
            <div id="error_cia_telefono" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;"></div>
          </div>
          <div class="input-field col s12 m6">        
            <input id="icon_prefix" name="cia_telefono1" type="text" class="validate" style='text-align:center' value="<?php echo $cia_telefono1;?>">
            <label class="active" for="icon_prefix">Teléfono #2</label>
          </div>
        </div>
      </div>
      <div class="row container">
          <div class="col s12 m12" style="text-align:center;">          
            <div class="input-field col s12" >
              <i class="material-icons prefix">add_location </i>
              <input id="cia_direccion" name="cia_direccion" type="text" class="validate" style='text-align:center'value="<?php echo $cia_direccion;?>">
              <label class="active" for="icon_prefix">Dirección</label>
              <div id="error_cia_direccion" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;"></div> 
            </div>
          </div>
          <div class="col s12 m6" style="text-align:center;">          
            <div class="input-field col s12" >
              <i class="material-icons prefix">account_circle</i>
              <input id="cia_contacto" name="cia_contacto" type="text" class="validate" style='text-align:center' value="<?php echo $cia_contacto;?>">
              <label class="active" for="icon_prefix">Contacto</label>
              <div id="error_cia_contacto" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;"> </div> 
            </div>
          </div>
            <div class="col s12 m6" style="text-align:center;">          
              <div class="input-field col s12" >
                <i class="material-icons prefix">edit </i>
                <input id="icon_prefix" name="cia_generico1" type="text" class="validate" style='text-align:center' value="<?php echo $cia_generico1;?>">
                <label class="active" for="icon_prefix">Adicional #1</label>
              </div> 
            </div>
            <div class="col s12 m12" style="text-align:center;">          
              <div class="input-field col s12" >
                <input id="icon_prefix" name="cia_generico2" type="text" class="validate" style='text-align:center' value="<?php echo $cia_generico2;?>">
                <label class="active" for="icon_prefix">Adicional #2</label>
              </div> 
            </div>  

            <div class="col s12 m6" style="text-align:center;">
            <div class="input-field col s12" style="margin-left: 10px;">
              <select name="cia_estatus_id">
                <?php
                  if ($cia_estatus_id == 1) {
                    echo '<option value="" disabled selected>Elija Estatus</option>
                          <option value="1" selected>Activo</option>
                          <option value="2">Inactivo</option>
                          <option value="3">Bloqueado</option>';
                  }
                  if ($cia_estatus_id == 2) {
                    echo '<option value="" disabled selected>Elija Estatus</option>
                          <option value="1">Activo</option>
                          <option value="2" selected>Inactivo</option>
                          <option value="3">Bloqueado</option>';
                  }
                  if ($cia_estatus_id == 3) {
                    echo '<option value="" disabled selected>Elija Estatus</option>
                          <option value="1">Activo</option>
                          <option value="2">Inactivo</option>
                          <option value="3" selected>Bloqueado</option>';
                  }          
                ?>
              </select>
              <label>Estatus</label>
            </div> 
          </div>      
          
      </div>
    </div>
  </div>
  
  <div class="row container user_buttons" style="text-align:right; margin-top:20px">
    <div class="col s12">
      <a id="btn_cancelar" href="?mod=mant_cias" class="waves-effect waves-light btn col s12 m4">Cancelar</a>    
      <a class="waves-effect waves-light btn col s12 m2 push-m1">Limpiar</a>    
      <!--<a class="waves-effect waves-light btn col s12 m4 push-m2" type="submit">Guardar</a>-->
      <button id="btn_submit" class="btn waves-effect waves-light col s12 m4 push-m2" type="submit">Submit
        <i class="material-icons right">send</i>
      </button>
    </div>    
  </div>
</form>    

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>   

$(document).ready(function() {

    $('#error_cia_descripcion').hide();
    $('#error_cia_telefono').hide();
    $('#error_cia_direccion').hide();
    $('#error_cia_contacto').hide();
    
    var error_cia_descripcion = false;
    var error_cia_telefono = false;
    var error_cia_direccion = false;
    var error_cia_contacto = false;
    
    $("#cia_descripcion").focusout(function(){
      check_descripcion();
    });

    $("#cia_telefono").focusout(function(){
      check_telefono();
    });

    $("#cia_direccion").focusout(function(){
      check_direccion();
    });

    $("#cia_contacto").focusout(function(){
      check_contacto();
    });

    function check_descripcion(){
      var descripcion_length = $("#cia_descripcion").val().length;

      if(descripcion_length < 4){
        $("#error_cia_descripcion").html("<i>* Favor ingrese una descripción valida</i>");
        $("#error_cia_descripcion").show();
        error_cia_descripcion = true;
      }else{
        $("#error_cia_descripcion").hide();
      }

    }

      function check_telefono(){
      var telefono_length = $("#cia_telefono").val().length;  
      if(telefono_length < 4){
        $("#error_cia_telefono").html("<i>* Favor ingrese un número valido</i>");
        $("#error_cia_telefono").show();
        error_cia_telefono = true;
      }else{
        $("#error_cia_telefono").hide();
      }

    }

      function check_direccion(){
      var direccion_length = $("#cia_direccion").val().length;

      if(direccion_length < 3){
        $("#error_cia_direccion").html("<i>* Favor ingrese una dirección mas especifica</i>");
        $("#error_cia_direccion").show();
        error_cia_direccion = true;
      }else{
        $("#error_cia_direccion").hide();
      }

    }

      function check_contacto(){
      var contacto_length = $("#cia_contacto").val().length;

      if(contacto_length < 5){
        $("#error_cia_contacto").html("<i>* Favor ingrese un contacto valido</i>");
        $("#error_cia_contacto").show();
        error_cia_contacto = true;
      }else{
        $("#error_cia_contacto").hide();
      }

    }


// Pendiente de verificar primero que lea si el alias ya esta creado en la base de datos //
    $("#btn_submit").on('click',function(e){
      e.preventDefault();
      error_cia_descripcion = false;
      error_cia_telefono = false; 
      error_cia_direccion = false;
      error_cia_contacto= false;

      check_descripcion();
      check_telefono();
      check_direccion();
      check_contacto();

      if(error_cia_descripcion==false && error_cia_telefono==false && error_cia_direccion==false && error_cia_contacto==false){
        swal({
          title: "Completado",
          text: "Se ha registrado la compañia",
          type: "success",
          confirmButtonColor: "#b3dfdb",
          confirmButtonText: "Ok"
        },
        function(){
          $("#add_cia_form").submit();
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
          // alert("cancelar");   

        });

});

</script>