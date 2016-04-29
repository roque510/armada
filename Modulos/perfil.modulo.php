  <?php
require_once('medoo.php');
require ('config.php');
require_once('funciones.php');

if (!isset($_SESSION['usr'])) {
  redirect('?pg=error');
}

$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);
$path = "clientes/";
$cliente = "0";
if (isset($_GET['usr'])) {
	$cliente = $_GET['usr'];
	# code...
}

$entidad = $database->select("entidades", [
  "entidad_primer_nombre",
  "entidad_segundo_nombre",
  "entidad_segund_apellido",
  "entidad_primer_apellido"
],[
  "entidad_id" => $cliente
]);


?>
<br><br>
<div class="row container">
	<div class="card col m4">
    <div class="card-image waves-effect waves-block waves-light" style=" background-size: cover ;">
     <?php 
    	$image ="https://placeholdit.imgix.net/~text?txtsize=28&txt=SIN DOCUMENTO&w=300&h=300";
        if (file_exists(''.$path.$_GET['usr'].'/identificacion.png')) 
        {
    		$image = $path.$_GET['usr'].'/identificacion.png';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/identificacion.jpg')) 
        {
    		$image = $path.$_GET['usr'].'/identificacion.jpg';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/identificacion.jpeg')) 
        {
    		$image = $path.$_GET['usr'].'/identificacion.jpeg';
    	}

  echo '<img class="activator" src="'.$image.'">';
    ?>
    </div>
    <div class="card-content">
<br>
      <span class="card-title activator grey-text text-darken-4"><?php echo $entidad[0]["entidad_primer_nombre"].' '.$entidad[0]["entidad_segundo_nombre"].' '.$entidad[0]["entidad_primer_apellido"].' '.$entidad[0]["entidad_segund_apellido"];?><i class="material-icons right">collections</i></span><span></span><br>
      
    </div>
    <div class="card-reveal">
    <br><br>
      <span class="card-title grey-text text-darken-4">Identificacion Personal.<i class="material-icons right">close</i></span>
      <form id="imgForm" action="imgForm.php" method="post">
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input name="fileToUpload" id="fileToUpload" type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>

<?php 
echo '<input type="hidden" name="id" value="'.$_GET["usr"].'">';

?>
    
    <input type="hidden" name="tipo" value="Identificacion">
    <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Salvar Imagen</button>
    </form>
    </div>
  </div>
	<div class="col m8"><h3></h3></div>

</div>
<!--div class="row container">
	<div class="input-field col s12">
          <input id="email" type="email" class="validate">
          <label for="email">Email</label>
    </div>
    <!--div class="col s6">
    	<label for="bd">Fecha de Nacimiento</label>
    	<input id="bd" type="date" class="datepicker">
    	
    </div-->


</div-->
<div class="row container">
	<!--div class="input-field col s6">
          <input id="text" type="text" class="validate">
          <label for="text">RTN</label>
    </div-->
   <div class="input-field col s12">
          <input disabled  id="text" type="text" class="validate">
          <label for="text">Estado de Solicitud</label>
    </div>

</div>

<div class="row container">
	<h3>Documentos</h3>
</div>
<div class="row container">
	<div class="card  col m5">
    <div class="card-image waves-effect waves-block waves-light">
    <?php 
    	$image ="https://placeholdit.imgix.net/~text?txtsize=28&txt=SIN DOCUMENTO&w=300&h=300";
        if (file_exists(''.$path.$_GET['usr'].'/Solicitud_fisica.png')) 
        {
    		$image = $path.$_GET['usr'].'/Solicitud_fisica.png';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/Solicitud_fisica.jpg')) 
        {
    		$image = $path.$_GET['usr'].'/Solicitud_fisica.jpg';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/Solicitud_fisica.jpeg')) 
        {
    		$image = $path.$_GET['usr'].'/Solicitud_fisica.jpeg';
    	}
  echo '<img class="activator" src="'.$image.'">';
    ?>

    
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">Solicitud fisica<i class="material-icons right">collections</i></span>
      
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
      <form id="wot" action="imgForm.php" method="post" enctype="multipart/form-data">
    Select image to upload:
    <input type="file" name="fileToUpload" id="fileToUpload">
    <?php 
echo '<input type="hidden" name="id" value="'.$_GET["usr"].'">';

?>
<input type="hidden" name="tipo" value="Solicitud_fisica">
    <input type="submit" value="Upload Image" name="submit">
</form>



    
    
    </div>
  </div>

		<div class="card push-m2 col m5">
    <div class="card-image waves-effect waves-block waves-light">
      <?php 
    	$image ="https://placeholdit.imgix.net/~text?txtsize=28&txt=SIN DOCUMENTO&w=300&h=300";
        if (file_exists(''.$path.$_GET['usr'].'/Documentacion_Laboral.png')) 
        {
    		$image = $path.$_GET['usr'].'/Documentacion_Laboral.png';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/Documentacion_Laboral.jpg')) 
        {
    		$image = $path.$_GET['usr'].'/Documentacion_Laboral.jpg';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/Documentacion_Laboral.jpeg')) 
        {
    		$image = $path.$_GET['usr'].'/Documentacion_Laboral.jpeg';
    	}

  echo '<img class="activator" src="'.$image.'">';
    ?>
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">collections</i></span>
      <p><a href="#">This is a link</a></p>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
      <p>Here is some more information about this product that is only revealed once clicked on.</p>
    </div>
  </div>

</div>

<div class="row container">
	<div class="card  col m5">
    <div class="card-image waves-effect waves-block waves-light">
    <?php 
    	$image ="https://placeholdit.imgix.net/~text?txtsize=28&txt=SIN DOCUMENTO&w=300&h=300";
        if (file_exists(''.$path.$_GET['usr'].'/Documentacion_Propia.png')) 
        {
    		$image = $path.$_GET['usr'].'/Documentacion_Propia.png';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/Documentacion_Propia.jpg')) 
        {
    		$image = $path.$_GET['usr'].'/Documentacion_Propia.jpg';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/Documentacion_Propia.jpeg')) 
        {
    		$image = $path.$_GET['usr'].'/Documentacion_Propia.jpeg';
    	}
  echo '<img class="activator" src="'.$image.'">';
    ?>

    
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">collections</i></span>
      <p><a href="#">This is a link</a></p>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
      <p>Here is some more information about this product that is only revealed once clicked on.</p>
    </div>
  </div>

		<div class="card push-m2  col m5">
    <div class="card-image waves-effect waves-block waves-light">
      <?php 
    	$image ="https://placeholdit.imgix.net/~text?txtsize=28&txt=SIN DOCUMENTO&w=300&h=300";
        if (file_exists(''.$path.$_GET['usr'].'/Recibo_Comprobante.png')) 
        {
    		$image = $path.$_GET['usr'].'/Recibo_Comprobante.png';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/Recibo_Comprobante.jpg')) 
        {
    		$image = $path.$_GET['usr'].'/Recibo_Comprobante.jpg';
    	}
    	if (file_exists(''.$path.$_GET['usr'].'/Recibo_Comprobante.jpeg')) 
        {
    		$image = $path.$_GET['usr'].'/Recibo_Comprobante.jpeg';
    	}
  echo '<img class="activator" " src="'.$image.'">';
    ?>
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">collections</i></span>
      <p><a href="#">This is a link</a></p>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
      <p>Here is some more information about this product that is only revealed once clicked on.</p>
    </div>
  </div>

  

</div>