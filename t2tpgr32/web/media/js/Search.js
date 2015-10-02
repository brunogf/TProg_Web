$(document).ready(function(){
$(document.getElementById("form-busqueda")).on("keyup", "#criterio", function() {  // When HTML DOM "keyup" event is invoked on element with ID "lala", execute the following function...   
    $.get("AjaxRequest",{criterio : $("#criterio").val()} ,function(responseJson) {    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
                var arr =[];
                $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                    arr[index] = item;      // Create HTML <li> element, set its text content with currently iterated item and append it to the <ul>.
                });
                $("#criterio").autocomplete({source: arr});
        });
    });
});