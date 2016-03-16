<h3>Estado de las ultimas solicitudes</h3>
<ul class="collection">
    
    <?php
require_once('medoo.php');
require_once('config.php');
$database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);

    $datas = $database->select("solicitudes", [
  "entidad_id",
  "estatus_id",
  "solicitud_fecha_inicio"
], [
  "solicitud_id[>]" => "DESC"
]);
    
 
 
foreach($datas as $data)
{
$entidad = $database->select("entidades", [
  "entidad_primer_nombre",
  "entidad_segundo_nombre",
  "entidad_segund_apellido",
  "entidad_primer_apellido"
],[
  "entidad_id" => $data['entidad_id']
]);

 



$estatus = $database->select("estatus", [
  "estatus_desripcion"
], [
  "estatus_id" => $data['estatus_id']
]);

switch ($data['estatus_id']) {
  case '2':
    $color = "green";
    $icon = "done_all";
    break;
    case '3':
    $color = "red";
    $icon = "highlight_off";
    break;
  default:
    $color = "orange";
    $icon = "help_outline";
    break;
}

  echo '<a href="?pg=perfil&usr='.$data['entidad_id'].'"><li class="collection-item avatar">
      <i class="material-icons circle '.$color.'">'.$icon.'</i>
      <span class="title"><b>Nombre:</b> '.$entidad[0]["entidad_primer_nombre"].' '.$entidad[0]["entidad_segundo_nombre"].' '.$entidad[0]["entidad_primer_apellido"].' '.$entidad[0]["entidad_segund_apellido"].' </span>
      <p><b>Fecha de solicitud:</b> '.$data["solicitud_fecha_inicio"].'<br>
         <b>Estado de Solicitud:</b> '.$estatus[0]["estatus_desripcion"].'
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li></a>
  ';
}
    ?>
    
    
  </ul>