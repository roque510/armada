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
    selectYears: 300, // Creates a dropdown of 15 years to control year
    format: 'yyyy-mm-dd'
  });


        });
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

$('#submitDatos').click(function(){
    
  $.ajax({
            type: 'post',
            url: 'datosL.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData($('#datosL')),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){               
                

                swal({   title: "Exito!",   text: data.comment ,   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   
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
$('#ingreso_declarado').change(function(){
    $resp = parseInt($('#ingreso_declarado').val(),10) + parseInt($('#comision').val(),10) - parseInt($('#impuesto').val(),10); 
    updateInput($resp);
});

$('#cuota_max').change(function(){
    $resp = parseInt($('#cuota_max').val(),10) * parseInt(100,10) / parseInt($('#ingreso_neto').val(),10); 
    updateInputAfec($resp);
});

function updateInput(ish){
    document.getElementById("ingreso_neto").value = ish;
}

function updateInputAfec(ish){
    document.getElementById("porafec").value = Math.trunc(ish) + ' %';
}

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

var parts = window.location.search.substr(1).split("&");
var $_GET = {};
for (var i = 0; i < parts.length; i++) {
    var temp = parts[i].split("=");
    $_GET[decodeURIComponent(temp[0])] = decodeURIComponent(temp[1]);
}

function notify() {

  location.href = "?pg=veridoc&usr="+$_GET.usr;
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

        $('#veridocform').on('submit', function (e) {

          e.preventDefault();


          $.ajax({
            type: 'post',
            url: 'veridocform.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){ 
                swal({   title: "Cargando...",   text: "I will close in 2 seconds.",   timer: 3000,   showConfirmButton: false });
                   location.href = "?pg=veridoc_1&usr="+data.user;
                    
              }
              

            }
          });

        });

        $('#veridocform1').on('submit', function (e) {

          e.preventDefault();


          $.ajax({
            type: 'post',
            url: 'veridocform1.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){ 
                swal({   title: "Cargando...",   text: "I will close in 2 seconds.",   timer: 3000,   showConfirmButton: false });
                   location.href = "?pg=veridoc_2&usr="+data.user;
                    
              }
              

            }
          });

        });

        $('#veridocform2').on('submit', function (e) {

          e.preventDefault();


          $.ajax({
            type: 'post',
            url: 'veridocform2.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){ 
                swal({   title: "Cargando...",   text: "I will close in 2 seconds.",   timer: 3000,   showConfirmButton: false });
                   location.href = "?pg=veridoc_3&usr="+data.user;
                    
              }
              

            }
          });

        });

        $('#veridocform3').on('submit', function (e) {

          e.preventDefault();


          $.ajax({
            type: 'post',
            url: 'veridocform3.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){ 
                swal({   title: "Cargando...",   text: "I will close in 2 seconds.",   timer: 3000,   showConfirmButton: false });
                   location.href = "?pg=veridoc_4&usr="+data.user;
                    
              }
              

            }
          });

        });

        $('#veridocform4').on('submit', function (e) {

          e.preventDefault();


          $.ajax({
            type: 'post',
            url: 'veridocform4.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){ 
                swal({   title: "Cargando...",   text: "I will close in 2 seconds.",   timer: 3000,   showConfirmButton: false });
                   location.href = "?pg=veridoc_5&usr="+data.user;
                    
              }
              

            }
          });

        });

         $('#reporte').on('submit', function (e) {

          e.preventDefault();


          $.ajax({
            type: 'post',
            url: 'reporte.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            success: function (data) {
              if(data.response == "correcto"){ 
                swal({   title: "Mostrar REPORTE FINAL",   text: "Presione ok para continuar",   type: "info",   showCancelButton: true,   closeOnConfirm: false,   showLoaderOnConfirm: true, }, function(){
                   setTimeout(function(){
                        
                        location.href = "?pg=resumen_score&usr="+data.user;   
                 }, 2000); });
                   
                    
              }
              

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