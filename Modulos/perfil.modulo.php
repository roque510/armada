  <?php
require_once('medoo.php');
require_once('config.php');
$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);
$path = "clientes/";



?>
<br><br>
<div class="row container">
	<img src="https://placeholdit.imgix.net/~text?txtsize=28&txt=300%C3%97200&w=300&h=200" alt="" class="col m4">
	<div class="col m8"><h3>Armando Roque Barahona</h3></div>

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
      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
      <p><a href="#">This is a link</a></p>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
      <p>Here is some more information about this product that is only revealed once clicked on.</p>
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
      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
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
      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
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
      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
      <p><a href="#">This is a link</a></p>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
      <p>Here is some more information about this product that is only revealed once clicked on.</p>
    </div>
  </div>

</div>