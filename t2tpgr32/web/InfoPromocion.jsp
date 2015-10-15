<%-- 
    Document   : InfoPromocion
    Created on : 15/10/2015, 06:43:02 PM
    Author     : spesamosca
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.h4t.modelo.EstadoSesion"%>
<%@page import="tpgr32.DataServicio"%>
<%@page import="tpgr32.DataPromocion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <div class="container InfoPromocion"> 
              <% 
                 DataPromocion info_promocion = (DataPromocion) request.getAttribute("info_promocion");
                 Set<DataServicio> servicios_de_promocion =(HashSet) request.getAttribute("servicios_de_promocion");                 
              %>
                    <h3>Información de la promoción</h3>
                        <br/>
                        <label>Nombre:</label><%=info_promocion.getNombre()%>
                        <br/>
                        <label>Proveedor:</label><%=info_promocion.getProveedor()%>
                        <br/>
                        <label>Descuento:</label><%=info_promocion.getDescuento()%>
                        <br/>
                        <label>Precio Total:</label><%=info_promocion.getPrecioTotal()%>
                        <br/>
                        <h4>Servicios asociados</h4>                        
                        <div class="container serviciosDePromocion"> 
                            <div class="row">
                                <div class="col-xs-6 table-responsive">
                                <table class="table">
                                        <tr class="cabeceraTabla">
                                            <td>Nombre</td>
                                            <td>Proveedor</td>
                                        </tr>    
                                <%    
                                    String link;                                   
                                    for(DataServicio s : servicios_de_promocion)
                                    { 
                                        link = "VerInfoServicio?Servicio=" + s.getNombre() +"&proveedor="+ s.getProveedor();%>
                                        <tr class="result" onclick="location.href='<%=link%>'">
                                            <td><%=s.getNombre()%></td>
                                            <td><%=s.getProveedor()%></td>
                                        </tr>
                                    <%}%>
                                </table></div>
                            </div>
                        </div>  
                    </div>
    </body>
</html>
