<%-- 
    Document   : Promociones
    Created on : 15/10/2015, 06:55:06 PM
    Author     : spesamosca
--%>

<%@page import="com.h4t.servicios.DataPromocion"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <div class="container Promociones">
          <div class="row">
            <%--Acá van los resultados--%>       
            <%
                Set<DataPromocion> Promociones =(HashSet) request.getAttribute("Promociones");
                if (!Promociones.isEmpty())
                {%>                             
                    <div class="col-xs-12 table-responsive">
                        <table class="table">
                                <tr class="cabeceraTabla">
                                    <td>Nombre</td>
                                    <td>Proveedor</td>
                                </tr>    
                        <%    
                            String link;
                            for(DataPromocion p : Promociones)
                            {    
                                link = "VerInfoPromocion?Promocion=" + p.getNombre() +"&proveedor="+ p.getProveedor();%>
                                <tr class="result" onclick="location.href='<%=link%>'">
                                    <td><%=p.getNombre()%></td>
                                    <td><%=p.getProveedor()%></td>
                                </tr>
                            <%}%>
                        </table></div>
                <%}
                else
                {%>               
                    <div class="col-xs-12 noResult">
                        <span class="Message">No se encontró ninguna promoción</span>
                    </div>
                <%}%>    
          </div>
        </div>
          <jsp:include page="WEB-INF/templates/footer.jsp"/>
    </body>
</html>
