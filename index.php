<?php
session_start();

/*
$_SESSION['usr'] = 'Armando';
$_SESSION['anl'] = 'Armando';
session_unset();
session_destroy();*/





  ?>
  <!DOCTYPE html>
  <html>
    <head>
    <meta charset="UTF-8">
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


      <link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      

    </head>
    <?php
      if ((!isset($_GET["mod"])) and (!isset($_SESSION['usr']))){      

        echo '<body class="bd_clr" style ="background-color:whitesmoke;">';

      }else
      {
        echo '<body class="bd_clr" style ="background-color:whitesmoke;">';
      }
    ?>
    <div id="response"></div>
    <div id="modal1" class="modal loadingModal transparent z-depth-0">
    <div class="modal-content">
      <img style="width:300px; height:300px;" src="img/loading.gif">
      </div>
  </div>
    
     <?php 


      require_once ('medoo.php');
      require_once('funciones.php');
      require_once('config.php');

      if(!isset($_SESSION['usr'])){
        modulo('login');
      }
      else {

        if(isset($_SESSION['grpid'])){
          if ($_SESSION['grpid'] == 2) {
             modulo('chomea');
             if (isset($_GET["mod"])){
                modulo($_GET["mod"]);
              }
          }        
        }


      if(isset($_SESSION['anl'])){
      modulo('chomea');

      if (isset($_GET["mod"])){      
        modulo($_GET["mod"]);
      }
        
      }
      
    else
      if ($_SESSION['grpid'] != 2) {
        modulo('chome');
      }
      

      $page = "home";
      if (isset($_GET['pg'])) {
        $page = $_GET['pg'];
      }

      
        if (file_exists ("Modulos/".$page.".modulo.php")) {
          modulo($page);
        }
        else{
          modulo('error');
        }

      

    }
  
      //modulo('login');
      //modulo('cliente2');
      //modulo('seguridad');
      // modulo('mant_seguridad');
      //modulo('listboxs.js');


    ?>




      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>

      <script type="text/javascript" src="js/magic.js"></script>
      <script type="text/javascript" src="js/jquery.validate.js"></script>
      <script type="text/javascript" src="js/messages_es.js"></script>
    <script src="dist/sweetalert.min.js"></script>
    </body>
  </html>