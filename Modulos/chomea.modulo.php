<nav>
    <div class="nav-wrapper deep-orange darken-4">
      <a href="?pg=home" class="brand-logo">Credistart</a>
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a href="?pg=home">home</a></li>
        <li><a href="?pg=cliente2">Cliente Nuevo</a></li>
        <?php 
          if (isset($_SESSION['anl'])) {
            echo '<li><a href="?pg=mant_seguridad">Usuario Nuevo</a></li>';        
          }
        ?>
        
        <li><a href="?pg=estado">Estado de Solicitudes</a></li>
        <li><a class="button" href="cerrar.php" >Cerrar Sesion</a></li>
      </ul>
      <ul class="side-nav" id="mobile-demo">
        <li><a href="?pg=home">home</a></li>
        <li><a href="?pg=cliente2">Cliente Nuevo</a></li>
        <?php 
          if (isset($_SESSION['anl'])) {
            echo '<li><a href="?pg=mant_seguridad">Usuario Nuevo</a></li>';        
          }
        ?>
        <li><a href="?pg=estado">Estado de Solicitudes</a></li>
        <li><a class="button" href="cerrar.php" >Cerrar Sesion</a></li>
      </ul>
    </div>

  </nav>