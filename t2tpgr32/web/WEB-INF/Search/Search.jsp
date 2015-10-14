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
        <div class="container search">
          <div class="row">
            <%--Acá van los resultados--%>
            <%
                Set<DataPublicacion> publicaciones =(HashSet) request.getAttribute("publicaciones");
                if (!publicaciones.isEmpty())
                {%>
                <div class="col-xs-12 table-responsive">
                    <table class="table">
                        <tr class="cabeceraTabla">
                            <td>Nombre</td>
                            <td>Tipo</td>
                            <td>Proveedor</td>
                        </tr>
                <%
                    String link;
                    for(DataPublicacion p : publicaciones)
                    {
                        String pos;
                        String link;
                        if (p instanceof DataServicio){
                            pos = "Servicio";
                        else
                            pos = "Promocion";
                        
            link = "VerInfoPublicacion?"+pos+"=" + p.getNombre() +"&proveedor="+ p.getProveedor();%>
            <tr class="result" onclick="location.href='<%=link%>'"><!--link a servlet ver info publicacion-->
              <td><%=p.getNombre()%></td>
              <td><%=pos%></td>
              <td><%=p.getProveedor()%></td>
            </tr><%
            }%>
                </table></div><%
           }
                else{
            %>
            <div class="col-xs-12 noResult">
                <span class="Message">No se encontró ninguna publicación</span>
            </div>
            <%}%>
          </div>
        </div>
    </body>
</html>
