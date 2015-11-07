<%-- 
    Document   : Home
    Created on : 17/10/2015, 05:31:52 PM
    Author     : spesamosca
--%>

<%@page import="com.h4t.servicios.DataPromocion"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <jsp:include page="WEB-INF/templates/head.jsp"/>
        <script type="text/javascript" src="media/js/Arbol.js"></script> 
    </head>
    <body>       
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <%Set<DataPromocion> Promociones =(HashSet) request.getAttribute("Promos");%>
        <div class ="container Categorias">
            <div class ="row">
                <div class ="col-xs-4 tree_home">
                    <ul id="menu_arbol">
                        <li id ="promociones_li" onclick="promo()">Promociones                     
                        <ul>
                        </ul>
                        </li>
                        <jsp:include page="WEB-INF/templates/NodoCatTree.jsp"/>
                    </ul>
                        
                    <script type="text/javascript">                       
                            iniciaMenu('menu_arbol');                       
                    </script>
                    
                </div>
                <div class="col-xs-8">
                    
                    <div class="col-xs-12 pub">
                        <table class="table_home col-xs-12">
                            <thead class="row">
                                <th class="col-xs-4">Nombre</th>
                                <th class="col-xs-4">Proveedor</th>
                                <th class="col-xs-4">Precio</th>
                            </thead>
                            <tbody class="row" id="tbody_home">
                                  
                            </tbody>
                        </table>
                    </div>
                   
                </div>
            </div>
        </div>
        <jsp:include page="WEB-INF/templates/footer.jsp"/>
        <script>
            $("#Categorias_tree > a").click();
            
            $("#Vuelos_tree > a").click();
            $("#Alojamientos_tree > a").click();
            $("#Automóviles_tree > a").click();
            $(document).ready(function(){$("#promociones_li > a").click();});
            
            
            
                
            function promo(){
               
                
                $.get("HomeAjax",{tipo : "Promocion", cat : ""}, function(responseJson){
                    $("#tbody_home").empty();
                    for(var key in responseJson)
                    {
                        var item = responseJson[key];
                        var precio = item.precioTotal_.toFixed(2);
                        var tr = '<tr class="home_pub" onclick="location.href='
                        tr = tr + '\'VerInfoPromocion?Promocion=' + item.nombre_ + '&proveedor=' + item.proveedor_ + '\''; 
                        tr = tr + '"><td class="Nombre_pub_home col-xs-4">';
                        tr = tr + item.nombre_ + '</td><td class="Proveedor_pub_home col-xs-4">';
                        tr = tr + item.proveedor_ + '</td><td class="Precio_pub_home col-xs-4"> US$ ';
                        tr = tr + precio + ' <span class="home_oferta">¡Promoción!</span> </td></tr>'
                        
                        $('#tbody_home:last-child').append(tr);
                        
                    }
                });
            }
            
            function servicio(categoria){
                $.get("HomeAjax",{tipo : "Servicio", cat : categoria}, function(responseJson){
                    $("#tbody_home").empty();
                    for(var key in responseJson){
                        var item = responseJson[key];
                        var precio = item.precio_.toFixed(2);
                        var tr = '<tr class="home_pub" ';
                        tr = tr + 'onclick="location.href=\'VerInfoServicio?Servicio=' + item.nombre_;
                        tr = tr + '&proveedor=' + item.proveedor_ + '\'"';
                        tr = tr + '><td class="Nombre_pub_home col-xs-4">';
                        tr = tr + item.nombre_ + '</td><td class="Proveedor_pub_home col-xs-4">';
                        tr = tr + item.proveedor_ + '</td><td class="Precio_pub_home col-xs-4"> US$ ';
                        tr = tr + precio + '</td></tr>'
                        
                        $('#tbody_home:last-child').append(tr);
                    }
                });
            }
        </script>
    </body>
</html>
