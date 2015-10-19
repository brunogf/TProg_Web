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
        
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
        <div class="container search">
          <div class="row">
            <%--Acá van los resultados--%>
            <%
                Set<DataPublicacion> publicaciones =(HashSet) request.getAttribute("publicaciones");
                if (!publicaciones.isEmpty())
                {%>
                <div class="col-xs-12 table-responsive">
                    <table class="table tablesorter" id="resultados_busqueda">
                        <thead>
                        <tr class="cabeceraTabla">
                            <th>Nombre <span class="glyphicon glyphicon-sort"></span></th>
                            <th>Tipo <span class="glyphicon glyphicon-sort"></span></th>
                            <th>Proveedor <span class="glyphicon glyphicon-sort"></span></th>
                            <th>Precio <span class="glyphicon glyphicon-sort"></span></th>
                            <th></th>
                        </tr>
                        </thead>
                         <tbody>
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
            </tbody> </table></div><%
           }
                else{
            %>
            <div class="col-xs-12 noResult">
                <span class="Message">No se encontró ninguna publicación</span>
            </div>
            <%}%>
          </div>
        </div>
          <script src="media/js/jquery.tablesorter.min.js"></script>
          <script>
              $(document).ready(function() 
                { 
                    $("#resultados_busqueda").tablesorter(); 
                } 
            ); 
        </script>
        <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>
