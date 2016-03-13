  <!DOCTYPE html>
  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
      
    </head>

    <body>
     <?php 
      require_once 'funciones.php';
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
        
      

      
      //modulo('login');
      
      //modulo('analista');


    ?>




      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript">
        $( document ).ready(function(){
            $(".button-collapse").sideNav();
             $('select').material_select();
             $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });

        });
      </script>
      <script>
      $(function () {

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
              
              swal({   title: "Exito!",   text: "Deseas ingresar a otro cleinte?",   type: "success",   showCancelButton: true,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Si, Porfavor",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: false,   closeOnCancel: false }, function(isConfirm){   if (isConfirm) {
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
    </body>
  </html>