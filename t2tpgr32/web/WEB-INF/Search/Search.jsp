<%--
    Document   : Busqueda
    Created on : 30-sep-2015, 19:02:23
    Author     : Nicolás
--%>

<%@page import="tpgr32.DataServicio"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="tpgr32.DataPublicacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
        <div class="container">
          <div class="col-xs-12">
            <%--Acá van los resultados--%>
            <%
                Set<DataPublicacion> publicaciones =(HashSet) request.getAttribute("publicaciones");
                if (!publicaciones.isEmpty())
                {
                    for(DataPublicacion p : publicaciones)
                    {
                        String pos;
                        if (p instanceof DataServicio)
                            pos = "Servicio";
                        else
                            pos = "Promoción";
            %>
            <div class="result">
              <h5><%=p.getNombre()%></h5>
              <span class="tipo"><%=pos%></span>
              <span class="proveedor"><%=p.getProveedor()%></span>
            </div><%
            }
           }
                else{
            %>
            <div class="noResult">
                <span class="Message">No se encontró ninguna publicación
            </div>    
            <%}%>
          </div>
        </div>
    </body>
</html>
