<?php
/**
 * Created by PhpStorm.
 * User: Armando Roque
 * Date: 20/04/15
 * Time: 11:39
 */

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