
<nav>

    <?php
      if (isset($_GET['pg'])) {
        $page = $_GET['pg'];
      }else
      {
        $page="home";
      }


      if ($page == "rpt_solicitudes")       
      {
        echo '<div class="nav-wrapper '; if (isset($_SESSION['anl']))echo "deep-orange "; else echo "yellow "; echo'darken-4" style="width:166%;">'; 
      }
      else{
        echo '<div class="nav-wrapper '; if (isset($_SESSION['anl']))echo "deep-orange "; else echo "yellow "; echo'darken-4">'; 
      }

    ?>      
    <!--Comentado por: DN
        Se agrego una condicion antes para extender el menu ya que el reporte a generar ocupa bastante espacio -->
    <!--<div class="nav-wrapper <?php /*if (isset($_SESSION['anl']))echo "deep-orange";else echo "yellow"*/ ?> darken-4">-->
      <!--<img src="credistart.png" width="3%">-->
      <a href="?pg=home" class="brand-logo" style="margin-left:1%">Credistart</a>      
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>

      <ul id="dropdown1" class="dropdown-content right" style="margin-top:4.1%">
          <?php 
          if (isset($_SESSION['anl'])) {
            echo '<li style="background-color:#d84315;"><a style="color:white;" href="?pg=mant_seguridad">Usuarios</a></li>';        
          }
        ?>
          <?php 
          if (isset($_SESSION['anl'])) {
            echo '<li style="background-color:#d84315;"><a style="color:white;" href="?pg=mant_cias">Compañias</a></li>';        
          }
        ?>
          <?php 
          if (isset($_SESSION['anl'])) {
            echo '<li style="background-color:#d84315;"><a style="color:white;" href="?pg=reglas">Reglas</a></li>';        
          }
        ?>
      </ul>
      <ul class="right hide-on-med-and-down">
        <li><a href="?pg=home">Inicio</a></li>
        <li><a href="?pg=cliente2">Nueva Solicitud</a></li>        
        <li><a href="?pg=estado">Estado de Solicitudes</a></li>
        <?php if (isset($_SESSION['anl'])) {
            echo '<li> <a class="dropdown-button" data-activates="dropdown1"> Configuraciones <i class="material-icons right">arrow_drop_down</i> </a> </li>';} ?>
        
        <li><a class="button" href="#" >Central de Riesgo</a></li>
        <li><a class="button" href="cerrar.php" >Cerrar Sesion</a></li>        

      </ul>
      <ul class="side-nav" id="mobile-demo">
        <li><a href="?pg=home">Inicio</a></li>
        <li><a href="?pg=cliente2">Nueva Solicitud</a></li>
            
        <li><a href="?pg=estado">Estado de Solicitudes</a></li>


        <ul class="collapsible" data-collapsible="expandable">
          <li>
          <?php if (isset($_SESSION['anl'])) {
          echo '
            <div style="color:#424242;" class="collapsible-header">Configuraciones<i class="material-icons">arrow_drop_down</i></div>'; } ?>
            <div style="color:black; background-color:#eeeeee;" class="collapsible-body">
                <?php 
                  if (isset($_SESSION['anl'])) {
                    echo '<a style="margin-left:10px;" href="?pg=mant_seguridad">Usuarios</a>';        
                  }
                ?>
            </div>
            <div style="color:black; background-color:#eeeeee;" class="collapsible-body">
                <?php 
                  if (isset($_SESSION['anl'])) {
                    echo '<a style="margin-left:10px;" href="?pg=mant_cias">Compañias</a>';        
                  }
                ?>
            </div>
            <div style="color:black; background-color:#eeeeee;" class="collapsible-body">
                <?php 
                  if (isset($_SESSION['anl'])) {
                    echo '<a style="margin-left:10px;" href="?pg=reglas">Reglas</a>';        
                  }
                ?>
            </div>
          </li>
        </ul>
              
        <li><a class="button" href="#" >Central de Riesgo</a></li>  
        <li><a class="button" href="cerrar.php" >Cerrar Sesion</a></li>
      </ul>
    </div>

  </nav>


