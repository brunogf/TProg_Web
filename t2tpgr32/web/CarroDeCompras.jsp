<%-- 
    Document   : CarroDeCompras
    Created on : 17-oct-2015, 21:30:55
    Author     : piñe
--%>

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
          <div class="row">
            <%--Acá van los resultados--%>
            <%
                Set<ParDPD> par = (HashSet)request.getSession().getAttribute("publicaciones-carro");
                if (request.getSession().getAttribute("publicaciones-carro") != null)
                {%>
                <div class="col-xs-12 table-responsive">
                    <table class="table">
                        <tr class="cabeceraTabla">
                            <td>Nombre</td>
                            <td>Tipo</td>
                            <td>Fecha Inicio</td>
                        </tr>
                <%
                    for(ParDPD p : par)
                    {
                        String pos;
                        String link;
                        pos = "Servicio";
                        link = "VerInfoServicio?servicio=" + p.getDpub_().getNombre() +"&proveedor="+ p.getDpub_().getProveedor();
             

            %>
            <tr class="result" onclick="location.href='<%=link%>'"><!--link a servlet ver info publicacion-->
                <%
                   DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                %>
              <td><%=p.getDpub_().getNombre()%></td>
              <td><%=pos%></td>
              <td><%= df.format(p.getDd_().getFechaIni()) %></td>
            </tr><%
            }%>
                </table></div><%
           }
                else{
            %>
            <div class="col-xs-12 noResult">
                <span class="Message">No hay ninguna publicación agregada al carro</span>
            </div>
            <% } %>
          </div>
          <div class="row">
              <form id="formcomprar" class="formcomprar" action="GenerarReserva" method="post">
                <button type="submit" class="btn btn-primary btn-lg">Comprar</button>
              </form>
          </div>
        </div>
    </body>
</html>