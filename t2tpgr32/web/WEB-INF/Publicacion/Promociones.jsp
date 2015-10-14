<%-- 
    Document   : Promociones
    Created on : 10/10/2015, 10:28:37 PM
    Author     : spesamosca
--%>

<%@page import="tpgr32.DataServicio"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="tpgr32.DataPublicacion"%>
<%@page import="tpgr32.DataPromocion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
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
                                link = "VerInfoPublicacion?Promocion=" + p.getNombre() +"&proveedor="+ p.getProveedor();%>
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
    </body>
</html>