<%-- 
    Document   : VerReserva
    Created on : 04-oct-2015, 14:22:32
    Author     : Nico
--%>

<%@page import="tpgr32.DataPromocion"%>
<%@page import="tpgr32.DataDisponibilidad"%>
<%@page import="tpgr32.DataServicio"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="tpgr32.DataReserva"%>
<%@page import="tpgr32.ParDPD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
        <script src="media/js/VerReserva.js"></script>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
        <div class="container VerReserva">
            <div class="row infoReserva">
                <%Format f = new SimpleDateFormat("dd-MM-yyyy");
                DataReserva dr = ((DataReserva)request.getAttribute("info_reserva_dr"));%>
                <span class="nroReserva">Número de reserva: <%=dr.getNum()%></span>
                <br>
                <span class="creacionReserva">Fecha de creación: <%=f.format(dr.getCreacion())%></span>
                <br>
                <span class="estadoReserva">Estado: <%=dr.getStringEstado()%></span> 
            </div>
            <div class="row infoPublicacionesReserva">
                <%  int cant_servicios = 0;
                    int cant_promo = 0;
                    for(ParDPD dpd : dr.getdpd())
                    {
                        if(dpd.getDpub_() instanceof DataServicio)
                            cant_servicios++;
                        else
                            cant_promo++;
                    }        
                    if (cant_servicios > 0)
                    {
                    %>
                <span class="servicios">Servicios</span>
                <br>
                <div class="serviciosDiv">
                    <%for(ParDPD dpd : dr.getdpd())
                    {
                        if(dpd.getDpub_() instanceof DataServicio)
                        {
                            DataServicio ds = (DataServicio)dpd.getDpub_();
                            DataDisponibilidad dd = dpd.getDd_();
                        %>
                    <div class="BloqueServicio">
                        <span>Nombre: <%=ds.getNombre() %></span><br>
                        <div class="descripcionServicio">
                            <p class="pdescripcion">Descripción:<%=ds.getDescripcion() %> </p>
                        </div>
                        <span>Precio: $<%=ds.getPrecio() %></span><br>
                        <span>Proveedor: <%=ds.getProveedor() %> </span><br>
                        <span>Fecha inicio: <%=f.format(dd.getFechaIni()) %></span><br>
                        <span>Fecha fin: <%=f.format(dd.getFechaFin()) %></span><br>
                        <span>Cantidad: <%=dd.getCant() %></span><br>
                        <div class="imagenes">
                            <img src="#" alt="Imagen #1" width="50px" height="50px">
                            <img src="#" alt="Imagen #2" width="50px" height="50px">
                            <img src="#" alt="Imagen #3" width="50px" height="50px">
                        </div>
                    </div>
                    <%}}}
                    if (cant_promo >0)
                    {%>
                       <span class="promociones">Promociones</span>
                        <br>
                        <div class="promosDiv">
                            <%for(ParDPD dpd : dr.getdpd())
                            {
                                if(dpd.getDpub_() instanceof DataPromocion)
                                {
                                    DataPromocion dp = (DataPromocion)dpd.getDpub_();
                                    DataDisponibilidad dd = dpd.getDd_();
                                %>
                            <div>
                                <span>Nombre: <%=dp.getNombre() %></span><br>
                                <span>Descuento:<%=dp.getDescuento() %> </span><br>
                                <span>Precio: $<%=dp.getPrecioTotal() %></span><br>
                                <span>Proveedor: <%=dp.getProveedor() %></span><br>
                                <span>Fecha inicio: <%=f.format(dd.getFechaIni()) %></span><br>
                                <span>Fecha fin: <%=f.format(dd.getFechaFin()) %></span><br>
                                <span>Cantidad: <%=dd.getCant() %></span><br>
                                <div class="imagenes">
                                    <img src="#" alt="Imagen #1" width="50px" height="50px">
                                    <img src="#" alt="Imagen #2" width="50px" height="50px">
                                    <img src="#" alt="Imagen #3" width="50px" height="50px">
                                </div>
                            </div>
                    <%}}} %>
                </div>
            </div>
        </div>
        
    </body>
</html>
