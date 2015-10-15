<%-- 
    Document   : pruebacarro
    Created on : 09-oct-2015, 14:45:11
    Author     : piñe
--%>

<%@page import="tpgr32.DataServicio"%>
<%@page import="tpgr32.DataPublicacion"%>
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
        <h1>Hello World!</h1>
        
         <div class="container search">
          <div class="row">
            <%--Acá van los resultados--%>
            <%
                Set<ParDPD> par = (HashSet)request.getSession().getAttribute("publicaciones-carro");
                if (!par.isEmpty())
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
                        if (p.getDpub_() instanceof DataServicio){
                            pos = "Servicio";
                            link = "VerInfoServicio?Servicio=" + p.getDpub_().getNombre() +"&proveedor="+ p.getDpub_().getProveedor();
                        }
                        else{
                            pos = "Promocion";
                            link = "VerInfoPromocion?Promocion=" + p.getDpub_().getNombre() +"&proveedor="+ p.getDpub_().getProveedor();
                        }

            %>
            <tr class="result" onclick="location.href='<%=link%>'"><!--link a servlet ver info publicacion-->
                <%
                   DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                %>
              <td><%=p.getDpub_().getNombre()%></td>
              <td><%=pos%></td>
              <td><%= p.getDd_().getFechaIni().toString()%></td>
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
