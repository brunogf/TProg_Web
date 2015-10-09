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
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
        <% DataCliente info = (DataCliente) request.getAttribute("info"); %>
        <% Set<DataReserva> reservas = info.getReservas();%>

        <div class="container perfil">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#infobasica" data-toggle="tab">Información básica</a></li>
                <li><a href="#reservas" data-toggle="tab">Reservas</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="infobasica">
                    <h3>Información Básica</h3>
                    <br/>
                    <label>Nombre:</label><%=info.getNombre()%>
                    <br/>
                    <label>Apellido:</label><%=info.getApellido()%>
                    <br/>
                    <label>Nickname:</label><%=info.getNickname()%>
                    <br/>
                    <label>Correo:</label><%=info.getCorreo()%>
                </div>

                <div class="tab-pane fade" id="reservas">
                    <h3>Reservas</h3>

                    <div class="col-xs-12 table-responsive">
                        <table class="table">
                            <tr class="cabeceraTabla">
                                <td>#</td>
                                <td>Estado</td>
                                <td>Fecha Creación</td>
                                <td>Cantidad Publicaciones</td>
                            </tr>
                            <%
                                for (DataReserva dr : reservas) {
                            %>

                            <tr class="reservas" onclick="location.href = 'VerInfoReserva?nro=<%=dr.getNum()%>'"><!--link a servlet ver info reserva-->
                                <td><%=dr.getNum()%></td>
                                <td><%=dr.getStringEstado()%></td>
                                <td><%=dr.getCreacion().toString()%></td> 
                                <td><%=dr.getdpd().size()%></td>
                            </tr>
                            <% }%>
                    </div>
                </div>
            </div>
    </body>
</html>
