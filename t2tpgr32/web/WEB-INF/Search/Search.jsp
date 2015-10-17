<%--
    Document   : Busqueda
    Created on : 30-sep-2015, 19:02:23
    Author     : Nicolás
--%>

<%@page import="tpgr32.ParDPD"%>
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
            <form class="form-horizontal form-carro-search" action="VerReservas"  id="form_carro_search" method="GET">
                <div class="form-group">
                    <label for="inputCant" class="col-sm-5 control-label">Cantidad</label>
                    <div class="col-sm-3">
                    <input type="number" class="form-control" id="inputCant" placeholder="">
                    </div>
                </div>
                <button type="submit">Submit</button>
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
            <tr class="result" ><!--link a servlet ver info publicacion-->
              <td onclick="location.href='<%=link%>'"><%=p.getNombre()%></td>
              <td onclick="location.href='<%=link%>'"><%=pos%></td>
              <td><%=p.getProveedor()%></td>
              <td onclick="location.href='<%=link%>'"><%=("$" + String.format("%.2f", precio))%></td>
              <%if(session.getAttribute("estado_sesion") == EstadoSesion.LOGGED_IN){
              boolean e = false;
              if(session.getAttribute("publicaciones-carro") != null)
                      for(ParDPD dpd : (Set<ParDPD>)session.getAttribute("publicaciones-carro"))
                      {
                          if(p.getNombre().toUpperCase().equals(dpd.getDpub_().getNombre().toUpperCase())){
                              e = true;
                        }
                      }
              if(!e){
                  String nombre = p.getNombre();
                  String prov = p.getProveedor();
              %>
              <td class="icono-carro"><%--<span onclick="setPub('<%out.print(nombre);%>','<%out.print(prov);%>');popup('popUpDiv')" class="glyphicon glyphicon-shopping-cart"></span>--%></td>
              <%
              }else{%>
              <td class="icono-ok"><span onclick="location.href='<%=link%>'" class="glyphicon glyphicon-ok"></span></td>    
              <%}

              }%>
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
          <script>
              function setPub(nombre, proveedor){
                  var link = "AgregarAlCarro?servicio=";
                  link.concat(nombre);
                  link.concat("&proveedor=");
                  link.concat(proveedor);
                  var element = document.getElementById("form_carro_search");
                  element.action = link;
                 }
        </script>
    </body>
</html>
