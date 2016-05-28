<?php
  global $database;  
  
  $var_usuario_alias = $_GET["usr"];
  $datas = $database->select("usuarios", [
  "usuario_alias",
  "usuario_nombre",
  "usuario_apellido",
  "usuario_cel",
  "usuario_telefono",
  "usuario_isadmin",
  "estatus_id"
      ], [
        "usuario_alias" => $var_usuario_alias
      ]);

  foreach($datas as $data)
  {
    $usr_alias = $data["usuario_alias"];
    $usr_nombre = $data["usuario_nombre"];
    $usr_apellido = $data["usuario_apellido"];
    $usr_cel = $data["usuario_cel"];
    $usr_telefono = $data["usuario_telefono"];
    $usr_isadmin = $data["usuario_isadmin"];
    $usr_estatus_id = $data["estatus_id"];
  }
  echo $usr_alias . '<br>' . $usr_nombre. '<br>'. $usr_apellido. '<br>'. $usr_cel. '<br>'. $usr_telefono. '<br>'. $usr_isadmin. '<br>'. $usr_estatus_id. '<br>';
?> 


<div class="row">
  <div class="col s12">    
    <i class="material-icons large left" style="color:#b2dfdb; text-shadow:0.01em 0.01em 0.1em #b2dfdb"> person_add</i>
    <h1 class="left" style="font-size:2.5rem; color:teal;">Registro de Usuarios</h1>            
  </div>
</div>

<form id="add_user_form" action="insert_seguridad.php" method="POST">  
  <div cl-ass="row user_info">

    <!-- Codigos de Colores TEAL
    #e0f2f1 teal lighten-5
    #b2dfdb teal lighten-4
    #80cbc4 teal lighten-3
    #4db6ac teal lighten-2
    #26a69a teal lighten-1 -->    
    <div class="card-panel hoverable" style="width: 95%; margin: 0px auto 20px;">            
      <div class="row" style="margin-bottom:0px">
        <div class="col s12 m4 l3" style="background:rgba(0, 0, 0, 0) url('title.png') repeat scroll 0 0 / 100% auto; color:snow; margin-top:-20px; margin-left:-20px; margin-bottom:10px"><i>Información del usuario</i></div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12">
          <div class="input-field col s12 m6">        
            <i class="material-icons prefix">mode_edit</i>
            <input id="usuario_nombres" name="usuario_nombres" type="text" class="validate" style="text-align:center" value="<?php echo $usr_nombre;  ?>">
            <label class="active" for="icon_prefix">Nombres</label>
            <div id="error_nombres" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;">              
            </div>
          </div>
          <div class="input-field col s12 m6">        
            <input id="usuario_apellidos" name="usuario_apellidos" type="text" class="validate" style='text-align:center' value="<?php echo $usr_apellido;  ?>">
            <label class="active" for="icon_prefix">Apellidos</label>
            <div id="error_apellidos" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;">              
            </div>
          </div>
        </div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12" >
          <div class="input-field col s12 m6">
            <i class="material-icons prefix">account_circle</i>
            <input disabled id="usuario_alias" name="usuario_alias" type="text" class="validate" style='text-align:center' value="<?php echo $usr_alias;  ?>">
            <label class="active" for="icon_prefix">Alias</label>
            <div id="error_alias" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;">              
            </div>
          </div>
          <div class="input-field col s12 m6">
            <input id="usuario_password" name="usuario_password" type="password" class="validate" style='text-align:center' value="**********">
            <label class="active" for="password">Contraseña</label>
            <div id="error_password" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;">              
            </div>
          </div>
        </div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12" >
          <div class="input-field col s12 m6">        
            <i class="material-icons prefix">phone</i>
            <input id="usuario_cell" name="usuario_cell" type="text" class="validate" style='text-align:center' value="<?php echo $usr_cel;  ?>">
            <label class="active" for="icon_prefix">Celular</label>
            <div id="error_cell" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;">              
            </div>
          </div>
          <div class="input-field col s12 m6">        
            <input id="icon_prefix" name="usuario_telefono" type="text" class="validate" style='text-align:center' value="<?php echo $usr_telefono;  ?>">
            <label class="active" for="icon_prefix">Teléfono</label>
          </div>
        </div>
      </div>
      <div class="row container">
        <div class="col s12 m6" style="text-align:center;">
          <div class="input-field col s12" style="margin-left: 10px;">
            <select name="usuario_estatus">
              <?php
                if ($usr_estatus_id == 1) {
                  echo '<option value="" disabled selected>Elija Estatus</option>
                        <option value="1" selected>Activo</option>
                        <option value="2">Inactivo</option>
                        <option value="3">Bloqueado</option>';
                }
                if ($usr_estatus_id == 2) {
                  echo '<option value="" disabled selected>Elija Estatus</option>
                        <option value="1">Activo</option>
                        <option value="2" selected>Inactivo</option>
                        <option value="3">Bloqueado</option>';
                }
                if ($usr_estatus_id == 3) {
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
        <div class="col s12 m6" style="text-align:center; margin-top:21px;">
          <?php
            if ($usr_isadmin == 1) {
              echo '<input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box" checked="check"  />';
            }else{
              echo '<input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box"  />';    
            }
          ?>
          <label for="filled-in-box">Administrador Global</label>
        </div>
      </div>
    </div>
  </div>

  <div class="card-panel hoverable" style="width: 95%; margin: 0px auto;">
    <div class="row" style="margin-bottom:0px">
        <div class="col s12 m4 l3" style="background:rgba(0, 0, 0, 0) url('title.png') repeat scroll 0 0 / 100% auto; color:snow; margin-top:-20px; margin-left:-20px; margin-bottom:10px"><i>Detalle de Accesos</i></div>
    </div>
  <div class="row user_cias" >    
    <div class="row container">
      <div class="input-field col s10">
        <select multiple name="usuario_cia_id[]">
          <option value="" disabled selected>Compañias</option>
          <?php
            $datas = $database->select("cias",["cias.cia_descripcion","cias.cia_id"]);
            $i=0;
            foreach($datas as $data){                
                echo '<option class="cias_id_values" value="'.$data["cia_id"].'">'.$data["cia_descripcion"].'</option>:' ;
                $i++;
              }            
          ?>
        </select>
        <label>Trabjar con Compañías</label>
      </div>
      <!--
      <div class="col s2" style="margin-top:23px;">
        <a id="add_user_cias" class="btn-floating btn-small waves-effect waves-light teal">
          <i class="material-icons">add</i>
        </a>
      </div>
      -->
    </div>
    <!--
    <div id="cias_asignadas" class="row container">
      <ul id="ul_cias_asignadas" class="collection">
        <li value="test" class="collection-item avatar" style="min-height:63px">
          <input type="hidden" name="usuario_cia_id_asignadas[]" value="CIA1">
          <i class="material-icons circle">business</i>
          <span class="title">Empresa #1</span>
          <p>Empresa #1, Ubicada en la colonia X cerca de la tienda Y</p>
          <a href="#!" class="secondary-content"><i class="material-icons">delete</i></a>
        </li>
        <li class="collection-item avatar" style="min-height:63px">
          <input type="hidden" name="usuario_cia_id_asignadas[]" value="CIA2">
          <i class="material-icons circle">business</i>
          <span class="title">Empresa  #2</span>
          <p>Empresa #2, Ubicada en la colonia X cerca de la tienda Y</p>
          <a href="#!" class="secondary-content"><i class="material-icons">delete</i></a>
        </li>
      </ul>
    </div>     
    -->
  </div>

  <div class="row user_groups" >    
    <div class="row container" style="border:solid 1px #e9e9e9">    
      <div class="col s12 m6 grupos" style="border-right:solid 1px #e9e9e9">
        <div style="text-align:center">Grupos</div>
        <div class="divider" style="margin-bottom:10px;"></div>        
          <div id="available_groups" ondrop="dropDisponibles(event)" ondragover="allowDrop(event)" style="min-height:150px">
          <?php
            $datas = $database->select("grupos",["grupos.grupo_nombre", "grupos.grupo_id"]);
            $i=0;
            foreach($datas as $data){                
              echo '<div id="grupos_disponibles_'.$data["grupo_id"].'" name="usuario_grupo_id_'.$data["grupo_id"].'" class="row container" draggable="true" ondragstart="drag(event)" style="margin-bottom:0; margin-left:1px;"> 
                      <div class="chip">
                        '.$data["grupo_nombre"].' ►                        
                      </div>                              
                      <input class="input_grupos_disponibles" type="hidden" name="grupo_id_disponibles[]" value="'.$data["grupo_id"].'">
                    </div>' ;
              $i++;
            }       
          ?>
          </div>
        <div style="margin-bottom:10px"></div>
      </div>
      <div class="col s12 m6 grupos" >
        <div style="text-align:center;">Asignados</div>
        <div class="divider" style="margin-bottom:10px;"></div>
        <div id="asigned_groups" ondrop="dropAsignado(event)" ondragover="allowDrop(event)" style="min-height:150px">
          <!--Cuando se crea un registro nuevo no debe tener grupos asignados-->
        </div>
        <div style="margin-bottom:10px"></div>      
      </div>
    </div>
  </div>
</div>

  <div class="row container user_buttons" style="text-align:right; margin-top:20px">
    <div class="col s12">
      <a id="btn_cancelar" href="?mod=mant_seguridad" class="waves-effect waves-light btn col s12 m4">Cancelar</a>    
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


        function allowDrop(ev) {
            ev.preventDefault();
        }

        function drag(ev) {
            ev.dataTransfer.setData("text", ev.target.id);
        }

        function dropAsignado(ev) {
            ev.preventDefault();
            var data = ev.dataTransfer.getData("text");
            //ev.target.appendChild(document.getElementById(data));            
            document.getElementById("asigned_groups").appendChild(document.getElementById(data));
            var new_id = document.getElementById(data).id.replace("disponibles","asignados");
            document.getElementById(data).id = new_id;
            //alert(document.getElementById(new_id).getElementsByTagName("INPUT")[0].name.replace("disponibles","asignados"));
            var new_input = document.getElementById(new_id).getElementsByTagName("INPUT")[0].name.replace("disponibles","asignados")            
            //alert(new_input);
            document.getElementById(new_id).getElementsByTagName("INPUT")[0].name = new_input;
        }
        function dropDisponibles(ev) {
            ev.preventDefault();
            var data = ev.dataTransfer.getData("text");
            //ev.target.appendChild(document.getElementById(data));
            document.getElementById("available_groups").appendChild(document.getElementById(data));            
            var new_id = document.getElementById(data).id.replace("asignados","disponibles");
            document.getElementById(data).id = new_id;
            // document.getElementById("input_grupos_disponibles").name = "grupo_id_disponibles[]";
            var new_input = document.getElementById(new_id).getElementsByTagName("INPUT")[0].name.replace("asignados","disponibles")            
            //alert(new_input);
            document.getElementById(new_id).getElementsByTagName("INPUT")[0].name = new_input;
        }   

$(document).ready(function() {

    $('#error_nombres').hide();
    $('#error_apellidos').hide();
    $('#error_alias').hide();
    $('#error_password').hide();
    $('#error_cell').hide();
    
    var error_nombres = false;
    var error_apellidos = false;
    var error_alias = false;
    var error_password = false;
    var error_cell = false;
    
    $("#usuario_nombres").focusout(function(){
      check_nombres();
    });

    $("#usuario_apellidos").focusout(function(){
      check_apellidos();
    });

    $("#usuario_alias").focusout(function(){
      check_alias();
    });

    $("#usuario_password").focusout(function(){
      check_password();
    });

    $("#usuario_cell").focusout(function(){
      check_cell();
    });

    function check_nombres(){
      var nombres_length = $("#usuario_nombres").val().length;

      if(nombres_length < 4){
        $("#error_nombres").html("<i>* Favor ingrese un nombre valido</i>");
        $("#error_nombres").show();
        error_nombres = true;
      }else{
        $("#error_nombres").hide();
      }

    }

      function check_apellidos(){
      var apellido_length = $("#usuario_apellidos").val().length;  
      if(apellido_length < 4){
        $("#error_apellidos").html("<i>* Favor ingrese un apellido valido</i>");
        $("#error_apellidos").show();
        error_apellidos = true;
      }else{
        $("#error_apellidos").hide();
      }

    }

      function check_alias(){
      var alias_length = $("#usuario_alias").val().length;

      if(alias_length < 3){
        $("#error_alias").html("<i>* Favor ingrese un alias valido</i>");
        $("#error_alias").show();
        error_alias = true;
      }else{
        $("#error_alias").hide();
      }

    }

      function check_password(){
      var password_length = $("#usuario_password").val().length;

      if(password_length < 5){
        $("#error_password").html("<i>* La contraseña debe contener mas de 5 caracteres</i>");
        $("#error_password").show();
        error_password = true;
      }else{
        $("#error_password").hide();
      }

    }

      function check_cell(){
      var cell_length = $("#usuario_cell").val().length;

      if(cell_length < 6){
        $("#error_cell").html("<i>* Favor ingrese un celular valido</i>");
        $("#error_cell").show();
        error_cell = true;
      }else{
        $("#error_cell").hide();
      }

    }

// Pendiente de verificar primero que lea si el alias ya esta creado en la base de datos //
    $("#btn_submit").on('click',function(e){
      e.preventDefault();
      error_nombres = false;
      error_apellidos = false; 
      error_alias = false;
      error_password = false;
      error_cell = false;

      check_nombres();
      check_apellidos();
      check_alias();
      check_password();
      check_cell();

      if(error_nombres==false && error_apellidos==false && error_password==false && error_alias==false && error_cell==false){
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
          alert("cancelar");   

        });

    $("#add_user_cias").on('click',function(e){
      alert("evento");
      var node = document.createElement("LI");
      node.setAttribute("class","collection-item avatar");
      node.setAttribute("style","min-height:63px");
      alert("nuevo");      

      var text = "<input type='hidden' name='usuario_cia_id_asignadas[]' value='CIA2'><i class='material-icons circle'>business</i><span class='title'>Empresa  #2</span><p>Empresa #2, Ubicada en la colonia X cerca de la tienda Y</p><a href='#!' class='secondary-content'><i class='material-icons'>delete</i></a>";

      node.innerHTML=text;

      document.getElementById("ul_cias_asignadas").appendChild(node);
        /*
        <li class="collection-item avatar" style="min-height:63px">
          <input type="hidden" name="usuario_cia_id_asignadas[]" value="CIA2">
          <i class="material-icons circle">business</i>
          <span class="title">Empresa  #2</span>
          <p>Empresa #2, Ubicada en la colonia X cerca de la tienda Y</p>
          <a href="#!" class="secondary-content"><i class="material-icons">delete</i></a>
        </li>
        */
    });

});

</script>