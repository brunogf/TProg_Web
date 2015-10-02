<%-- 
    Document   : perfil
    Created on : 28/09/2015, 10:40:54 PM
    Author     : Bruno González
--%>

<%@page import="tpgr32.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <% DataCliente info = (DataCliente) request.getAttribute("info"); %>
        <% Set<DataReserva> reservas = info.getReservas(); %>
        <% DateFormat df = new SimpleDateFormat("dd-MM-yyyy");%>

        <div class="contenedor">
            <div class="basicinfo">
                <h3>Información básica</h3>

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
                <label class="valor"><%= df.format(info.getFecha())%></label>
                <br/>
                <img class="imagen" width="200px" height="200px" src="${pageContext.session.getAttribute("Imagen")}" alt="Imagen Perfil" />
                <br/>
                <br/>
            </div>
            <div id="listar" class="perfil">
                <h3>Reservas</h3>                

                <%= "Cantidad: " + reservas.size()%>
                <br/>
                <br/>

                <%
                    for (DataReserva dr : reservas) {
                %>

                <div class="reserva">
                    <%= "ID: " + dr.getNum()%>
                    <br/>
                    <%= "Precio: " + dr.getPrecio_total()%>
                    <br/>
                    <%= "Estado: " + dr.getStringEstado()%>                         
                    <br/>
                    <br/>
                </div>		
                <% }%>
            </div>
        </div>
    </body>
</html>
