<%-- 
    Document   : Servicios
    Created on : 15/10/2015, 07:57:30 PM
    Author     : spesamosca
--%>

<%@page import="com.h4t.servicios.DataServicioBean"%>
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
        <div class="container Servicios">
          <div class="row">
            <%--Acá van los resultados--%>       
            <%
                Set<DataServicioBean> Servicios =(HashSet) request.getAttribute("Servicios");
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
                            for(DataServicioBean s : Servicios)
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
