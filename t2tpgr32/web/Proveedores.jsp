<%-- 
    Document   : Proveedores
    Created on : 16/10/2015, 08:43:59 PM
    Author     : spesamosca
--%>

<%@page import="java.util.HashSet"%>
<%@page import="tpgr32.DataUsuario"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <div class="container Proveedores">
          <div class="row">
            <%--Acá van los resultados--%>       
            <%
                Set<DataUsuario> Proveedores =(HashSet) request.getAttribute("Proveedores");
                if (!Proveedores.isEmpty())
                {%>                             
                    <div class="col-xs-12 table-responsive">
                        <table class="table">
                                <tr class="cabeceraTabla">
                                    <td>Nickname</td>
                                    <td>Nombre</td>
                                </tr>    
                        <%    
                            String link;
                            for(DataUsuario p : Proveedores)
                            {    
                                link = "VerInfoProveedor?Proveedor=" + p.getNickname();%>
                                <tr class="result" onclick="location.href='<%=link%>'">
                                    <td><%=p.getNickname()%></td>
                                    <td><%=p.getNombre()%></td>
                                </tr>
                            <%}%>
                        </table></div>
                <%}
                else
                {%>               
                    <div class="col-xs-12 noResult">
                        <span class="Message">No se encontró ningún proveedor.</span>
                    </div>
                <%}%>    
          </div>
        </div>
    </body>
</html>
