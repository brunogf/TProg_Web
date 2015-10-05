$(document).ready(function(){
$(document.getElementById("form-busqueda")).on("keyup", "#criterio", function(e) { 
    if (e.keyCode === 13)
    {
        $(document.getElementById("form-busqueda")).submit();
    }
    $.get("AjaxSearchRequest",{criterio : $("#criterio").val()} ,function(responseJson) {  
                var arr =[];
                $.each(responseJson, function(index, item) { 
                    arr[index] = item;      
                });
                $("#criterio").autocomplete({source: arr});
        });
    });
});