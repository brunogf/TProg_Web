<%-- 
    Document   : perfil
    Created on : 28/09/2015, 10:40:54 PM
    Author     : Bruno González
--%>

<%@page import="tpgr32.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=1.0">
        <link rel="stylesheet" href="media/css/bootstrap.min.css">
        <link rel="stylesheet" href="media/styles.css">
        
        <title>Perfil usuario</title>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
        <div class="profiler">
            
            <% DataCliente info = (DataCliente) request.getAttribute("info"); %>
            <% Set<DataReserva> reservas = info.getReservas(); %>
            
            <span class="contenedor">
                <h2>Información básica</h2>
                
                <label class="rotulo">Nick:</label>
                <label class="valor"><%=info.getNickname()%></label>
                <br/>
                <label class="rotulo">Email:</label>
                <label class="valor"><%=info.getCorreo()%></label>
                <br/>
                <label class="rotulo">Nombre:</label>
                <label class="valor"><%=info.getNombre()%></label>
                <br/>
                <label class="rotulo">Apellido:</label>
                <label class="valor"><%=info.getApellido()%></label>
                <br/>
                <label class="rotulo">Fecha de Nacimiento:</label>
                <label class="valor"><%=info.getFecha().toString() %></label>
                <br/>
                <img class="imagen" width="200px" src="media/Images/eWatson.jpg" />
                <br/>
                <label class="rotulo">Reservas:</label> 
                <%--! reservas.isEmpty(); --%>
            </span>
        </div>
    </body>
</html>
