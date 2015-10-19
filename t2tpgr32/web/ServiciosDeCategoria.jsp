<%-- 
    Document   : ServiciosDeCategoria
    Created on : 18/10/2015, 01:31:56 PM
    Author     : spesamosca
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashSet"%>
<%@page import="tpgr32.DataServicio"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <jsp:include page="WEB-INF/templates/head.jsp"/>
    </head>
    <body>       
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <div class="container Servicios">
          <div class="row">
            <%--Acá van los resultados--%>       
            <%
                Set<DataServicio> Servicios =(HashSet) request.getAttribute("ServiciosDeCategoria");
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
                                link = "VerInfoServicio?Servicio=" + s.getNombre() +"&proveedor="+ s.getProveedor();%>
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
          <jsp:include page="WEB-INF/templates/footer.jsp"/>
    </body>
</html>
