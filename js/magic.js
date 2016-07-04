        $( document ).ready(function(){

          $.validator.addMethod("valueNotEquals", function(value, element, arg){
        return arg != value;
    }, "");

$("#leform").validate({
        rules: {
            pnombre:"required",
            snombre:"required",
            papellido:"required",
            sapellido:"required",
            monto:"required",
            cuota:"required",
            plazo:"required",
            tipo_id:{valueNotEquals: $('#tipo_id').val('Elija una opcion')},
            id:"required",
            canal_venta:"required",
            tipo_cliente:"required",
          },
        //For custom messages
        messages: {
          
            
        },
        errorElement : 'div',
        errorPlacement: function(error, element) {
          var placement = $(element).data('error');
          if (placement) {
            $(placement).append(error)
          } else {
            error.insertAfter(element);
          }
        }
        
     });


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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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

$('#rmtsolifrm').on('submit', function (e) {

          e.preventDefault();


          $.ajax({
            type: 'post',
            url: 'rmtsoli.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
            success: function (data) {
              if(data.response == "correcto"){               
                

                swal({   title: "Exito!",   text: "Solicitud Remitida." ,   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   
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
$( "#datosL" ).submit();

});

$('#rmtsoli').click(function(){
$( "#rmtsolifrm" ).submit();

});

$('#dvfrmbtn').click(function(){

swal({   title: "Atencion!",   text: "Porfavor Escriba el motivo:",   type: "input",   showCancelButton: true,   closeOnConfirm: false,   animation: "slide-from-top",   inputPlaceholder: "Escriba su razon" }
  , function(inputValue){
     if (inputValue === false) return false;
     if (inputValue === "") {
         swal.showInputError("Debes escribir algo!");
         return false
      }
       $.ajax({
            
            url: 'dvfrm.php',
            type: 'post', // performing a POST request
  data : {
    name : inputValue, // will be accessible in $_POST['data1']
    usr: $('#userVal').val()
  },
  dataType: 'json',
  beforeSend: function() {
    //$('#response').html("<img src='img/loading.gif' />");
    $('#modal1').openModal();
  },                   
  success: function(data)         
  {
                swal({   title: "Exito",   text: '' ,   type: 'success',   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   
                   location.href = "?pg=estado";
                    } 
                    });

            }
          });
    });

 

});
    

    
$('#datosL').on('submit', function (e) {

          e.preventDefault();    
  $.ajax({
            type: 'post',
            url: 'datosL.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
            success: function (data) {
                swal({   title: "Solicitud",   text: data.comment ,   type: data.response,   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   
                   location.href = "?pg=estado";
                    } 
                    });

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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
            success: function (data) {
              if(data.response == "correcto"){               
                

                swal({   title: "Exito!",   text: "El estado de esta persona a sido modificado exitosamente" ,   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   
                   location.reload();
                    } 
                    });
              }
              else {
                swal("Error", data.comment, "error");
                $('#modal1').closeModal();
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
              xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt) {
                  if (evt.lengthComputable) {
                    var percentComplete = evt.loaded / evt.total;
                    percentComplete = parseInt(percentComplete * 100);
                    console.log(percentComplete);
                    if (percentComplete === 100) {
                    }
                  }
                }, false);
                return xhr;
              },
            type: 'post',
            url: 'usrp.php',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            beforeSend: function() {
    //$('#response').html("<img src='img/loading.gif' />");
    $('#modal1').openModal();
  },  
            success: function (data) {
              if(data.response == "correcto"){               
                

                swal({   title: "Exito!",   text: 'Bienvenido, ' + firstToUpperCase(data.user.toLowerCase()) ,   type: "success",   showCancelButton: false,   confirmButtonColor: "#4db6ac",   confirmButtonText: "Continuar",   cancelButtonText: "No, regresar al inicio",   closeOnConfirm: true,   closeOnCancel: true }, function(isConfirm){   if (isConfirm) {
                   
                   location.reload();
                    } 
                    });
              }
              else {
                swal("Cancelled", data.comment, "error");
                 $('#modal1').closeModal();
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
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
            beforeSend: function() {
              $('#modal1').openModal();
            }, 
            success: function (data) {
              if(data.response == "correcto"){ 
                swal({   title: "Cargando...",   text: "-",   timer: 1000,   showConfirmButton: false });
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
            beforeSend: function() {
              $('#modal1').openModal();
            },  
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

         $('#fileToUpload').bind('change', function() {
          var size = this.files[0].size;
          if (size > 1000000) {
            alert("la imagen colocada como Identificacion personal es muy grande... porfavor cambiela.");
          }
          else 
            {
              
            }
        });

        $('#docla').bind('change', function() {
          var size = this.files[0].size;
          if (size > 1000000) {
            alert("la imagen colocada como Identificacion personal es muy grande... porfavor cambiela.");
          }
          else 
            {
              
            }
        });

        $('#docpro').bind('change', function() {
          var size = this.files[0].size;
          if (size > 1000000) {
            alert("la imagen colocada como Identificacion personal es muy grande... porfavor cambiela.");
          }
          else 
            {
              
            }
        });

        $('#recicom').bind('change', function() {
          var size = this.files[0].size;
          if (size > 1000000) {
            alert("la imagen colocada como Identificacion personal es muy grande... porfavor cambiela.");
          }
          else 
            {
              
            }
        });

        $('#solifi').bind('change', function() {
          var size = this.files[0].size;
          if (size > 1000000) {
            alert("la imagen colocada como Identificacion personal es muy grande... porfavor cambiela.");
          }
          else 
            {
              
            }
        });

        

function CalDate(date1,date2) {
    var diff = Math.floor(date1.getTime() - date2.getTime());
    var secs = Math.floor(diff/1000);
    var mins = Math.floor(secs/60);
    var hours = Math.floor(mins/60);
    var days = Math.floor(hours/24);
    var months = Math.floor(days/31);
    var years = Math.floor(months/12);
    months=Math.floor(months%12);
    days = Math.floor(days%31);
    hours = Math.floor(hours%24);
    mins = Math.floor(mins%60);
    secs = Math.floor(secs%60); 
    var message = ""; 
    if(days<=0){
    message += secs + " sec "; 
    message += mins + " min "; 
    message += hours + " hours "; 
    }else{
        message += "Antiguedad: " + days + " dias "; 
        if(months>0 || years>0){
            message += months + " meses ";
        }
        if(years>0){
            message += "y " + years + " años";    
        }
    }
    return message
}


    $('#icon_prefix2').on('change', function(e){
      e.preventDefault();
      var today = new Date();
      var past = $('#icon_prefix2').val();
      var inputval = past.split("-");
 var dateval = new Date(inputval[1]+"/"+inputval[2]+"/"+inputval[0]);

      

      a = CalDate(today,dateval);
$("#Diasanti").html(a);
    });

$("#listanegra").on('click', function(e){
  e.preventDefault();

  if($("#listanegra").hasClass("disabled")){

  }
  else{
  var fd = new FormData();    
  fd.append( 'id', $("#icon_prefixid").attr("value") );
  console.log($("#icon_prefixid").attr("value"));

  swal({   title: "Esta seguro?",   text: "Si agrega el cliente a la lista negra no podra optar por un credito.",
     type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Si, Agregar a la lista negra!",
        cancelButtonText: "No, cancelar porfavor!",
        showLoaderOnConfirm: true,
        closeOnConfirm: false,
        closeOnCancel: false },

          function(isConfirm){
            if (isConfirm) {

              $.ajax({
                
                url: 'addlistaN.php',
                data: fd,
                dataType: "json",
                processData: false,
                contentType: false,
                type: 'POST',               
                success: function (data) {
                  if(data.response == "correcto"){ 
                    swal("Agregado!", "El usuario a sido agregado a la lista negra de credistart.", "success");
                  }
                }
              });
              
            }
            else {
              swal("Cancelado", "Accion cancelada.", "error");
            }
    });
}

});



$('.antemp').on('change', function(e){
      e.preventDefault();
      var today = new Date();
      var past = $('.antemp').val();
      var inputval = past.split("-");
 var dateval = new Date(inputval[1]+"/"+inputval[2]+"/"+inputval[0]);

      

      a = CalDate(today,dateval);
$("#Diasantib").html(a);
    });

   

        $('#leform').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt) {
                  if (evt.lengthComputable) {
                    var percentComplete = evt.loaded / evt.total;
                    percentComplete = parseInt(percentComplete * 100);
                    console.log(percentComplete);
                    if (percentComplete === 100) {
                    }
                  }
                }, false);
                return xhr;
              },
            type: 'post',
            url: $('#leform').attr('action'),
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            beforeSend: function() {
              $('#modal1').openModal();
            },  
            success: function (data) {
              if(data.response == "correcto"){ 
              
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
            else{              
              $('#modal1').closeModal();
            }
          }
          });

        });

             

      });

        $("#listanegra").on("change",function(e){
          if($("#listanegra").hasClass("disabled")){
            $("#listanegra").removeClass("disabled");
          }
          else{

         }
          
        });

        $(document).ready(function(){

          if ($("#id").val() == "") {
            $("#listanegra").addClass("disabled");
          }
          //<div class="col s12"><div id="card-alert" class="card red lighten-5"><div class="card-content red-text"><p>OJO : este usuario se encuentra en la lista negra.</p></div></div> 
          


          function CalDate(date1,date2) {
    var diff = Math.floor(date1.getTime() - date2.getTime());
    var secs = Math.floor(diff/1000);
    var mins = Math.floor(secs/60);
    var hours = Math.floor(mins/60);
    var days = Math.floor(hours/24);
    var months = Math.floor(days/31);
    var years = Math.floor(months/12);
    months=Math.floor(months%12);
    days = Math.floor(days%31);
    hours = Math.floor(hours%24);
    mins = Math.floor(mins%60);
    secs = Math.floor(secs%60); 
    var message = ""; 
    if(days<=0){
    message += secs + " sec "; 
    message += mins + " min "; 
    message += hours + " hours "; 
    }else{
        message += "Antiguedad: " + days + " dias "; 
        if(months>0 || years>0){
            message += months + " meses ";
        }
        if(years>0){
            message += "y " + years + " años";    
        }
    }
    return message
}

    if ($('#icon_prefix2').val() != "0000-00-00") {
     var today = new Date();
      var past = $('#icon_prefix2').val();
      var inputval = past.split("-");
 var dateval = new Date(inputval[1]+"/"+inputval[2]+"/"+inputval[0]);

      

      a = CalDate(today,dateval);
$("#Diasanti").html(a);
    }
    else{
      console.log("no");
    }

        if ($('.antemp').val() != "" && $('.antemp').val() ) {
     var today = new Date();
      var past = $('.antemp').val();
      var inputval = past.split("-");
 var dateval = new Date(inputval[1]+"/"+inputval[2]+"/"+inputval[0]);

      

      a = CalDate(today,dateval);
$("#Diasantib").html(a);
    }
    else{
      console.log("no");
    }
});