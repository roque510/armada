<?php
  global $database;  
?>
<div class="row" style="margin-bottom: 0px;">
  <div class="col s12">    
    <i class="material-icons large left" style="color:#b2dfdb; text-shadow:0.01em 0.01em 0.1em #b2dfdb"> lock</i>
    <h1 class="left" style="font-size:2.5rem; color:teal;">Mantenimiento de Seguridad</h1>            
  </div>
</div>

<!--<div class="row s12 m6" style="width:94%;">-->.
<div class="row s12 " style="margin-bottom:7px;">
	<!--<div class="col push-m9 push-l10 s12">-->
	<!--<div class="col push-s10">-->
	<div class="row s12 m6" style="width: 95%; margin: 0px auto;">
		<a id="btn_new_user" href="?mod=seguridad" class="waves-effect waves-light btn right col s12 m4 l2"><i class="material-icons left ">person_add</i>Nuevo</a>
	</div>
</div>

<div class="row">	
	<div class="row s12 m6 card-panel hoverable" style="width: 95%; margin: 0px auto;">
		<table class="centered striped highlight responsive-table" style="font-size:12px;">
			<thead>
			 	<tr>
				  	<th data-field="id">Editar</th>
				  	<th data-field="id">Eliminar</th>
				  	<th data-field="id">Alias</th>
					<th data-field="name">Nombre</th>
					<th data-field="price">Celular</th>
					<th data-field="price	">Estatus</th>
					<th data-field="price	">Administrador</th>
				</tr>
			</thead>

			<tbody>
				<tr>
				  	<td > <a href="#"><i class="material-icons small center" style="color:gray;">edit</i></a></td>
				  	<td> <a href="#"><i class="material-icons small center" style="color:gray;">delete</i></a></td>
				    <td>damian.nunez</td>
				    <td>DAMIAN ALBERTO NUÑEZ GUZMAN</td>
				    <td>97142097</td>
				    <td>ACTIVO</td>
				    <td style="margin-top:21px;">
				          <input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box" checked="checked" disabled="disabled" />
				          <label for="filled-in-box">Administrador Global</label>
				    </td>
			  	</tr>
			  	<tr>
				    <td > <a href="#"><i class="material-icons small center" style="color:gray;">edit</i></a></td>
				  	<td> <a href="#"><i class="material-icons small center" style="color:gray;">delete</i></a></td>
				    <td>damian.nunez</td>
				    <td>DAMIAN ALBERTO NUÑEZ GUZMAN</td>
				    <td>97142097</td>
				    <td>ACTIVO</td>
				    <td style=" margin-top:21px;">
				          <input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box" disabled="disabled" />
				          <label for="filled-in-box">Administrador Global</label>
				    </td>
			  	</tr>
			  	<tr>
				    <td > <a href="#"><i class="material-icons small center" style="color:gray;">edit</i></a></td>
				  	<td> <a href="#"><i class="material-icons small center" style="color:gray;">delete</i></a></td>
				    <td>damian.nunez</td>
				    <td>DAMIAN ALBERTO NUÑEZ GUZMAN</td>
				    <td>97142097</td>
				    <td>ACTIVO</td>
				    <td style=" margin-top:21px;">
				          <input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box"  disabled="disabled" />
				          <label for="filled-in-box">Administrador Global</label>
				    </td>
			  	</tr>
			  	<tr>
				    <td > <a href="#"><i class="material-icons small center" style="color:gray;">edit</i></a></td>
				  	<td> <a href="#"><i class="material-icons small center" style="color:gray;">delete</i></a></td>
				    <td>damian.nunez</td>
				    <td>DAMIAN ALBERTO NUÑEZ GUZMAN</td>
				    <td>97142097</td>
				    <td>ACTIVO</td>
				    <td style=" margin-top:21px;">
				          <input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box"  disabled="disabled" />
				          <label for="filled-in-box">Administrador Global</label>
				    </td>
			  	</tr>
				<tr>
				    <td > <a href="#"><i class="material-icons small center" style="color:gray;">edit</i></a></td>
				  	<td> <a href="#"><i class="material-icons small center" style="color:gray;">delete</i></a></td>
				    <td>damian.nunez</td>
				    <td>DAMIAN ALBERTO NUÑEZ GUZMAN</td>
				    <td>97142097</td>
				    <td>ACTIVO</td>
				    <td style=" margin-top:21px;">
				          <input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box" disabled="disabled" />
				          <label for="filled-in-box">Administrador Global</label>
				    </td>
				</tr>
				<tr>
				    <td > <a href="#"><i class="material-icons small center" style="color:gray;">edit</i></a></td>
				  	<td> <a href="#"><i class="material-icons small center" style="color:gray;">delete</i></a></td>
				    <td>damian.nunez</td>
				    <td>DAMIAN ALBERTO NUÑEZ GUZMAN</td>
				    <td>97142097</td>
				    <td>ACTIVO</td>
				    <td style=" margin-top:21px;">
				          <input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box" disabled="disabled" />
				          <label for="filled-in-box">Administrador Global</label>
				    </td>
			  	</tr>
			</tbody>
		</table>
		<div class="row s12" style="text-align:right;margin-bottom: -15px;">
			<ul class="pagination">
			    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
			    <li class="active teal"><a href="#!">1</a></li>
			    <li class="waves-effect"><a href="#!">2</a></li>
			    <li class="waves-effect"><a href="#!">3</a></li>
			    <li class="waves-effect"><a href="#!">4</a></li>
			    <li class="waves-effect"><a href="#!">5</a></li>
			    <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
		  	</ul>
		         
		</div>
	</div>	
</div>

    

<style>
	table.highlight > tbody > tr:hover{background-color:#b2dfdb;}
	table.highlight > tbody > tr{transition:background-color 0.25s ease 0s;}
	table.striped > tbody > tr:only-child(2n+1){background-color:red ;}	
	td, th{padding: 7px 5px;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>
	$("#btn_new_user").click(function(){
		alert("nuevo");		

	});
</script>