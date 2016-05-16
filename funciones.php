
<?php
/**
 * Created by PhpStorm.
 * User: Armando Roque
 * Date: 20/04/15
 * Time: 11:39
 EXAMPLE
 $datas = $database->select("pais", ["pais_nombre","pais_id"], ["pais_id[>]" => 0]);
         foreach($datas as $data)
          {   
          //echo '<script> alert("'.$data["pais_id"].'"); </script>';          
            echo '<option value="'.$data["pais_id"].'">'.$data["pais_nombre"].'</option>';
          }
 */

          function test_query() {
    $mysqli = new mysqli($SVR, $USR, $PW, $DB);
    $query = "SELECT COUNT(`cia_id`) FROM `cias`";
    $result = $mysqli->query($query);
    $row = $result->fetch_array(0);
    return $row;
}

function redirect($url, $statusCode = 303)
{
   header('Location: ' . $url, true, $statusCode);
   die();
}

function upload($FILE,$target_dir,$nombre){
  $target_file = $target_dir . basename($FILE["name"]);
  $tmp = explode('.', $FILE["name"]);
$file_extension = end($tmp);
  $uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($FILE["tmp_name"]);
    if($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Check if file already exists

// Check file size
if ($FILE["size"] > 500000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
$imageFileType = strtolower($imageFileType);
//echo "<script>alert('".$target_dir."');</script>";
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
    echo "Sorry, only JPG, JPEG, PNG  files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($FILE["tmp_name"], $target_dir.$nombre.".".$file_extension)) {
        echo "The file ". basename( $FILE["name"]). " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
}

function initDB(){
    require_once 'medoo.php';
      require_once 'config.php';
      
        $database = new medoo([
          'database_type' => 'mysql',
          'database_name' => $DB,
          'server' => $SVR,
          'username' => $USR,
          'password' => $PW,
          'charset' => 'utf8'
        ]);
}

function modulo($modulo, $cssclase="",$cssid="")
{
    if($cssclase!=""){
        $cssclase='class="'.$cssclase.'"';
    }

    if($cssid!=""){
        $cssid='id="'.$cssid.'"';
    }
    echo '<div '.$cssclase.' '.$cssid.'>';
    require('Modulos/'.$modulo.".modulo.php");
    echo '</div>';

}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}



?>