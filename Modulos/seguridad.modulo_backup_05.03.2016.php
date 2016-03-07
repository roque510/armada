<div class="row">
  <div class="col s12">
    <h1 style="font-size:2.2rem; text-align:center">Registro de Usuarios</h1>
  </div>
</div>

<div class="row user_info" style="border-style:solid; border-color:blue;">
  <div class="row container" style="border-style:solid; margin-bottom:1px;">
    <div class="col" style="border-style:solid;">
      <i class="material-icons prefix">mode_edit</i>
    </div>    
    <form class="col s12" style="border-style:solid; border-color:red;">
      <div class="input-field col s12 m6">        
        <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
        <label class="active" for="icon_prefix">Nombres</label>
      </div>
      <div class="input-field col s12 m6">        
        <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
        <label class="active" for="icon_prefix">Apellidos</label>
      </div>
    </form>
  </div>
  <div class="row container" style="border-style:solid; margin-bottom:1px;">
    <form class="col s12" style="border-style:solid; border-color:red;">
      <div class="input-field col s12 m6">
        <i class="material-icons prefix">account_circle</i>
        <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
        <label class="active" for="icon_prefix">Alias</label>
      </div>
    </form>
  </div>
  <div class="row container" style="border-style:solid; margin-bottom:1px;">
    <div class="col" style="border-style:solid;">
      <i class="material-icons prefix">phone</i>
    </div>    
    <form class="col s12" style="border-style:solid; border-color:red;">
      <div class="input-field col s12 m6">        
        <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
        <label class="active" for="icon_prefix">Celular</label>
      </div>
      <div class="input-field col s12 m6">        
        <input id="icon_prefix" type="text" class="validate" style='text-align:center'>
        <label class="active" for="icon_prefix">Telefono</label>
      </div>
    </form>
  </div>
  <div class="row container">
    <div class="col s12 m6" style="border-style:solid; text-align:center; margin-top:21px;">
      <input type="checkbox" class="filled-in" id="filled-in-box" checked="checked" />
      <label for="filled-in-box">Administrador Global</label>
    </div>
    <div class="col s12 m6" style="border-style:solid; text-align:center;">
      <div class="input-field col s12">
        <select>
          <option value="" disabled selected>Elija Estatus</option>
          <option value="1">Activo</option>
          <option value="2">Inactivo</option>
          <option value="3">Bloqueado</option>
        </select>
        <label>Estatus</label>
      </div> 
    </div>
  </div>
</div>

<div class="row user_cias" style="border-style:solid; border-color:blue;">
  <div class="row container">
    <div class="input-field col s10" style="border-style:solid;">
      <select multiple>
        <option value="" disabled selected>Choose your option</option>
        <option value="1">Empresa #1</option>
        <option value="2">Empresa #2</option>
        <option value="3">Empresa #3</option>
      </select>
      <label>Trabjar con Compañias</label>
    </div>
    <div class="col s2" style="border-style:solid; margin-top:23px;">
      <a class="btn-floating btn-small waves-effect waves-light teal">
        <i class="material-icons">add</i>
      </a>
    </div>
  </div>
  <div class="row container" style="border-style:solid;">
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

<div class="row user_groups" style="border-style:solid; border-color:blue;">    
  <div class="row container" style="border-style:solid;">    
    <div class="col s12 m6 grupos" style="border-style:solid;">
      <div style="border-style:solid; text-align:center;">Grupos</div>
      <div class="row container" style="border-style:solid; margin-bottom:0; margin-left:1px;">
        <div class="chip">
          Vendedores ►
        </div>        
      </div>
      <div class="row container" style="border-style:solid; margin-bottom:0; margin-left:1px;">
        <div class="chip">
          Supervisores ►
        </div>        
      </div>
    </div>
    <div class="col s12 m6 grupos" style="border-style:solid;">
      <div style="border-style:solid; text-align:center;">Asignados</div>
      <div class="row container" style="border-style:solid; margin-bottom:0; margin-left:1px;">
        <div class="chip">
          Vendedores
          <i class="material-icons">close</i>
        </div>        
      </div>
      <div class="row container" style="border-style:solid; margin-bottom:0; margin-left:1px;">
        <div class="chip">
          Supervisores
          <i class="material-icons">close</i>
        </div>        
      </div>
    </div>
  </div>
</div>

<div class="row container user_buttons" style="border-style:solid; border-color:blue; text-align:right;">
  <div class="col s12">
    <a class="waves-effect waves-light btn">Cancelar</a>
    <a class="waves-effect waves-light btn">Limpiar</a>
    <a class="waves-effect waves-light btn">Guardar</a>
  </div>    
</div>
    