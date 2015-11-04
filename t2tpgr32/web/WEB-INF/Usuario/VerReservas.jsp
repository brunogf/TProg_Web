<%-- 
    Document   : VerReservas
    Created on : 04-oct-2015, 11:06:38
    Author     : Nico
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.h4t.servicios.DataReserva"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
        <div class="container VerReservas">
            <div class="row">
                <%
                List<DataReserva> reservas = (ArrayList)request.getAttribute("reservas_usuario");
                if (!(reservas == null))
                {
                if (!reservas.isEmpty())
                {%>
                <div class="col-xs-12 table-responsive">
                    <table class="table">
                        <tr class="cabeceraTabla">
                            <td>#</td>
                            <td>Estado</td>
                            <td>Fecha Creación</td>
                            <td>Cantidad Publicaciones</td>
                        </tr>
                <%
                    for(DataReserva r : reservas)
                    {
                        Format f = new SimpleDateFormat("dd-MM-yyyy");
                        String fecha = f.format(r.getCreacion().toGregorianCalendar().getTime());
                %>
                    <tr class="reservas" onclick="location.href='VerInfoReserva?nro=<%=r.getNum()%>'"><!--link a servlet ver info reserva-->
                      <td><%=r.getNum()%></td>
                      <td><%=r.getEstado().toString() %></td>
                      <td><%=fecha%></td>
                      <td><%=r.getDpd().size()%></td>
                    </tr><%
            }%>
                </table></div><%
           }
                else{
            %>
            <div class="col-xs-12 noResult">
                <span class="Message">No tienes ninguna reserva</span>
            </div>
            <%}
            }
                else{%>
            <div class="col-xs-12 noResult">
                <span class="Message">No tienes ninguna reserva</span>
            </div>
            <%}%>
            </div>
        </div>
            <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>
