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
        <% Set<DataReserva> reservas = info.getReservas(); %>
        <% DateFormat df = new SimpleDateFormat("dd-MM-yyyy");%>

        <div class="contenedor Perfil">
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
                    </table>
                </div>
            </div>
    </body>
</html>
