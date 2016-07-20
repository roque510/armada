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


      <link rel="stylesheet" type="text/css" href="dist/sweetalert2.css">
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

  <!-- Modal Structure -->
  <div id="modalDevolucion" class="modal small modal-fixed-footer">
    <div class="modal-content">
      <h4>Atencion!</h4>
      <p>Seleccione un motivo de solicitud</p>

      <form action="devofrm">
      <!--select name="respuestas" id="respuestas">
        <option  value="Nivel de endeudamiento">Nivel de endeudamiento</option>
        <option  value="Edad Insuficiente">Edad Insuficiente</option>
        <option  value="Información Falsa">Información Falsa</option>
        <option  value="Ingresos Insuficientes">Ingresos Insuficientes</option>
        <option  value="Referencias Negativas">Referencias Negativas</option>
        <option  value="Mala referencia externa">Mala referencia externa</option>
        <option  value="Lista Negra">Lista Negra</option>
        <option  value="Política de Teléfonos">Condicionado por prima</option>
        <option  value="Mala referencia interna">Mala referencia interna</option>

      </select-->
      <select name="respuestas" id="respuestas">
        <option value="Escaneo de Documentos">Escaneo de Documentos</option>
        <option value="Actualizar comprobantes de identidad">Actualizar comprobantes de identidad</option>
        <option value="actualizar comprobantes de  ingreso">Actualizar comprobantes de  ingreso</option>


      </select>
    </form>

    </div>
    
    <div class="modal-footer">
      <a href="#!"  class="modal-action modal-close waves-effect waves-green btn-flat ">Cerrar</a>
      <a id="dvfrmbtn" class="modal-action modal-close waves-effect waves-green btn-flat ">Devolver</a>
      
    </div>
      
  </div>

    <div id="modalrechazos" class="modal small modal-fixed-footer">
    <div class="modal-content">
      <h4>Atencion!</h4>
      <p>Seleccione un motivo de solicitud</p>

      <form action="rechfrm">
      <select name="respuestasr" id="respuestasr">
        <option  value="Nivel de endeudamiento">Nivel de endeudamiento</option>
        <option  value="Información Falsa">Información Falsa</option>
        <option  value="Referencias Negativas">Referencias Negativas</option>
        <option  value="Lista Negra">Lista Negra</option>
        <option  value="Política de Teléfonos">Condicionado por prima</option>

      </select>
      <!--select name="respuestas" id="respuestas">
        <option value="Escaneo de Documentos">Escaneo de Documentos</option>
        <option value="Actualizar comprobantes de identidad">Actualizar comprobantes de identidad</option>
        <option value="actualizar comprobantes de  ingreso">Actualizar comprobantes de  ingreso</option>


      </select-->
    </form>

    </div>
    
    <div class="modal-footer">
      <a href="#!"  class="modal-action modal-close waves-effect waves-green btn-flat ">Cerrar</a>
      <a id="rechfrmbtn" class="modal-action modal-close waves-effect waves-green btn-flat ">Rechazar</a>
      
    </div>
      
  </div>


    <div id="modal1" class="modal loadingModal z-depth-0 center">
    <div class="modal-content">
            <div class="preloader-wrapper big active">
      <div class="spinner-layer spinner-blue">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-red">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-yellow">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-green">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>
    </div>

    
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
    <script src="dist/sweetalert2.min.js"></script>
<script>
 

    </script>

    <script src="dist/sweetalert.min.js"></script>
    <script src="js/dropzone.js"></script>
    </body>
  </html>