<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>New Document</title>
        <style type="text/css">
        </style>        
    </head>
    <body>
        <form name="f1">
            <select name="select1" id="s1" style="float:left">
                <option value="1">Select List 1 - Value1</option>
                <option value="2">Select List 1 - Value2</option>
                <option value="3">Select List 1 - Value3</option>
                <option value="4">Select List 1 - Value4</option>
                <option value="5">Select List 1 - Value5</option>
            </select>
            <select name="select2" id="s2" style="float:left">
                <option value="11">Select List 2 - Value1</option>
                <option value="22">Select List 2 - Value2</option>
                <option value="33">Select List 2 - Value3</option>
                <option value="44">Select List 2 - Value4</option>
                <option value="55">Select List 2 - Value5</option>
            </select>
            <div style="clear: both;">
            </div>
            <input type="button" name="s1Add" value="Add" /><input type="button" name="s1Remove" value="Remove" /><input type="button" name="s2Add" value="Add" style="margin-left: 25px;"/><input type="button" name="s2Remove" value="Remove" />
        </form>
        <script type="text/javascript">
        	//Select list 1's Add button's onclick event handling.
			//This will remove the currently selected item from the select 2 and put the same in select 1
            document.forms['f1'].elements['s1Add'].onclick = function(){
                var s2 = document.forms['f1'].elements['s2'];
                var s1 = document.forms['f1'].elements['s1'];
                
                var si = s2.selectedIndex;
                var s2val = s2.options[si].value;
                var s2txt = s2.options[si].text;
                
                s1.options[s1.options.length] = new Option(s2txt, s2val, false, true);
                s2.remove(si);
            }
            //Select list 2's Add button's onclick event handling
			//This will remove the currently selected item from the select 1 and put the same in select 2
            document.forms['f1'].elements['s2Add'].onclick = function(){
                var s2 = document.forms['f1'].elements['s2'];
                var s1 = document.forms['f1'].elements['s1'];
                
                var si = s1.selectedIndex;
                var s1val = s1.options[si].value;
                var s1txt = s1.options[si].text;
                
                s2.options[s2.options.length] = new Option(s1txt, s1val, false, true);
                s1.remove(si);
            }
            //Select list 1's remove button's onclick event handling
			//This will remove the currently selected item from select list 1
            document.forms['f1'].elements['s1Remove'].onclick = function(){
                var s1 = document.forms['f1'].elements['s1'];
                s1.remove(s1.selectedIndex);
            }
            //Select list 2's Add button's onclick event handling
			//This will remove the currently selected item from select list 2
            document.forms['f1'].elements['s2Remove'].onclick = function(){
                var s2 = document.forms['f1'].elements['s2'];
                s2.remove(s2.selectedIndex);
            }
        </script>
    </body>
</html>


<!--

//list box javascript

 

 /*
	//Global Var
	//2D Array -> 1 for inserts, 2 for delete
	var Changes = [[],[]];	
	function LoadModulos(id)
	{
		$('#ModulosDisponibles tbody').html("");
		$('#ModulosAsignados tbody').html("");
		CleanChanges();
		
		if(!$("#Modulos").find('.TabLoader').length);
			$("#Modulos").append(HTMLLoader);
		
		var IDImage = (id ? id : -1);	
		var IDSlider = $('#cbSlider').val();
		
		if(ajax_request) ajax_request.abort();
		
		ajax_request = $.ajax({
			url:"modulos/modadminslider/serviceadminslider.php?accion=8",
			method: "POST",
			data: {IDImage:IDImage,IDSlider:IDSlider}
		}).done(function(data){
			if(data != "1" && data != "")
			{
				
				var datos = data.split(";"),
					tbody = $('#ModulosDisponibles tbody'),
					modulos = datos[0].split(","); // Modulos disponibles
					
				$.each(modulos, function(i, modulo){
					var tr = $('<tr>'),
						a = $('<a>');
					tr.attr("id", "mod_"+modulo);
					tr.attr("class", "modaldata");
					tr.attr("style", "display:none");
					a.attr("href","javascript:agregarmod('"+modulo+"')");
					a.html(modulo);
					$('<td>').html(a).appendTo(tr);
					tbody.append(tr);
				});
				
				if(datos[1].length > 0)
				{
					var datos = data.split(";"),
						tbody = $('#ModulosAsignados tbody'),
						modulos = datos[1].split(","); // Modulos disponibles
					$.each(modulos, function(i, modulo){		
						var tr = $('<tr>'),
							a = $('<a>');
						tr.attr("id", "mod_"+modulo);
						tr.attr("class", "modaldata");
						tr.attr("style", "display:none");
						a.attr("href","javascript:quitarmod('"+modulo+"')");
						a.html(modulo);
						$('<td>').html(a).appendTo(tr);
						tbody.append(tr);
					});
				}
				
				$("#Modulos").find('.TabLoader').remove();
				$(".modaldata").fadeIn();
				$('.modal-content').scrollTop(1);
			}
			else
			{
				sweetAlert("Error", "Error al obtener modulos del perfil. ::"+data, "error");
			}
		});		
	}
		
    function agregarmod(idmodulo){
        var tr=$("#mod_"+idmodulo),
            tbody = $('#ModulosAsignados tbody');
        
		//Checks if it's already marked for deletion
		if(!CheckForChanges(idmodulo,1,true))
		{
			Changes[0].push(idmodulo);
		}
		
        tr.fadeOut("fast",function(){
            $(this).remove();
            tbody.append($(this));
            $("a", this).attr("href","javascript:quitarmod('"+idmodulo+"')");
            $(this).fadeIn("fast");
            
        });
        
    }
	    
    function quitarmod(idmodulo){
        var tr=$("#mod_"+idmodulo),
            tbody = $('#ModulosDisponibles tbody');
			
		if(!CheckForChanges(idmodulo,0,true))
		{
			Changes[1].push(idmodulo);
		}			
        
        tr.fadeOut("fast",function(){
            $(this).remove();
            tbody.append($(this));
            $("a", this).attr("href","javascript:agregarmod('"+idmodulo+"')");
            $(this).fadeIn("fast");            
        });
        
    }
	
	//Event = 0 for Inserts, 1 for Delete
	function CheckForChanges(id,event,bDeleteFound)
	{
		for (var j = 0; Changes[event] && j < Changes[event].length; j++) {
			if(Changes[event][j] == id)
			{
				if(bDeleteFound)
					Changes[event].splice(j,1);
					
				return true;
			}
		}
		
		return false;
	}
	
	function CleanChanges()
	{
		for(var i = 0; i < Changes.length; i++)
			Changes[i].length = 0;
	}

*/	-->