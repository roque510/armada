  <!DOCTYPE html>
  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <script>
     
      </script>

      <script src="js/sweetalert-master/dist/sweetalert.min.js"></script>
      <link rel="stylesheet" type="text/css" href="js/sweetalert-master/dist/sweetalert.css">
    </head>

    <body style ="background-color:whitesmoke;">
     <?php 
      require_once ('medoo.php');
      require_once('funciones.php');
      require_once('config.php');

      if (!isset($_GET["mod"])){
        $mod = 'mant_seguridad';
        echo'modulo no definido, redirigiendo...';
        header('Location: ?mod=' . $mod);
      }else{
        modulo($_GET["mod"]);
      }
      // modulo('chome');
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
            $(".button-collapse").sideNav();
             $('select').material_select();
             $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });

        });
      </script>
    </body>
  </html>