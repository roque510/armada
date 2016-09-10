<?php
  global $database;
?>
<?php
      $fechaIni = $_GET["fechaIni"];
      $fechaFin = $_GET["fechaFin"];
      echo $fechaIni . '<br>';
      echo $fechaFin . '<br>';
      header('Location: .?pg=rpt_solicitudes&fi='.$fechaIni.'&ff='.$fechaFin);
?>