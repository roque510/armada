<?php
$page = null;
$admin = true;

if(isset($_SESSION['anl'])){
  $page = 'page3';
}
if(isset($_POST['page'])){
    $page = $_POST['page'];
}
?>
<div class="row">
  
  <h3 class="col m6 s12">Estado de las ultimas solicitudes</h3>
    <div class="input-field col m3 s10 orderbyselect">
    <form name="myform" action="" method="post">
    <select name="page" onchange="this.form.submit()">
      <i class="material-icons circle green">done_all</i><option value="" disabled selected>Elija una opcion</option>
      <option value="page1" <?php if($page == "page1"){ echo " selected"; }?> class="left circle">Aceptados</option>
      <option value="page2" <?php if($page == "page2"){ echo " selected"; }?> class="left circle">Denegados</option>
      <option value="page3" <?php if($page == "page3"){ echo " selected"; }?> class="left circle">Pendientes</option>
      <option value="page4" <?php if($page == "page4"){ echo " selected"; }?> class="left circle">Todos</option>
    </select>
    <label>Ver por estatus</label>
    </form>
  
  </div>
      
      <?php 
          if (isset($_SESSION['anl'])) {
            echo '<div class="col m3 s2" >
                    <a href="?pg=rpt_solicitudes">
                        <i class="material-icons small right" style="margin-top: 10px;">print</i>
                        <p style="float:right;">Generar Reporte</p>
                    </a>      
                  </div>';        
          }
      ?>

</div>
<?php
require_once('medoo.php');
require_once('config.php');
require_once 'funciones.php';




switch($page){
    case 'page1': modulo('aceptados'); break;
    case 'page2': modulo('denegados'); break;
    case 'page3': modulo('pendientes'); break;
    default: modulo('todos'); break;
}



?>

