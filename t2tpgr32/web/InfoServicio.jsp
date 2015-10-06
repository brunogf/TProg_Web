<%-- 
    Document   : InfoServicio
    Created on : 06-oct-2015, 10:59:26
    Author     : piñe
--%>

<%@page import="com.h4t.modelo.EstadoSesion"%>
<%@page import="tpgr32.DataServicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <% DataServicio info = (DataServicio)request.getAttribute("info_servicio"); %>
        <div class = "container">
                <h3><%=info.getNombre()%></h3>
                <br/>
                <label>Descripción:</label>
                <p><%=info.getDescripcion()%></p>
                <br/>
                <br/>
                <label>Precio:</label>
                <label><%=info.getPrecio()%></label>
                <br/>
                <label>Origen:</label>
                <label><%= info.getCiudadOrigen()%></label>
                <br/>
                <label>Destino:</label>
                <label><%= info.getCiudadDestino()%></label>
                <br/>
                <label>Proveedor:</label>
                <label><%=info.getProveedor()%></label>
                <br/>
                <br/>
                <%
            if (request.getSession().getAttribute("estado_sesion") != null)
            {
                switch((EstadoSesion)request.getSession().getAttribute("estado_sesion")){
			case LOGGED_IN:%>
                        
                        <button type='button' class='btn btn-default carro'><span class="glyphicon glyphicon-shopping-cart"></span>Agregar al Carro</button>            
                        <%break; 

                        default:%>
                         <p>Debe <a href="index.jsp">Iniciar sesión</a> o <a href="registro.jsp"> Registrase</a>
                            para agregar al Carro de Compras</p>
                        <%
                            
		}
            }
            else{%>
            <p>Debe <a href="index.jsp">Iniciar sesión</a> o <a href="registro.jsp"> Registrase</a>
                para agregar al Carro de Compras</p>
           
            <%};
        %>                
            </div>
                
    </body>
</html>
