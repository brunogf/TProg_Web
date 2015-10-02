$(document).ready(function(){
$(document.getElementById("form-busqueda")).on("keyup", "#criterio", function() {  
    $.get("AjaxRequest",{criterio : $("#criterio").val()} ,function(responseJson) {  
                var arr =[];
                $.each(responseJson, function(index, item) { 
                    arr[index] = item;      
                });
                $("#criterio").autocomplete({source: arr});
        });
    });
});