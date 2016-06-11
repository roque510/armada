<?php
  global $database;
  $data = $database->select("cias","cias.cia_id",["cia_id"=>"DIUN"]);
  echo $data[0];
?>
<div class="row">
  <div class="col s12">    
    <i class="material-icons large left" style="color:#b2dfdb; text-shadow:0.01em 0.01em 0.1em #b2dfdb"> person_add</i>
    <h1 class="left" style="font-size:2.5rem; color:teal;">Registro de Usuarios</h1>            
  </div>
</div>

<form >  
  <div cl-ass="row user_info">

    <!-- Codigos de Colores TEAL
    #e0f2f1 teal lighten-5
    #b2dfdb teal lighten-4
    #80cbc4 teal lighten-3
    #4db6ac teal lighten-2
    #26a69a teal lighten-1 -->    
    <!--<div class="col s6" style="width: 95%; margin: 0px auto; background-color:#26A69A; color:snow"><i>Información del Usuario</i></div>-->
    <div class="card-panel hoverable" style="width: 95%; margin: 0px auto 20px;">            
      <div class="row" style="margin-bottom:0px">
        <div class="col s12 m4 l3" style="background:rgba(0, 0, 0, 0) url('title.png') repeat scroll 0 0 / 100% auto; color:snow; margin-top:-20px; margin-left:-20px; margin-bottom:10px"><i>Información del usuario</i></div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12">
          <div class="input-field col s12 m6">        
            <i class="material-icons prefix">mode_edit</i>
            <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
            <label class="active" for="icon_prefix">Nombres</label>
          </div>
          <div class="input-field col s12 m6">        
            <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
            <label class="active" for="icon_prefix">Apellidos</label>
          </div>
        </div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12" >
          <div class="input-field col s12 m6">
            <i class="material-icons prefix">account_circle</i>
            <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
            <label class="active" for="icon_prefix">Alias</label>
          </div>
          <div class="input-field col s12 m6">
            <input id="password" type="password" class="validate" style='text-align:center'>
            <label class="active" for="password">Contraseña</label>
          </div>
        </div>
      </div>
      <div class="row container" style="margin-bottom:1px;">
        <div class="col s12" >
          <div class="input-field col s12 m6">        
            <i class="material-icons prefix">phone</i>
            <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
            <label class="active" for="icon_prefix">Celular</label>
          </div>
          <div class="input-field col s12 m6">        
            <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
            <label class="active" for="icon_prefix">Teléfono</label>
          </div>
        </div>
      </div>
      <div class="row container">
        <div class="col s12 m6" style="text-align:center;">
          <div class="input-field col s12" style="margin-left: 10px;">
            <select>
              <option value="" disabled selected>Elija Estatus</option>
              <option value="1">Activo</option>
              <option value="2">Inactivo</option>
              <option value="3">Bloqueado</option>
            </select>
            <label>Estatus</label>
          </div> 
        </div>
        <div class="col s12 m6" style="text-align:center; margin-top:21px;">
          <input type="checkbox" class="filled-in" id="filled-in-box" checked="checked" />
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
        <select multiple>
          <option value="" disabled selected>Compañias</option>
          <option value="1">Empresa #1</option>
          <option value="2">Empresa #2</option>
          <option value="3">Empresa #3</option>
        </select>
        <label>Trabjar con Compañías</label>
      </div>
      <div class="col s2" style="margin-top:23px;">
        <a class="btn-floating btn-small waves-effect waves-light teal">
          <i class="material-icons">add</i>
        </a>
      </div>
    </div>
    <div class="row container">
      <ul class="collection">
        <li class="collection-item avatar" style="min-height:63px">
          <i class="material-icons circle">business</i>
          <span class="title">Empresa #1</span>
          <p>Empresa #1, Ubicada en la colonia X cerca de la tienda Y</p>
          <a href="#!" class="secondary-content"><i class="material-icons">delete</i></a>
        </li>
        <li class="collection-item avatar" style="min-height:63px">
          <i class="material-icons circle">business</i>
          <span class="title">Empresa  #2</span>
          <p>Empresa #2, Ubicada en la colonia X cerca de la tienda Y</p>
          <a href="#!" class="secondary-content"><i class="material-icons">delete</i></a>
        </li>
      </ul>
    </div>     
  </div>

  <div class="row user_groups" >    
    <div class="row container" style="border:solid 1px #e9e9e9">    
      <div class="col s12 m6 grupos" style="border-right:solid 1px #e9e9e9">
        <div style="text-align:center">Grupos</div>
        <div class="divider" style="margin-bottom:10px;"></div>
        <div class="row container" style="margin-bottom:0; margin-left:1px;">
          <div class="chip">
            Vendedores ►
          </div>        
        </div>
        <div class="row container" style="margin-bottom:0; margin-left:1px;">
          <div class="chip">
            Supervisores ►
          </div>        
        </div>
        <div style="margin-bottom:10px"></div>
      </div>
      <div class="col s12 m6 grupos" >
        <div style="text-align:center;">Asignados</div>
        <div class="divider" style="margin-bottom:10px;"></div>
        <div class="row container" style="margin-bottom:0; margin-left:1px;">
          <div class="chip">
            Test
            <i class="material-icons">close</i>
          </div>        
        </div>
        <div class="row container" style="margin-bottom:0; margin-left:1px;">
          <div class="chip">
            Supervisores
            <i class="material-icons">close</i>
          </div>        
        </div>
        <div style="margin-bottom:10px"></div>
      </div>
    </div>
  </div>
</div>

  <div class="row container user_buttons" style="text-align:right; margin-top:20px">
    <div class="col s12">
      <a class="waves-effect waves-light btn col s12 m4">Cancelar</a>    
      <a class="waves-effect waves-light btn col s12 m2 push-m1">Limpiar</a>    
      <a class="waves-effect waves-light btn col s12 m4 push-m2">Guardar</a>
    </div>    
  </div>
</form>    