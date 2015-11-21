<%-- 
    Document   : VerReserva
    Created on : 04-oct-2015, 14:22:32
    Author     : Nico
--%>

<%@page import="java.util.Date"%>
<%@page import="com.h4t.servicios.DataPromocion"%>
<%@page import="com.h4t.servicios.DataDisponibilidad"%>
<%@page import="com.h4t.servicios.DataServicioBean"%>
<%@page import="com.h4t.servicios.ParDPD"%>
<%@page import="com.h4t.servicios.Estado"%>
<%@page import="com.h4t.servicios.DataReserva"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                <span class="creacionReserva">Fecha de creación: <%=f.format((dr.getCreacion()).toGregorianCalendar().getTime())%></span>
                <br>
                <span class="estadoReserva">Estado: <%=dr.getEstado().toString()%></span> 
                <%if((dr.getEstado() == Estado.REGISTRADA) && (((String)session.getAttribute("Usuario")).equals(dr.getCliente()))){%>
                <span> - </span>
                <span class ="cancelar-reserva btn-link" onclick="cancelar(<%=dr.getNum()%>)">Cancelar</span>
                <%}else if((dr.getEstado() == Estado.FACTURADA) && (((Integer)request.getAttribute("info_reserva_fac")) != -1)){%>
                <span> - </span>
                <span class="cancelar-reserva btn-link" onclick="window.open='VerFactura?id=<%=request.getAttribute("info_reserva_fac")%>'">Ver Factura</span>
                <%}%>
            </div>
            <br>
            <div class="row infoPublicacionesReserva">
                <%  int cant_servicios = 0;
                    int cant_promo = 0;
                    for(ParDPD dpd : dr.getDpd())
                    {
                        if(dpd.getDpub()instanceof DataServicioBean)
                            cant_servicios++;
                        else
                            cant_promo++;
                    }        
                    if (cant_servicios > 0)
                    {
                    %>
                <h4 class="servicios">Servicios</h4>

                <div class="serviciosDiv">
                    <%for(ParDPD dpd : dr.getDpd())
                    {
                        if(dpd.getDpub()instanceof DataServicioBean)
                        {
                            DataServicioBean ds = (DataServicioBean)dpd.getDpub();
                            DataDisponibilidad dd = dpd.getDd();
                            String link = "VerInfoServicio?Servicio=" + ds.getNombre() +"&proveedor="+ ds.getProveedor();
                        %>
                        <div class="BloqueServicio BloquePublicacion" onclick="location.href='<%=link%>'">
                        <span class="nombre-servicio"> <%=ds.getNombre() %></span><br>
                        <div class="descripcionServicio">
                            <p class="pdescripcion">Descripción:<%=ds.getDescripcion() %> </p>
                        </div>
                        <span>Precio: $<%=ds.getPrecio() %></span><br>
                        <span>Proveedor: <%=ds.getProveedor() %> </span><br>
                        <span>Fecha inicio: <%=f.format(dd.getFechaIni().toGregorianCalendar().getTime()) %></span><br>
                        <span>Fecha fin: <%=f.format(dd.getFechaFin().toGregorianCalendar().getTime()) %></span><br>
                        <span>Cantidad: <%=dd.getCant() %></span><br>
                        
                    </div>
                    <%}}}
                    if (cant_promo >0)
                    {%>
                       <h4 class="promociones">Promociones</h4>

                        
                            <%for(ParDPD dpd : dr.getDpd())
                            {
                                if(dpd.getDpub() instanceof DataPromocion)
                                {
                                    DataPromocion dp = (DataPromocion)dpd.getDpub();
                                    DataDisponibilidad dd = dpd.getDd();
                                    String link = "VerInfoPromocion?Promocion=" + dp.getNombre() +"&proveedor="+ dp.getProveedor();
                                %>
                            <div class="promosDiv BloquePublicacion" onclick="location.href='<%=link%>'">
                                <span class="nombre-promocion"> <%=dp.getNombre() %></span><br>
                                <span>Descuento:<%=dp.getDescuento() %> </span><br>
                                <span>Precio: $<%=dp.getPrecioTotal() %></span><br>
                                <span>Proveedor: <%=dp.getProveedor() %></span><br>
                                <span>Fecha inicio: <%=f.format(dd.getFechaIni().toGregorianCalendar().getTime()) %></span><br>
                                <span>Fecha fin: <%=f.format(dd.getFechaFin().toGregorianCalendar().getTime()) %></span><br>
                                <span>Cantidad: <%=dd.getCant() %></span><br>
                            </div>
                    <%}}} %>
                
                
            </div>
                <br>
                <div class="col-xs-offset-10">
                    <span class="precioSubtotal">Total: US$ <%=String.format("%.2f", dr.getPrecioTotal())%></span>
                <br>
                <br>
                <%if(dr.getEstado() == Estado.REGISTRADA){%>
                <span class="boton-pagar btn btn-primary btn-lg" onclick="pagar(<%=dr.getNum()%>)">Pagar</span>
                <%}%>
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
            
            function pagar(nro) {
               var r = confirm("Una vez realizado el pago debes esperar hasta que todos los proveedores confirmen el pago.");
               if (r === true)
               {
                   var url = "PagarReserva?nro=" + nro;
                   window.location = url;
               }
            }
            </script>
            <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>
