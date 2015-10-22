<%-- 
    Document   : CarroDeCompras
    Created on : 17-oct-2015, 21:30:55
    Author     : piñe
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="tpgr32.DataPromocion"%>
<%@page import="tpgr32.DataServicio"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.HashSet"%>
<%@page import="tpgr32.ParDPD"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        
         <div class="container carro_de_compras">
            <%--Acá van los resultados--%>
            <%  float subt = 0;
                DecimalFormat df = new DecimalFormat();
                df.setMaximumFractionDigits(2);
                Set<ParDPD> par = (HashSet)request.getSession().getAttribute("publicaciones-carro");
                if (request.getSession().getAttribute("publicaciones-carro") != null)
                { %>
                <div class="row">
                <div class="col-xs-12 table-responsive">
                    <table class="table">
                        <tr class="cabeceraTabla">
                            <td>Nombre</td>
                            <td>Tipo</td>
                            <td>Precio</td>
                            <td>Descuento</td>
                            <td>Cantidad</td>
                            <td>Total</td>
                        </tr>
                <%
                    for(ParDPD p : par)
                    {
                        String pos;
                        float precio;
                        String link;
                        String descr ="";
                        String linkQuitar = "QuitarDelCarro?Nombre=" + p.getDpub_().getNombre() +"&Cantidad=" + String.valueOf(p.getDd_().getCant())
                                              + "&Proveedor=" + p.getDpub_().getProveedor();
                        if (p.getDpub_() instanceof DataServicio)
                        {
                            pos = "Servicio";
                            precio = ((DataServicio)p.getDpub_()).getPrecio();
                            descr = ((DataServicio)p.getDpub_()).getDescripcion();
                            link = "VerInfoServicio?Servicio=" + p.getDpub_().getNombre() +"&proveedor="+ p.getDpub_().getProveedor();
                        }
                        else
                        {
                            pos = "Promoción";
                            link = "VerInfoPromocion?Promocion=" + p.getDpub_().getNombre() +"&proveedor="+ p.getDpub_().getProveedor();
                            precio = ((DataPromocion)p.getDpub_()).getPrecioTotal();
                        }
                        
                        subt = subt + p.getDd_().getCant()* precio;

            %>
            <tr class="result" onclick="location.href='<%=link%>'"><!--link a servlet ver info publicacion-->
                <td class="col-xs-4"><h3><%=p.getDpub_().getNombre()%></h3>
                    <p><%=descr%></p>
                </td>
              <td><%=pos%></td>
              <td><%= "USD "+String.valueOf(df.format(precio)) %></td>
              <% if (p.getDpub_() instanceof DataServicio) 
              {
                 %>
              <td>% 0</td>
              <% }
              else{ %>
              <td><%= "% "+ String.valueOf(((DataPromocion)p.getDpub_()).getDescuento()) %></td>
              <% } %>
              <td><%= p.getDd_().getCant() %></td>
              <td><%= "USD "+String.valueOf(df.format(p.getDd_().getCant()* precio)) %></td>
              <td><button type="button" onclick="location.href='<%=linkQuitar%>'" class="btn btn-primary">X</button></td>
            </tr><%
            }%>
                    </table></div>
             </div>
            <div class="row">
              <div class="col-md-6 col-md-offset-7"> 
                  <p class="subtotal"><%="Subtotal: USD "+String.valueOf(df.format(subt)) %> </p>
              </div>
           </div>
            <div class="row">
                   <form id="formcomprar" class="formcomprar" action="GenerarReserva" method="post">
                     <button type="submit" class="btn btn-primary btn-lg col-md-3 col-md-offset-8">Comprar</button>
                   </form>
            </div>
            <br>
            <br>
          <% } 
          else{
            %>
            <div class="row">
               <div class="col-xs-12 noResult">
                 <span class="Message">No hay ninguna publicación agregada al carro</span>
             </div>
            <% } %>
            </div>
        </div>
            <jsp:include page="WEB-INF/templates/footer.jsp"/>
    </body>
</html>




 