<%--
    Document   : Busqueda
    Created on : 30-sep-2015, 19:02:23
    Author     : Nicolás
--%>

<%@page import="com.h4t.modelo.EstadoSesion"%>
<%@page import="tpgr32.DataPromocion"%>
<%@page import="tpgr32.DataServicio"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="tpgr32.DataPublicacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
        <script src="media/js/css-pop.js"></script>
    </head>
    <body>
        <div id="blanket" class="blanket" style="display:none"></div> 
        <div id="popUpDiv" class="popUpDiv" style="display:none">
            <form class="form-horizontal form-carro-search">
                <div class="form-group">
                  <label for="Cantidad" class="col-sm-2 control-label">Cantidad</label>
                  <div class="col-sm-6">
                    <input type="number" class="form-control" id="inputCant" placeholder="">
                  </div>
                </div>
                <div class="form-group">
                  <label for="FechaIni" class="col-sm-2 control-label">Inicio</label>
                  <div class="col-sm-6">
                    <input type="date" class="form-control" id="inputFechaIni" placeholder="">
                  </div>
                </div>
                <div class="form-group">
                  <label for="FechaFin" class="col-sm-2 control-label">Fin</label>
                  <div class="col-sm-6">
                    <input type="date" class="form-control" id="inputFechaFin" placeholder="">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                      <span class="glyphicon glyphicon-remove" onclick="popup('popUpDiv')" ></span>
                      <span class="glyphicon glyphicon-ok" oncliclk="submit"></span></button>
                  </div>
                </div>
              </form>
        </div>
        <jsp:include page="../templates/header.jsp"/>
        <div class="container search">
          <div class="row">
            <%--Acá van los resultados--%>
            <%
                Set<DataPublicacion> publicaciones =(HashSet) request.getAttribute("publicaciones");
                if (!publicaciones.isEmpty())
                {%>
                <div class="col-xs-12 table-responsive">
                    <table class="table">
                        <tr class="cabeceraTabla">
                            <td>Nombre</td>
                            <td>Tipo</td>
                            <td>Proveedor</td>
                            <td>Precio</td>
                            <td></td>
                        </tr>
                <%
                    for(DataPublicacion p : publicaciones)
                    {
                        String pos;
                        float precio;
                        String link;
                        if (p instanceof DataServicio)
                        {
                            pos = "Servicio";
                            precio = ((DataServicio)p).getPrecio();
                            link = "VerInfoServicio?Servicio=" + p.getNombre() +"&proveedor="+ p.getProveedor();
                        }
                        else
                        {
                            pos = "Promoción";
                            link = "VerInfoPromocion?Promocion=" + p.getNombre() +"&proveedor="+ p.getProveedor();
                            precio = ((DataPromocion)p).getPrecioTotal();
                        }
            %>
            <tr class="result" onclick="location.href='<%=link%>'"><!--link a servlet ver info publicacion-->
              <td><%=p.getNombre()%></td>
              <td><%=pos%></td>
              <td><%=p.getProveedor()%></td>
              <td><%=("$" + String.format("%.2f", precio))%></td>
              <%if(session.getAttribute("estado_sesion") == EstadoSesion.LOGGED_IN){ %>
              <td class="icono-carro"><span onclick="popup('popUpDiv')" class="glyphicon glyphicon-shopping-cart"></span></td>
              <%}%>
              </tr><%
            }%>
                </table></div><%
           }
                else{
            %>
            <div class="col-xs-12 noResult">
                <span class="Message">No se encontró ninguna publicación</span>
            </div>
            <%}%>
          </div>
        </div>
    </body>
</html>
