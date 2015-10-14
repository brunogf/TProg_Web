<%-- 
    Document   : Servicios
    Created on : 14/10/2015, 10:47:15 AM
    Author     : spesamosca
--%>

<%@page import="tpgr32.DataServicio"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
        <div class="container Servicios">
          <div class="row">
            <%--Acá van los resultados--%>       
            <%
                Set<DataServicio> Servicios =(HashSet) request.getAttribute("Servicios");
                if (!Servicios.isEmpty())
                {%>                             
                    <div class="col-xs-12 table-responsive">
                        <table class="table">
                                <tr class="cabeceraTabla">
                                    <td>Nombre</td>
                                    <td>Proveedor</td>
                                </tr>    
                        <%    
                            String link;
                            for(DataServicio s : Servicios)
                            {    
                                link = "VerInfoPublicacion?Servicio=" + s.getNombre() +"&proveedor="+ s.getProveedor();%>
                                <tr class="result" onclick="location.href='<%=link%>'">
                                    <td><%=s.getNombre()%></td>
                                    <td><%=s.getProveedor()%></td>
                                </tr>
                            <%}%>
                        </table></div>
                <%}
                else
                {%>               
                    <div class="col-xs-12 noResult">
                        <span class="Message">No se encontró ningún servicio</span>
                    </div>
                <%}%>    
          </div>
        </div>
    </body>
</html>
