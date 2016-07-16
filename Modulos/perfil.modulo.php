  <div class="bgd" > <img id="imga" src="img/CrediStart.png">
  <?php
require_once('medoo.php');
require ('config.php');
require_once('funciones.php');
$uid = -1;
$color = "orange";
$icon = "help_outline";

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

$datas = $database->get("solicitudes", [
  "entidad_id",
  "solicitud_id",
  "soliciutd_comentario",
  "estatus_id",
  "subestatus_id",
  "solicitud_fecha_inicio"
], [
  "entidad_id" => $cliente
  
]);

$estatus = $database->get("estatus", [
  "estatus_desripcion"
], [
  "estatus_id" => $datas['estatus_id']
]);


switch ($datas['estatus_id']) {
  case '2':
    $color = "green";
    $icon = "done_all";
    break;
    case '3':
    $color = "red";
    $icon = "highlight_off";
    break;
  default:
    $color = "orange";
    $icon = "help_outline";
    break;
}


?>
<br><br>
<div class="row container">
	<div class="card col m4">
    <div class="card-image waves-effect waves-block waves-light" style=" background-size: cover ;">
     <?php 
    $pdf = false;
      $image ="https://placeholdit.imgix.net/~text?txtsize=28&txt=SIN DOCUMENTO&w=300&h=300";
        if (file_exists(''.$path.$_GET['usr'].'/Identificacion.png')) 
        {
        $image = $path.$_GET['usr'].'/Identificacion.png';
      }
      if (file_exists(''.$path.$_GET['usr'].'/Identificacion.jpg')) 
        {
        $image = $path.$_GET['usr'].'/Identificacion.jpg';
      }
      if (file_exists(''.$path.$_GET['usr'].'/Identificacion.jpeg')) 
        {
        $image = $path.$_GET['usr'].'/Identificacion.jpeg';
      }
      if (file_exists(''.$path.$_GET['usr'].'/Identificacion.pdf')) 
        {
        $image = $path.$_GET['usr'].'/Identificacion.pdf';
        $pdf = true;
      }
      if(!$pdf)
        echo '<img class="activator" " src="'.$image.'">';
      else
        echo '<iframe src="'.$image.'" title="your_title" align="top" height="300" width="400" frameborder="0" scrolling="auto" target="Message"></iframe>
        <a href="'.$image.'" target="_blank">click aqui para ver.</a> ';
    ?>
    </div>
    <div class="card-content">
<br>
      <span class="card-title activator grey-text text-darken-4"><?php echo $entidad[0]["entidad_primer_nombre"].' '.$entidad[0]["entidad_segundo_nombre"].' '.$entidad[0]["entidad_primer_apellido"].' '.$entidad[0]["entidad_segund_apellido"];?><i class="material-icons right">collections</i></span><span></span><br>
      
    </div> <?php if ($datas['subestatus_id'] != 1) { echo '
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
    </div>';
 
echo '<input type="hidden" name="id" value="'.$_GET["usr"].'">';
echo '   
    <input type="hidden" name="tipo" value="Identificacion">
    <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Salvar Imagen</button>
    </form>
    </div>'; } ?>
  </div>
  <?php if(isset($_SESSION['anl']) || $_SESSION['grpid'] == 2){ ?>
	<div class="col m8" style="margin-top: 10px;">

<?php

if ($database->has("usuarios_solicitudes", [
  
    "solicitud_id" => $datas['solicitud_id']
  
]))
{
  $uid = $database->get("usuarios_solicitudes", "usuario_id", [
  "solicitud_id" => $datas['solicitud_id']
]);

  if ($database->has("usuarios_grupos", [ 
    "usuario_id" => $uid
  ]
))
{
  $grupo_id = $database->get("usuarios_grupos", "grupo_id", [
  "usuario_id" => $uid
]);
  
}
else
{
  $grupo_id = 0;
}

$usu = $database->select("usuarios", [
  "usuario_nombre",
  "usuario_apellido",
  "usuario_alias"
],[
  "usuario_id" => $uid
]);


  echo "<blockquote  style='border-left: 5px solid #009688;'>Esta solicitud esta siendo atendida por : ".$usu[0]['usuario_nombre']. " " .$usu[0]['usuario_apellido'].", Alias: ".$usu[0]['usuario_alias'] ."</blockquote>" ;
}
else
{
  ?>
<form id="atsoli" action="atsoli.php" method="post">
<input type="hidden" value="<?php echo $cliente?>" name="entidad_id"></input>
<input type="hidden" value="<?php echo $_SESSION['uid']?>" name="usuario_id"></input>
<input type="hidden" value="<?php echo $datas['estatus_id']?>" name="estatus_id"></input>
<input type="hidden" value="<?php echo $datas['solicitud_id']?>" name="solicitud_id"></input>
  <button type="submit" class="waves-effect waves-light btn-large teal z-depth-1">Atender Solicitud<i class="material-icons right ">cloud</i></button>
  </form>
  <?php 

}

?>



   
    <ul class="collection z-depth-1">

    

    
    <!-- li class="collection-item avatar">
      <i class="material-icons circle teal">stars</i>
      <span class="title"><h5><b>Score</b></h5></span>      
         0
      
      
    </li -->
  
    <?php if ($uid == $_SESSION['uid'] or isset($_SESSION['anl'])){ 
        if ($datas['subestatus_id'] == NULL or isset($_SESSION['anl'])) {         
          
      ?>

<li class="collection-item avatar hover">
      <i class="material-icons circle teal">assignment</i>
      <span class="title"><h5><b>Iniciar Captura de Datos</b></h5></span>      
         Click aqui para verificar documentos
      
      
    </li>


      
    <?php }}
    else {
      echo '
      ';
    } ?>

    
  </ul>

  </div>

</div>
<?php } ?>



<?php if ($estatus["estatus_desripcion"] != "pendiente") {
  echo '<div class="row container">
  <div class="col m8" style="margin-top: 10px;">
      <ul class="collection z-depth-1">
      <li class="collection-item avatar">
      <i class="material-icons circle teal">assignment</i>
      <span class="title"><h5><b>Estado de Solicitud</b></h5>'.$datas["soliciutd_comentario"].'  </span>      
        
      
    </li>
    </ul>
    </div>
    </div>
  ';
} ?>


<div class="row container">
   <div class="input-field col s12 container" >
          <input disabled  id="text" type="text" class="validate" />
          <label for="text">Estado de Solicitud </label><b><?php echo '<p style="color:'.$color.'; font-size:20px;"> '.strtoupper($estatus["estatus_desripcion"]).'</p>'; ?></b>
    </div>
    <form id="rmtsolifrm" action="rmtsoli.php" method="POST">
      <input type="hidden" name="solicitud_id" value="<?php echo $datas['solicitud_id']; ?>" >
    </form>
    <?php 
      if ($estatus["estatus_desripcion"] == "devuelta") {
        echo '<a id="rmtsoli" class="waves-effect waves-light btn"><i class="material-icons left">repeat</i>Remitir Solicitud</a>';
      }
     ?>

</div>

<div class="row container">
	<h3>Documentos</h3>

<div class="row">
	<div class="card  col m4" style="width:400px;">
    <div class="card-image waves-effect waves-block waves-light">
    <?php 
    $pdf = false;
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
      if (file_exists(''.$path.$_GET['usr'].'/Solicitud_fisica.pdf')) 
        {
        $image = $path.$_GET['usr'].'/Solicitud_fisica.pdf';
        $pdf = true;
      }
      if(!$pdf)
        echo '<img class="activator" " src="'.$image.'">';
      else
        echo '<iframe src="'.$image.'" title="your_title" align="top" height="300" width="400" frameborder="0" scrolling="auto" target="Message"></iframe> ';
    ?>

    
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">Solicitud fisica<i class="material-icons right">collections</i></span>
      
    </div>
    <?php if ($datas['subestatus_id'] != 1) { echo '
      
    
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Solicitud fisica<i class="material-icons right">close</i></span>
      <form id="wot" action="imgForm.php" method="post" enctype="multipart/form-data">
    Select imagen para subir:
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input type="file" name="fileToUpload" id="fileToUpload">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
    
'; echo '<input type="hidden" name="id" value="'.$_GET["usr"].'">';  echo '


<input type="hidden" name="tipo" value="Solicitud_fisica">
    <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Salvar Imagen</button>
</form>



    
    
    </div>'; } ?>
  </div>

		<div class="card  push-m2 col m4" style="width:400px;">
    <div class="card-image waves-effect waves-block waves-light">
      <?php 
      $pdf = false;
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
      if (file_exists(''.$path.$_GET['usr'].'/Documentacion_Laboral.pdf')) 
        {
        $image = $path.$_GET['usr'].'/Documentacion_Laboral.pdf';
        $pdf = true;
      }
      if(!$pdf)
        echo '<img class="activator" " src="'.$image.'">';
      else
        echo '<iframe src="'.$image.'" title="your_title" align="top" height="300" width="400" frameborder="0" scrolling="auto" target="Message"></iframe> ';
    ?>
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">Documentacion Laboral<i class="material-icons right">collections</i></span>      
    </div>
    <?php if ($datas['subestatus_id'] != 1) { echo '
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Documentacion Laboral<i class="material-icons right">close</i></span>
      <form id="dl" action="imgForm.php" method="post" enctype="multipart/form-data">
    Select imagen para subir:
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input type="file" name="fileToUpload" id="fileToUpload">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
    
    ';
echo '<input type="hidden" name="id" value="'.$_GET["usr"].'">';

echo '
<input type="hidden" name="tipo" value="Documentacion_Laboral">
    <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Salvar Imagen</button>
</form>
    </div>
  </div> '; }?>

</div>
<div class="row">
	<div class="card   col m4" style="width:400px;">
    <div class="card-image waves-effect waves-block waves-light">
    <?php 
    $pdf = false;
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
  if (file_exists(''.$path.$_GET['usr'].'/Documentacion_Propia.pdf')) 
        {
        $image = $path.$_GET['usr'].'/Documentacion_Propia.pdf';
        $pdf = true;
      }
      if(!$pdf)
        echo '<img class="activator" " src="'.$image.'">';
      else
        echo '<iframe src="'.$image.'" title="your_title" align="top" height="300" width="400" frameborder="0" scrolling="auto" target="Message"></iframe> ';
    ?>

    
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">Documentacion Propia<i class="material-icons right">collections</i></span>      
    </div>
    <?php if ($datas['subestatus_id'] != 1) { echo '
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Documentacion Propia<i class="material-icons right">close</i></span>
      <form id="dp" action="imgForm.php" method="post" enctype="multipart/form-data">
    Select imagen para subir:
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input type="file" name="fileToUpload" id="fileToUpload">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>';
    
    
echo '<input type="hidden" name="id" value="'.$_GET["usr"].'">';

echo '
<input type="hidden" name="tipo" value="Documentacion_Propia">
    <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Salvar Imagen</button>
</form>
    </div>'; }?>
  </div>

		<div class="card push-m2 col m4" style="width:400px;">
    <div class="card-image waves-effect waves-block waves-light">
      <?php 
      $pdf = false;
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
      if (file_exists(''.$path.$_GET['usr'].'/Recibo_Comprobante.pdf')) 
        {
        $image = $path.$_GET['usr'].'/Recibo_Comprobante.pdf';
        $pdf = true;
      }
      if(!$pdf)
        echo '<img class="activator" " src="'.$image.'">';
      else
        echo '<iframe src="'.$image.'" title="your_title" align="top" height="300" width="400" frameborder="0" scrolling="auto" target="Message"></iframe> ';

    ?>
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">Recibo Comprobante<i class="material-icons right">collections</i></span>      
    </div>
    <?php if ($datas['subestatus_id'] != 1) { echo '
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Recibo Comprobante<i class="material-icons right">close</i></span>
      <form id="rc" action="imgForm.php" method="post" enctype="multipart/form-data">
    Select imagen para subir:
    <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input type="file" name="fileToUpload" id="fileToUpload">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>';
    
    
echo '<input type="hidden" name="id" value="'.$_GET["usr"].'">';

echo '
<input type="hidden" name="tipo" value="Recibo_Comprobante">
    <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Salvar Imagen</button>
</form>
    </div> '; }?>
  </div>

  

</div>
</div>
</div bgd>


