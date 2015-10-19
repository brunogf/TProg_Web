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
        <% DataUsuario info = (DataUsuario) request.getAttribute("info"); %>
        <%if (info instanceof DataCliente){ 
            DataCliente info2 = (DataCliente) info;%>
            <% Set<DataReserva> reservas = info2.getReservas();%>
            <% DateFormat df = new SimpleDateFormat("dd-MM-yyyy");%>

            <div class="container perfil">

                <!--img src="${pageContext.session.getAttribute("Imagen")}" width="100px" height="100px" alt="Imagen Perfil"-->
                <!--Imagen a la izquierda y div nom a su derecha -->

                <div class="nom">
                    <h3><%=info.getNombre() + " " + info.getApellido()%></h3>
                    <h5><%=info.getCorreo().toLowerCase()%></h5>
                    <br/>
                </div>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#infobasica" data-toggle="tab"><b>Información básica</b></a></li>
                    <li><a href="#reservas" data-toggle="tab"><b>Reservas</b></a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="infobasica">
                        <label>Nombre:</label><%=" " + info.getNombre()%>
                        <br/>
                        <label>Apellido:</label><%=" " + info.getApellido()%>
                        <br/>
                        <label>Nickname:</label><%=" " + info.getNickname()%>
                        <br/>
                        <label>Correo:</label><%=" " + info.getCorreo().toLowerCase()%>
                        <br/>
                        <label>Fecha de nacimiento:</label><%=" " + df.format(info.getFecha())%>
                        <br/>
                        <%
                            String imagen = "media/Images/";
                            imagen = imagen + info.getNickname().toLowerCase() + ".jpg";
                        %>
                        <img src="<%=imagen%>" width="150px" height="150px" alt="Imagen Perfil" onError="this.onerror=null;this.src='media/Images/perfil.jpg';" class="img-thumbnail"> 
                        <br/>
                    </div>
                </div>               
                <div class="tab-pane fade" id="reservas">
                        <div class="col-xs-12 table-responsive">
                            <table class="table">
                                <tr class="cabeceraTabla">
                                    <td><h4>#</h4></td>
                                    <td><h4>Estado</h4></td>
                                    <td><h4>Fecha creación</h4></td>
                                    <td><h4>Cantidad publicaciones</h4></td>
                                </tr>
                                <%
                                    for (DataReserva dr : reservas) {
                                        String creacion = df.format(dr.getCreacion());
                                %>

                                <tr class="reservas" onclick="location.href = 'VerInfoReserva?nro=<%=dr.getNum()%>'"><!--link a servlet ver info reserva-->
                                    <td><%=dr.getNum()%></td>
                                    <td><%=dr.getStringEstado()%></td>
                                    <td><%=creacion%></td> 
                                    <td><%=dr.getdpd().size()%></td>
                                </tr>
                            </table>
                                <% }%>
                        </div>
                    </div>
                </div>
            
            <%}
            else{
                    DataProveedor info2 = (DataProveedor) info;%>           
             <% DateFormat df = new SimpleDateFormat("dd-MM-yyyy");%>

             <div class="container perfil">

                 <!--img src="${pageContext.session.getAttribute("Imagen")}" width="100px" height="100px" alt="Imagen Perfil"-->
                 <!--Imagen a la izquierda y div nom a su derecha -->

                 <div class="nom">
                     <h3><%=info.getNombre() + " " + info.getApellido()%></h3>
                     <h5><%=info.getCorreo().toLowerCase()%></h5>
                     <br/>
                 </div>
                 <ul class="nav nav-tabs">
                     <li class="active"><a href="#infobasica" data-toggle="tab"><b>Información básica</b></a></li>
                 </ul>

                 <div class="tab-content">
                     <div class="tab-pane fade in active" id="infobasica">
                         <label>Nombre:</label><%=" " + info.getNombre()%>
                         <br/>
                         <label>Apellido:</label><%=" " + info.getApellido()%>
                         <br/>
                         <label>Nickname:</label><%=" " + info.getNickname()%>
                         <br/>
                         <label>Correo:</label><%=" " + info.getCorreo().toLowerCase()%>
                         <br/>
                         <label>Fecha de nacimiento:</label><%=" " + df.format(info.getFecha())%>
                         <br/>
                         <%
                             String imagen = "media/Images/";
                             imagen = imagen + info.getNickname().toLowerCase() + ".jpg";
                         %>
                         <img src="<%=imagen%>" width="150px" height="150px" alt="Imagen Perfil" onError="this.onerror=null;this.src='media/Images/perfil.jpg';" class="img-thumbnail"> 
                         <br/>
                     </div>
                  </div>
                </div>
                
                <% }%>
            
       <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>
