<?php
  global $database;  
?>
<?php 
          if (!isset($_SESSION['anl'])) {

           //header("Location: index.php?pg=home");          	
          }

          $fi = $_GET["fi"];
          $ff = $_GET["ff"];

//          echo $fi . '<br>';
//          echo $ff . '<br>';
        ?>
<div class="row" style="margin-bottom: 0px;">
  <div class="col s12">    
    <i class="material-icons large left" style="color:#b2dfdb; text-shadow:0.01em 0.01em 0.1em #b2dfdb"> assignment</i>
    <h1 class="left" style="font-size:2.5rem; color:teal;">Reporte de Solicitudes por Compañia</h1>            
    <br><br><br><br>
    <h5 style="margin-left:2%"> Del: <?php echo $fi; ?> </h5>
    <h5 style="margin-left:2%"> Hasta: <?php echo $ff; ?> </h5>
  </div>
</div>

<!--<div class="row s12 m6" style="width:94%;">-->.
<div class="row s12 " style="margin-bottom:7px;">
	<!--<div class="col push-m9 push-l10 s12">-->
	<!--<div class="col push-s10">-->
	<div class="row s12 m6" style="width: 95%; margin: 0px auto;">
		<!--<a id="btn_export" onClick ="$('#rpt_export').tableExport({type:'excel',escape:'false', tableName:'ExcelExport'});" class="waves-effect waves-light btn left col s12 m4 l2"><i class="material-icons left ">file_download</i>Exportar</a>-->
		<a id="btn_export" onClick ="$('#rpt_export').tableExport({
												    bootstrap: 'false',
												    formats: ['xlsx','txt']
												});" class="waves-effect waves-light btn left col s12 m4 l2"><i class="material-icons left ">file_download</i>Exportar</a>
	</div>
</div>

<div class="row">	
	<div class="row s12 m6 card-panel hoverable" style="width: 166%; margin: 0px auto;">
		<table id="rpt_export" class="centered striped highlight responsive-table" style="font-size:12px;">
			<thead>
			 	<tr>
				  	<th data-field="id">Mes</th>
				  	<th data-field="id">Año</th>				  	
				  	<th data-field="id">Solicitud</th>
					<th data-field="name">Identificación</th>
					<th data-field="name">Nombre</th>
					<th data-field="price">Fecha</th>
					<th data-field="price">Estatus</th>
					<th data-field="price">Usuario Atención</th>
					<th data-field="price">Nombre Usuario</th>
					<th data-field="id">Compañia</th>
					<th data-field="id">Sucursales</th>
					<th data-field="id">Solicitud Monto</th>
					<th data-field="id">Solicitud Cuota</th>
					<th data-field="id">Solicitud Plazo</th>				
					<th data-field="id">Depto</th>
					<th data-field="id">Municipio</th>
					<th data-field="id">Usuario Vendedor</th>
					<th data-field="id">Vendedor Nombre</th>
					<th data-field="id">Edad</th>
					<th data-field="id">Tipo Cliente</th>
					<th data-field="id">Canal Venta</th>
					<th data-field="id">Referencia Crediticia*</th>
					<th data-field="id">Estado Civil</th>
					<th data-field="id">Nivel Educativo</th>
					<th data-field="id">Antiguedad Laboral</th>
					<th data-field="id">Tipo Propiedad</th>
					<th data-field="id">Tipo Contrato</th>
					<th data-field="id">Genero</th>
					<th data-field="id">Ingreso</th>
					<th data-field="id">% Afectación</th>
					<th data-field="id">Bitacora Analista</th>
					<th data-field="id">Comentarios</th>
					<th data-field="id">Monto Sugerido</th>
					<th data-field="id">Cuota Sugerido</th>
					<th data-field="id">Plazo Sugerido</th>
					<th data-field="id">Fecha Inicio</th>
					<th data-field="id">Fecha Final</th>
					<th data-field="id">Duración</th>
					<th data-field="id">Telefono</th>					

				</tr>
			</thead>

			<tbody>
				<?php
		            $datas = $database->query("SELECT MONTH(solicitudes.solicitud_fecha_inicio) as Mes, YEAR(solicitudes.solicitud_fecha_inicio) as Año, 
												solicitudes.solicitud_id as Solicitud_id, replace(trim(identificaciones.identificacion_numero),'-','') as Identificacion, 
										        solicitudes.entidad_id as Entidad_id,
										        CONCAT(entidades.entidad_primer_nombre, ' ', entidades.entidad_segundo_nombre, ' ', 
												       entidades.entidad_primer_apellido, ' ', entidades.entidad_segund_apellido) as Nombre,
										        solicitudes.solicitud_fecha_inicio as solicitud_fecha, 
										        solicitudes.estatus_id as solicitud_id, estatus.estatus_desripcion,
										        clientes.cliente_usuario_modificacion as usr_atencion, CONCAT(usr_atencion .usuario_nombre, ' ', usr_atencion .usuario_apellido) as usr_nomnbre,
										        solicitudes.solicitud_monto, solicitudes.solicitud_cuota, solicitudes.solicitud_plazo, 
										        sucursales.sucursal_descripcion as sucursal_descripcion, cias.cia_descripcion as cia_descripcion,
										        direcciones.depto_id as depto_id, departamentos.depto_nombre as depto_nombre, 
										        direcciones.municipio_id as muni_id, municipios.municipio_nombre as muni_nombre,
										        clientes.cliente_usuario_creacion as vendedor, CONCAT(usuarios.usuario_nombre, ' ', usuarios.usuario_apellido) as vendedor_nombre,
										        YEAR(NOW())-YEAR(entidades.entidad_fecha_nacimiento) as Edad,
										        clientes.cliente_tipo, entidades_tipos.entidad_tipo_descripcion as tipo_cliente,
										        solicitudes.solicitud_canal_id, solicitudes_canales.solicitud_canal_descripcion as canal,
										        entidades.estado_civil_id, estados_civiles.estado_civil_descripcion as estado_civil,
										        clientes.nivel_edu_id, nivel_educativo.nivel_edu_descrip as nivel_educativo_descrip, 
										        empleos.empleo_year as antiguedad_laboral, 
										        propiedades.propiedad_tipo_id, propiedades_tipos.propiedad_tipo_descripcion as propiedad_tipo,
										        empleos.empleo_cargo_id, empleos_tipos.empleo_tipo_descripcion as empleo_tipo_descripcion,
										        entidades.entidad_genero, empleos.empleo_ingreso_neto, (clientes.cliente_cuota_sugerida * 100)/empleos.empleo_ingreso_neto  as Afectacion, 
										        solicitudes.solicitud_comentario_analista coment_analist, solicitudes.soliciutd_comentario as coment_sys, 
										        clientes.cliente_limite_sugerido as monto_sugerido, clientes.cliente_cuota_sugerida as cuota_sugerida,
										        clientes.cliente_plazo as plazo_sugerido, solicitudes.solicitud_fecha_inicio as fecha_ini, 
										        clientes.cliente_fecha_modificacion as fecha_fin,  
										        TIMESTAMPDIFF(MINUTE,solicitudes.solicitud_fecha_inicio,clientes.cliente_fecha_modificacion) as Duracion, 
										        telefonos.telefono_numero as telefono
										FROM solicitudes INNER JOIN entidades ON solicitudes.entidad_id = entidades.entidad_id 
										        INNER JOIN identificaciones ON solicitudes.entidad_id = identificaciones.entidad_id
										        INNER JOIN clientes ON solicitudes.entidad_id = clientes.entidad_id
										        INNER JOIN empleos ON solicitudes.entidad_id = empleos.entidad_id
										        INNER JOIN propiedades ON solicitudes.entidad_id = propiedades.entidad_id
										        INNER JOIN entidades_telefonos ON solicitudes.entidad_id = entidades_telefonos.entidad_id
										        INNER JOIN telefonos ON telefonos.telefono_id = entidades_telefonos.telefono_id
										        INNER JOIN entidades_direcciones ON solicitudes.entidad_id = entidades_direcciones.entidad_id
										        INNER JOIN direcciones ON entidades_direcciones.direccion_id = direcciones.direccion_id
										        INNER JOIN usuarios ON clientes.cliente_usuario_creacion = usuarios.usuario_alias
										        LEFT OUTER JOIN usuarios usr_atencion ON cliente_usuario_modificacion = usr_atencion.usuario_alias
										        INNER JOIN usuarios_sucursales ON usuarios.usuario_id = usuarios_sucursales.usuario_id
										        INNER JOIN sucursales ON usuarios_sucursales.sucursal_id = sucursales.sucursal_id
										        LEFT OUTER JOIN estatus ON solicitudes.estatus_id = estatus.estatus_id
										        LEFT OUTER JOIN cias ON cias.cia_id = sucursales.cia_id
										        LEFT OUTER JOIN  departamentos ON departamentos.depto_id = direcciones.depto_id
										        LEFT OUTER JOIN municipios ON municipios.municipio_id = direcciones.municipio_id
										        LEFT OUTER JOIN  entidades_tipos ON entidades_tipos.entidad_tipo_id = clientes.cliente_tipo
										        LEFT OUTER JOIN solicitudes_canales ON solicitudes_canales.solicitud_canal_id = solicitudes.solicitud_canal_id
										        LEFT OUTER JOIN estados_civiles ON estados_civiles.estado_civil_id = entidades.estado_civil_id
										        LEFT OUTER JOIN nivel_educativo ON nivel_educativo.nivel_edu_id = clientes.nivel_edu_id
										        LEFT OUTER JOIN propiedades_tipos ON propiedades_tipos.propiedad_tipo_id = propiedades.propiedad_tipo_id
												LEFT OUTER JOIN empleos_tipos ON empleos_tipos.empleo_tipo_id = empleos.empleo_cargo_id
										WHERE (solicitudes.solicitud_fecha_inicio >= '".$fi."' AND solicitudes.solicitud_fecha_inicio <= '".$ff."')
");
		            $i=0;
		            echo '<tr>';
		            foreach($datas as $data){                		            	
		            	echo '
		            		  <td>'.$data["Mes"].'</td>
		            		  <td>'.$data["Año"].' </td>		            		  
		            		  <td>'.$data["solicitud_id"].'</td>
		            		  <td>'.$data["Identificacion"].'</td>
		            		  <td>'.$data["Nombre"].'</td>
		            		  <td>'.$data["solicitud_fecha"].'</td>
							  <td>'.$data["estatus_desripcion"].'</td>
							  <td>'.$data["usr_atencion"].'</td>
							  <td>'.$data["usr_nomnbre"].'</td>
							  <td>'.$data["cia_descripcion"].'</td>
							  <td>'.$data["sucursal_descripcion"].'</td>
							  <td>'.$data["solicitud_monto"].'</td>
							  <td>'.$data["solicitud_cuota"].'</td>
							  <td>'.$data["solicitud_plazo"].'</td>
							  <td>'.$data["depto_nombre"].'</td>
							  <td>'.$data["muni_nombre"].'</td>
							  <td>'.$data["vendedor"].'</td>
							  <td>'.$data["vendedor_nombre"].'</td>
							  <td>'.$data["Edad"].'</td>
							  <td>'.$data["tipo_cliente"].'</td>
							  <td>'.$data["canal"].'</td>
							  <td> <td>
							  <td>'.$data["estado_civil"].'</td>
							  <td>'.$data["antiguedad_laboral"].'</td>
							  <td>'.$data["propiedad_tipo"].'</td>
							  <td>'.$data["empleo_tipo_descripcion"].'</td>
							  <td>'.$data["entidad_genero"].'</td>
							  <td>'.$data["empleo_ingreso_neto"].'</td>
							  <td>'.$data["Afectacion"].'</td>
							  <td>'.$data["coment_analist"].'</td>
							  <td>'.$data["coment_sys"].'</td>
							  <td>'.$data["monto_sugerido"].'</td>
							  <td>'.$data["cuota_sugerida"].'</td>
							  <td>'.$data["plazo_sugerido"].'</td>
							  <td>'.$data["fecha_ini"].'</td>
							  <td>'.$data["fecha_fin"].'</td>
							  <td>'.$data["Duracion"].'</td>
							  <td>'.$data["telefono"].'</td>

		            		  ';
		            		
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


</script>