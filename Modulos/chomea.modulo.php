<ul id="dropdown1" class="dropdown-content">
  <li><a href="#!">one</a></li>
  <li><a href="#!">two</a></li>
  <li class="divider"></li>
  <li><a href="#!">three</a></li>
</ul>
<nav>
    <div class="nav-wrapper deep-orange darken-4">
      <!--<img src="credistart.png" width="3%">-->
      <a href="?pg=home" class="brand-logo" style="margin-left:1%">Credistart</a>      
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a href="?pg=home">Inicio</a></li>
        <li><a href="?pg=cliente2">Cliente Nuevo</a></li>
        <?php 
          if (isset($_SESSION['anl'])) {
            echo '<li><a href="?pg=mant_seguridad">Usuarios</a></li>';        
          }
        ?>
        
        <li><a href="?pg=estado">Estado de Solicitudes</a></li>
        <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Dropdown<i class="material-icons right">arrow_drop_down</i></a></li>
        <li><a class="button" href="cerrar.php" >Cerrar Sesion</a></li>
      </ul>
      <ul class="side-nav" id="mobile-demo">
        <li><a href="?pg=home">Inicio</a></li>
        <li><a href="?pg=cliente2">Cliente Nuevo</a></li>
        <?php 
          if (isset($_SESSION['anl'])) {
            echo '<li><a href="?pg=mant_seguridad">Usuarios</a></li>';        
          }
        ?>
        <li><a href="?pg=estado">Estado de Solicitudes</a></li>
        <li><a class="dropdown-button" data-activates="dropdown1">Dropdown<i class="material-icons right">arrow_drop_down</i></a></li>

        <li><a class="button" href="cerrar.php" >Cerrar Sesion</a></li>
      </ul>
    </div>

  </nav>