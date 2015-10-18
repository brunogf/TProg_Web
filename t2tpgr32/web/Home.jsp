<%-- 
    Document   : Home
    Created on : 17/10/2015, 05:31:52 PM
    Author     : spesamosca
--%>

<%@page import="java.util.HashSet"%>
<%@page import="tpgr32.DataPromocion"%>
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
                <div class ="col-xs-6">
                    <ul id="menu_arbol">
                        <li>Promociones                     
                        <ul>
                            <%
                            String link;
                            if (!Promociones.isEmpty()){
                                for(DataPromocion p : Promociones){
                                    link = "VerInfoPromocion?Promocion=" + p.getNombre() +"&proveedor="+ p.getProveedor();%>
                                    <li>
                                        <div class ="promo" onclick="location.href='<%=link%>'">
                                        <%=p.getNombre()%>
                                        </div>
                                    </li>                                       
                                <%}
                            }
                            %>
                        </ul>
                        </li>
                        <jsp:include page="WEB-INF/templates/NodoCatTree.jsp"/>
                    </ul>
                    <script type="text/javascript">                       
                            iniciaMenu('menu_arbol');                       
                    </script>
                </div>
            </div>
        </div>
    </body>
</html>
