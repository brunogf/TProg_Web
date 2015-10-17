<%-- 
    Document   : VerReserva
    Created on : 04-oct-2015, 14:22:32
    Author     : Nico
--%>

<%@page import="tpgr32.Estado"%>
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
                <h2 class="Titulo">Detalles de la reserva</h2>
                <span class="nroReserva">Número de reserva: <%=dr.getNum()%></span>
                <br>
                <span class="creacionReserva">Fecha de creación: <%=f.format(dr.getCreacion())%></span>
                <br>
                <span class="estadoReserva">Estado: <%=dr.getStringEstado()%></span> 
                <%if((dr.getEstado() == Estado.Registrada) && (((String)session.getAttribute("Usuario")).equals(dr.getCliente()))){%>
                <span> - </span>
                <span class ="cancelar-reserva btn-link" onclick="cancelar(<%=dr.getNum()%>)">Cancelar</span>
                <%}%>
            </div>
            <br>
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
                <h4 class="servicios">Servicios</h4>

                <div class="serviciosDiv">
                    <%for(ParDPD dpd : dr.getdpd())
                    {
                        if(dpd.getDpub_() instanceof DataServicio)
                        {
                            DataServicio ds = (DataServicio)dpd.getDpub_();
                            DataDisponibilidad dd = dpd.getDd_();
                            String link = "VerInfoServicio?Servicio=" + ds.getNombre() +"&proveedor="+ ds.getProveedor();
                        %>
                        <div class="BloqueServicio BloquePublicacion" onclick="location.href='<%=link%>'">
                        <span class="nombre-servicio"> <%=ds.getNombre() %></span><br>
                        <div class="descripcionServicio">
                            <p class="pdescripcion">Descripción:<%=ds.getDescripcion() %> </p>
                        </div>
                        <span>Precio: $<%=ds.getPrecio() %></span><br>
                        <span>Proveedor: <%=ds.getProveedor() %> </span><br>
                        <span>Fecha inicio: <%=f.format(dd.getFechaIni()) %></span><br>
                        <span>Fecha fin: <%=f.format(dd.getFechaFin()) %></span><br>
                        <span>Cantidad: <%=dd.getCant() %></span><br>
                        
                    </div>
                    <%}}}
                    if (cant_promo >0)
                    {%>
                       <h4 class="promociones">Promociones</h4>

                        <div class="promosDiv BloquePublicacion">
                            <%for(ParDPD dpd : dr.getdpd())
                            {
                                if(dpd.getDpub_() instanceof DataPromocion)
                                {
                                    DataPromocion dp = (DataPromocion)dpd.getDpub_();
                                    DataDisponibilidad dd = dpd.getDd_();
                                    String link = "VerInfoPromocion?Promocion=" + dp.getNombre() +"&proveedor="+ dp.getProveedor();
                                %>
                            <div onclick="location.href='<%=link%>'">
                                <span class="nombre-promocion"> <%=dp.getNombre() %></span><br>
                                <span>Descuento:<%=dp.getDescuento() %> </span><br>
                                <span>Precio: $<%=dp.getPrecioTotal() %></span><br>
                                <span>Proveedor: <%=dp.getProveedor() %></span><br>
                                <span>Fecha inicio: <%=f.format(dd.getFechaIni()) %></span><br>
                                <span>Fecha fin: <%=f.format(dd.getFechaFin()) %></span><br>
                                <span>Cantidad: <%=dd.getCant() %></span><br>
                            </div>
                    <%}}} %>
                </div>
            </div>
        </div>
        <script>
            function cancelar(nro) {
               var r = confirm("Una vez cancelada la reserva, no se podrá revertir el cambio!. Cancelar de todas formas?");
               if (r === true)
               {
                   var url = "CancelarReserva?nro=" + nro;
                   window.location = url;
               }
            }
            </script>
    </body>
</html>
