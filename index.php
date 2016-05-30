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
      <!--<link rel="stylesheet" type="text/css" href="dist/sweetalert2.css">-->
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
    
     <?php 


      require_once ('medoo.php');
      require_once('funciones.php');
      require_once('config.php');

      if(!isset($_SESSION['usr'])){
        modulo('login');
      }
      else {


      if(isset($_SESSION['anl'])){
      modulo('chomea');

      if (isset($_GET["mod"])){      
        modulo($_GET["mod"]);
      }
        
      }
      
    else
      modulo('chome');

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
      <script type="text/javascript">
        $( document ).ready(function(){
var idleInterval = setInterval(timerIncrement, 60000); // 1 minute

    //Zero the idle timer on mouse movement.
    $(this).mousemove(function (e) {
        idleTime = 0;
    });
    $(this).keypress(function (e) {
        idleTime = 0;
    });

    function timerIncrement() {
    idleTime = idleTime + 1;
    
    if (idleTime > 9) { // 10 minutes
        window.location.assign("cerrar.php");
    }
}



            $(".button-collapse").sideNav();
             $('select').material_select();
             $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 90 // Creates a dropdown of 15 years to control year
  });

        });
      </script>
      <script>
      $(function () {




function firstToUpperCase( str ) {
    return str.substr(0, 1).toUpperCase() + str.substr(1);
}

$('#atsoli').on('submit', function (e) {

          e.preventDefault();


          $.ajax({
            type: 'post',
            url: 'atsoli.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){               
                

                swal({   title: "Exito!",   text: "Haz tomado esta solicitud con exito." ,   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   
                   location.reload();
                    } 
                    });
              }
              else {
                swal("Error", data.comment, "error");
              }


              


            }
          });

        });

$('#estado').on('submit', function (e) {

          e.preventDefault();


          $.ajax({
            type: 'post',
            url: 'estado.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){               
                

                swal({   title: "Exito!",   text: "El estado de esta persona a sido modificado exitosamente" ,   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   
                   location.reload();
                    } 
                    });
              }
              else {
                swal("Error", data.comment, "error");
              }


              


            }
          });

        });


function notify() {
  location.href = "?pg=veridoc";
}
$( ".hover" ).on( "click", notify );

$('#login').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            type: 'post',
            url: 'usrp.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){               
                

                swal({   title: "Exito!",   text: 'Bienvenido, ' + firstToUpperCase(data.user.toLowerCase()) ,   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   
                   location.reload();
                    } 
                    });
              }
              else {
                swal("Cancelled", data.comment, "error");
              }


              


            }
          });

        });

$('#dl').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            type: 'post',
            url: 'imgForm.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            success: function (response) {
              


              swal({   title: "Exito!",   text: "Documento ingresado exitosamente!",   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   location.reload();
                    } 
                    });


            }
          });

        });

$('#dp').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            type: 'post',
            url: 'imgForm.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            success: function (response) {
              


              swal({   title: "Exito!",   text: "Documento ingresado exitosamente!",   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   location.reload();
                    } 
                    });


            }
          });

        });

$('#rc').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            type: 'post',
            url: 'imgForm.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            success: function (response) {
              


              swal({   title: "Exito!",   text: "Documento ingresado exitosamente!",   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   location.reload();
                    } 
                    });


            }
          });

        });


        $('#wot').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            type: 'post',
            url: 'imgForm.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            success: function (response) {
              


              swal({   title: "Exito!",   text: "Documento ingresado exitosamente!",   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   location.reload();
                    } 
                    });


            }
          });

        });

        $('#imgForm').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            type: 'post',
            url: 'imgForm.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            success: function (response) {
              


              swal({   title: "Exito!",   text: "Documento ingresado exitosamente!",   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   location.reload();
                    } 
                    });


            }
          });

        });

        $('#leform').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            type: 'post',
            url: $('#leform').attr('action'),
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            success: function (response) {
              
              swal({   title: "Exito!",   text: "Deseas ingresar a otro cliente?",   type: "success",   showCancelButton: true,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Si, Porfavor",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: false,   closeOnCancel: false }, function(isConfirm){   if (isConfirm) {
                   var url = window.location.href;
                    if (url.indexOf('?') > -1){
                      url += '&pg=cliente2';}
                      else{
                        url += '?pg=cliente2';
                      }
window.location.href = url; } 
                   else {
                        
                        var url = window.location.href;
                    if (url.indexOf('?') > -1){
                      url += '&pg=home';}
                      else{
                        url += '?pg=home';
                      }
window.location.href = url;

                          } });



            }
          });

        });

      });
    </script>
    <script src="dist/sweetalert.min.js"></script>   
    <!--<script src="dist/sweetalert2.min.js"></script>-->
    </body>
  </html>