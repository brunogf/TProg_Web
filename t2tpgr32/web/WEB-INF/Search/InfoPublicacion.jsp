<%-- 
    Document   : InfoPromocion
    Created on : 10/10/2015, 03:27:14 PM
    Author     : spesamosca
--%>

<%@page import="tpgr32.DataServicio"%>
<%@page import="tpgr32.DataPromocion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
        <div class="container">
          <div class="row">  
              <% DataPromocion info_promocion = (DataPromocion) request.getAttribute("info_promocion");
                 DataServicio info_servicio = (DataServicio) request.getAttribute("info_servicio");
                 if (!(info_promocion == null)){
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
                <%}
                 else{%>
                    <h3>Información del servicio</h3>
                        <br/>
                        <label>Nombre:</label><%=info_servicio.getNombre()%>
                        <br/>
                        <label>Proveedor:</label><%=info_servicio.getProveedor()%>
                        <br/>
                        <label>Descripción:</label><%=info_servicio.getDescripcion()%>
                        <br/>
                        <label>Precio:</label><%=info_servicio.getPrecio()%>
                    <%}%>
              
          </div>
        </div>
    </body>
</html>
