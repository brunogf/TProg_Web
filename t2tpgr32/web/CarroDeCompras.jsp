<%-- 
    Document   : CarroDeCompras
    Created on : 17-oct-2015, 21:30:55
    Author     : piñe
--%>


<%@page import="com.h4t.servicios.DataPromocion"%>
<%@page import="com.h4t.servicios.DataServicioBean"%>
<%@page import="com.h4t.servicios.ParDPD"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.HashSet"%>
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
                if ((request.getSession().getAttribute("publicaciones-carro") != null) && ( par.size() != 0) )
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
                        String linkQuitar = "QuitarDelCarro?Nombre=" + p.getDpub().getNombre() +"&Cantidad=" + String.valueOf(p.getDd().getCant())
                                              + "&Proveedor=" + p.getDpub().getProveedor();
                        if (p.getDpub() instanceof DataServicioBean)
                        {
                            pos = "Servicio";
                            precio = ((DataServicioBean)p.getDpub()).getPrecio();
                            descr = ((DataServicioBean)p.getDpub()).getDescripcion();
                            link = "VerInfoServicio?Servicio=" + p.getDpub().getNombre() +"&proveedor="+ p.getDpub().getProveedor();
                        }
                        else
                        {
                            pos = "Promoción";
                            link = "VerInfoPromocion?Promocion=" + p.getDpub().getNombre() +"&proveedor="+ p.getDpub().getProveedor();
                            precio = ((DataPromocion)p.getDpub()).getPrecioTotal();
                        }
                        
                        subt = subt + p.getDd().getCant()* precio;

            %>
            <tr class="result"><!--link a servlet ver info publicacion-->
                <td class="col-xs-4" onclick="location.href='<%=link%>'"><h3><%=p.getDpub().getNombre()%></h3>
                    <p><%=descr%></p>
                </td>
              <td><%=pos%></td>
              <td><%= "USD "+String.valueOf(df.format(precio)) %></td>
              <% if (p.getDpub() instanceof DataServicioBean) 
              {
                 %>
              <td>% 0</td>
              <% }
              else{ %>
              <td><%= "% "+ String.valueOf(((DataPromocion)p.getDpub()).getDescuento()) %></td>
              <% } %>
              <td><%= p.getDd().getCant() %></td>
              <td><%= "USD "+String.valueOf(df.format(p.getDd().getCant()* precio)) %></td>
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




 