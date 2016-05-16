<?php
  global $database;  
?>
<?php 
          if (!isset($_SESSION['anl'])) {
           header("Location: index.php?pg=home");
          }
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
				<?php
		            $datas = $database->select("usuarios",["usuarios.usuario_alias","usuarios.usuario_nombre","usuarios.usuario_apellido","usuarios.usuario_cel","usuarios.usuario_isadmin","usuarios.estatus_id"]);
		            $i=0;
		            echo '<tr>';
		            foreach($datas as $data){                
		            	if ($data["estatus_id"]==1){
		            		$estatus="ACTIVO";
		            	}elseif ($data["estatus_id"]==2) {
		            		$estatus="INACTIVO";
		            	}elseif ($data["estatus_id"]==3) {
		            		$estatus="BLOQUEADO";
		            	}
		            	echo '<td id="edit_'.$data["usuario_alias"].'"> <a href="#"><i class="material-icons small center" style="color:gray;">edit</i></a></td>';
		            	//echo '<td id="btn_delete_user" name="'.$data["usuario_alias"].'"> <a href="?mod=delete_seguridad&usuarioid='	.$data["usuario_alias"].'"><i id="btn_delete" class="material-icons small center" style="color:gray;">delete</i></a></td>';
		            	//echo '<td id="btn_delete_user" name="'.$data["usuario_alias"].'"> <a  onClick="return sweet_alert();" href="?mod=delete_seguridad&usuarioid='.$data["usuario_alias"].'"><i class="material-icons small center" style="color:gray;">delete</i></a></td>';		            	
		            	echo '<td id="btn_delete_user" name="'.$data["usuario_alias"].'"> <a href="javascript: sweet_alert(\''.$data["usuario_alias"].'\')"><i class="material-icons small center" style="color:gray;">delete</i></a></td>';
		            	echo '
		            		  <td>'.$data["usuario_alias"].'</td>
		            		  <td>'.$data["usuario_nombre"].' '.$data["usuario_apellido"].'</td>		            		  
		            		  <td>'.$data["usuario_cel"].'</td>
		            		  <td>'.$estatus.'</td>';

		            	if ($data["usuario_isadmin"]==1) {
		            		echo'<td style="margin-top:21px;">
						          <input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box" checked="checked" disabled="disabled" />
						          <label for="filled-in-box">Administrador Global</label>
						    </td>';
		            	}else{
		            		echo'<td style="margin-top:21px;">
						          <input type="checkbox" name="usuario_isAdmin" class="filled-in" id="filled-in-box" disabled="disabled" />
						          <label for="filled-in-box">Administrador Global</label>
						    </td>';
		            	}
		            		
		                $i++;
		                echo '</tr>';   
		              }         		            
		          ?>
		          <!--  
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
			  	</tr>-->
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
	
	 function sweet_alert(alias){
	 	//alert(alias);
      //e.preventDefault();
      swal({
		  title: "¿Esta seguro que desea eliminar el usuario?",
		  text: "Se eliminara el usuario seleccionado y todas sus dependencias",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "Eliminar!",
		  closeOnConfirm: false
		},
		function(){ 
		  swal({
          title: "Completado",
          text: "El usuario y sus dependencias se han eliminado correctamente",
          type: "success",
          confirmButtonColor: "#b3dfdb",
          confirmButtonText: "Ok"}, function(){redriect(alias)});		 
	} );
  }

  function redriect(usr){
  		//alert(usr);
  		//setTimeout("?mod=delete_seguridad&usuarioid=algo", 3000);
  		//setTimeout("?mod=delete_seguridad&usuarioid=algo");

  		window.location.href = "?mod=delete_seguridad&usuarioid="+usr;
  		//window.location.href = "www.google.com"
  }

</script>