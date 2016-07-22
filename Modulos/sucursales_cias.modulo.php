<?php
  global $database;  
?>
<?php 
          if (!isset($_SESSION['anl'])) {
           header("Location: index.php?pg=home");
          }
     $get_cia_id = $_GET['cia_id'];

	$datas = $database->select("cias",["cias.cia_id","cias.cia_descripcion","cias.cia_rtn","cias.cia_rubro","cias.cia_direccion","cias.cia_telefono","cias.cia_contacto","cias.estatus_id"],["cias.cia_id" => $get_cia_id]);
	
	foreach($datas as $data){                
		$cia_descripcion = $data["cia_descripcion"];
		$cia_rtn = $data["cia_rtn"];		            		  
		$cia_rubro = $data["cia_rubro"];
		$cia_direccion = $data["cia_direccion"];
		$cia_telefono = $data["cia_telefono"];
		$cia_contacto = $data["cia_contacto"];
  	}   	
?>
<div class="row" style="width: 95%; margin: 0px auto;">	
  <div class="col s12">    
    <i class="material-icons large left" style="color:#b2dfdb; text-shadow:0.01em 0.01em 0.1em #b2dfdb"> location_city</i>
    <h1 class="left" style="font-size:2.5rem; color:teal;">Mantenimiento de Sucursales por Compañia</h1>            
  </div>
</div>

<div class="row" style="width:95%">
	<div class="input-field col s6 m8">
	  <input disabled value="<?php echo $cia_descripcion; ?>" id="disabled" type="text" class="validate" style="color:rgb(191, 54, 12); border-color:orange;">
	  <label for="disabled" class="active" style="color:rgb(221, 44, 0);">Compañia</label>	  
	</div>
	<div class="input-field col s6 m4">
	  <input disabled value="<?php echo $cia_rtn; ?>" id="disabled" type="text" class="validate" style="color:rgb(191, 54, 12); border-color:orange;">
	  <label for="disabled" class="active" style="color:rgb(221, 44, 0);">RTN</label>
	</div>
	<div class="input-field col s6 m6">
	  <input disabled value="<?php echo $cia_contacto; ?>" id="disabled" type="text" class="validate" style="color:rgb(191, 54, 12); border-color:orange;">
	  <label for="disabled" class="active" style="color:rgb(221, 44, 0);">Contacto</label>
	</div>
	<div class="input-field col s6 m3">
	  <input disabled value="<?php echo $cia_telefono; ?>" id="disabled" type="text" class="validate" style="color:rgb(191, 54, 12); border-color:orange;">
	  <label for="disabled" class="active" style="color:rgb(221, 44, 0);">Telefono</label>
	</div>
	<div class="input-field col s12 m3">
	  <input disabled value="<?php echo $cia_rubro; ?>" id="disabled" type="text" class="validate" style="color:rgb(191, 54, 12); border-color:orange;">
	  <label for="disabled" class="active" style="color:rgb(221, 44, 0);">Rubro</label>
	</div>
	<div class="input-field col s12 m12">
	  <input disabled value="<?php echo $cia_direccion; ?>" id="disabled" type="text" class="validate" style="color:rgb(191, 54, 12); border-color:orange;">
	  <label for="disabled" class="active" style="color:rgb(221, 44, 0);"	>Dirección</label>
	</div>
</div>

<div class="row" style="width:90%">
	<div class="progress">
		<div class="determinate" style="width: 100%; background-color:#dd2c00;"></div>
	</div>
</div>

<!--*******************************************************************************************************-->
<form id="add_sucursal_form" action="Modulos/sucursal_insert.php" method="POST">
	<div class="row s12 m6 card-panel hoverable" style="width: 95%; margin: 0px auto;">
		<div class="row" style="width:95%">
			<?php
				echo '<input class="col s12" type="hidden" name="cia_id" value="'.$get_cia_id.'">';
			?>

			<div class="input-field col s12 m6">
				<i class="material-icons prefix">location_city</i>
				<input id="sucursal_descripcion" type="text" class="validate" name="sucursal_descripcion">
				<label for="icon_prefix">Sucursal</label>
				<div id="error_sucursal_descripcion" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;"></div>
			</div>			

			<div class="input-field col s12 m2">
				<select name="pais_id">
					<option value="" disabled selected>Elija un Pais</option>
					<?php
				        $datas = $database->select("pais", ["pais_id","pais_nombre","flag"]);
				         foreach($datas as $data)
				          {  
				          //echo '<script> alert("'.$data["pais_id"].'"); </script>';         
				            echo '<option data-icon="img/'.$data["flag"].'.png" value="'.$data["pais_id"].'" '; if($data["pais_id"] == 999 /*$direcciones[0]['pais_id']*/) { echo "selected";} echo ' >'.$data["pais_nombre"].'</option>';
				          }
				       ?>
				</select>
				<label>Pais</label>
			</div>

			<div class="input-field col s12 m2">
				<select id="dept" name="departamento_id">
					<option value="" disabled selected>Elija un Departamento</option>
					<?php
				        $datas = $database->select("departamentos", ["depto_id","depto_nombre"]);
				         foreach($datas as $data)
				          {  
				          //echo '<script> alert("'.$data["pais_id"].'"); </script>';         
				            echo '<option value="'.$data["depto_id"].'" '; if($data["depto_id"] == 999 /*$direcciones[0]['depto_id']*/) { echo "selected";} echo ' >'.$data["depto_nombre"].	'</option>';
				          }
				       ?>>
				</select>
				<label>Departamento</label>
			</div>	

			<div class="input-field col s12 m2">
				<select id="muni" name="municipio_id">
					<option value="" disabled selected>Elija un Municipio</option>
					<?php
				        $datas = $database->select("municipios", ["municipio_id","municipio_nombre"]);
				        foreach($datas as $data)
				         {  
				          //echo '<script> alert("'.$data["pais_id"].'"); </script>';         
				            echo '<option value="'.$data["municipio_id"].'" '; if($data["municipio_id"] == 999 /*$direcciones[0]['municipio_id']*/) { echo "selected";} echo ' >'.$data["municipio_nombre"].'</option>';
				          }
				       ?>
				</select>
				<label>Municipio</label>
			</div>	
		 </div>

		 <div class="row" style="width:95%">
			<div class="input-field col s12 m3">
				<i class="material-icons prefix">phone</i>
				<input id="sucursal_telefono1" type="text" class="validate" name="sucursal_telefono1">
				<label for="icon_prefix">Telefono #1</label>
				<div id="error_sucursal_telefono1" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;"></div>
			</div>

			<div class="input-field col s12 m3">
				<input id="icon_prefix" type="text" class="validate" name="sucursal_telefono2">
				<label for="icon_prefix">Telefono #2</label>
			</div>

			<div class="input-field col s12 m3">
				<i class="material-icons prefix">account_circle</i>
				<input id="sucursal_encargado" type="text" class="validate" name="sucursal_encargado">
				<label for="icon_prefix">Encargado</label>
				<div id="error_sucursal_encargado" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;"></div>
			</div>

			<div class="input-field col s12 m3">
				<input id="icon_prefix" type="text" class="validate" name="sucursal_abreviatura">
				<label for="icon_prefix">Observaciones</label>
			</div>

			<div class="input-field col s12 m12">
				<i class="material-icons prefix">edit</i>
				<input id="sucursal_direccion" type="text" class="validate" name="sucursal_direccion">
				<label for="icon_prefix">Dirección</label>
				<div id="error_sucursal_direccion" style="text-align:center; margin-top:-10px; color:lightcoral; font-size:12px;"></div>
			</div>
		</div>
		<div class="row s12 m6" style="width: 95%; margin: 0px auto;">
			<a id="btn_submit" class="waves-effect waves-light btn right col s12 m3" style="margin-left:1%;"><i class="material-icons left ">add_circle</i>Adicionar</a>
			<a id="btn_back" class="waves-effect waves-light btn right col s12 m3 push" href="?pg=mant_cias"><i class="material-icons left ">cancel</i>Cancelar</a>
		</div>
	</div>
</form>
<!--***************************************<div class="row s12 m6" style="width:94%;">***************************************->
<div class="row s12 " style="margin-bottom:7px;"-->
	<!--<div class="col push-m9 push-l10 s12">-->
	<!--<div class="col push-s10">-->
</div>

<div class="row" style="margin-top:1%">	
	<div class="row s12 m6 card-panel hoverable" style="width: 95%; margin: 0px auto;">
		<table class="centered striped highlight responsive-table" style="font-size:12px;">
			<thead>
			 	<tr>
				  	<!--<th data-field="id">Editar</th>-->
				  	<th data-field="id">Eliminar</th>				  	
				  	<th data-field="id">Sucursal</th>
					<th data-field="name">Pais</th>
					<th data-field="name">Departamento</th>
					<th data-field="price">Municipio</th>
					<th data-field="price">Dirección</th>
					<th data-field="price">Telefono #1</th>
					<th data-field="price">Telefono #2</th>
					<th data-field="id">Encargado</th>
				</tr>
			</thead>

			<tbody>
				<?php
					$datas = $database->query("SELECT sucursales.sucursal_id, sucursales.cia_id, sucursales.sucursal_descripcion, sucursales.sucursal_direccion, sucursales.sucrsal_telefono1, sucursales.sucrsal_telefono2, sucursales.sucrsal_encargado, sucursales.pais_id, pais.pais_nombre, sucursales.depto_id, departamentos.depto_nombre, sucursales.municipio_id, municipios.municipio_nombre, sucursales.estatus_id FROM sucursales INNER JOIN pais INNER JOIN departamentos INNER JOIN municipios ON pais.pais_id = sucursales.pais_id AND sucursales.municipio_id = municipios.municipio_id AND sucursales.depto_id = departamentos.depto_id WHERE sucursales.cia_id = ".$get_cia_id)->fetchAll();

		            //$datas = $database->select("sucursales",["sucursales.sucursal_id","sucursales.cia_id","sucursales.sucursal_descripcion","sucursal.pais_id","cias.cia_direccion","cias.cia_telefono","cias.cia_contacto","cias.estatus_id"]);
					
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
		            	//echo '<td id="edit_'.$data["cia_id"].'"> <a href="?pg=cia_edit&cia_id='.$data["cia_id"].'"><i class="material-icons small center" style="color:gray;">edit</i></a></td>';
		            	//echo '<td id="btn_delete_user" name="'.$data["usuario_alias"].'"> <a href="?mod=delete_seguridad&usuarioid='	.$data["usuario_alias"].'"><i id="btn_delete" class="material-icons small center" style="color:gray;">delete</i></a></td>';
		            	//echo '<td id="btn_delete_user" name="'.$data["usuario_alias"].'"> <a  onClick="return sweet_alert();" href="?mod=delete_seguridad&usuarioid='.$data["usuario_alias"].'"><i class="material-icons small center" style="color:gray;">delete</i></a></td>';		            	
		            	echo '<td id="btn_delete_user" name="'.$data["sucursal_id"].'"> <a href="javascript: sweet_alert(\''.$data["sucursal_id"].'\',\''.$data["cia_id"].'\')"><i class="material-icons small center" style="color:gray;">delete</i></a></td>';
		            	echo '
		            		  <td>'.$data["sucursal_descripcion"].'</td>
		            		  <td>'.$data["pais_nombre"].'</td>
		            		  <td>'.$data["depto_nombre"].'</td>
		            		  <td>'.$data["municipio_nombre"].'</td>
		            		  <td>'.$data["sucursal_direccion"].' </td>		            		  
		            		  <td>'.$data["sucrsal_telefono1"].'</td>
		            		  <td>'.$data["sucrsal_telefono2"].'</td>
		            		  <td>'.$data["sucrsal_encargado"].'</td>';
		            		
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
	$('#error_sucursal_descripcion').hide();

	var error_sucursal_descripcion = false;

	$("#sucursal_descripcion").focusout(function(){
      check_descripcion();
    });

    function check_descripcion(){
      var descripcion_length = $("#sucursal_descripcion").val().length;

  	if(descripcion_length < 4){
        $("#error_sucursal_descripcion").html("<i>* Favor ingrese una descripción valida</i>");
        $("#error_sucursal_descripcion").show();
        error_sucursal_descripcion = true;
      }else{
        $("#error_sucursal_descripcion").hide();
      }

    }


	 function sweet_alert(sucursal,cia){
	 	//alert(alias);
      //e.preventDefault();
      swal({
		  title: "¿Esta seguro que desea eliminar la Sucursal?",
		  text: "Se eliminara la sucursal seleccionada y todas sus dependencias",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "Eliminar!",
		  closeOnConfirm: false
		},
		function(){ 
		  swal({
          title: "Completado",
          text: "La sucursal y sus dependencias se han eliminado correctamente",
          type: "success",
          confirmButtonColor: "#b3dfdb",
          confirmButtonText: "Ok"}, function(){redriect(sucursal,cia)});		 
	} );
  }

  function redriect(sucursal,cia){
  		//alert(usr);
  		//setTimeout("?mod=delete_seguridad&usuarioid=algo", 3000);
  		//setTimeout("?mod=delete_seguridad&usuarioid=algo");

  		window.location.href = "?mod=sucursal_delete&sucursal_id="+sucursal+"&cia_id="+cia;
  		//window.location.href = "www.google.com"
  }


  $("#btn_submit").on('click',function(e){
      e.preventDefault();
      error_sucursal_descripcion = false;


      check_descripcion();

      if(error_sucursal_descripcion==false){
        swal({
          title: "Completado",
          text: "Se ha registrado la Sucursal",
          type: "success",
          confirmButtonColor: "#b3dfdb",
          confirmButtonText: "Ok"
        },
        function(){
          $("#add_sucursal_form").submit();
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



</script>