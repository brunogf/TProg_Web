<%--
    Document   : header
    Created on : 26-sep-2015, 19:46:11
    Author     : Nico
--%>

<%@page import="com.h4t.modelo.EstadoSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="media/css/bootstrap.min.css">
<link rel="stylesheet" href="media/styles.css">
<header>
  <div class='container'>
    <div class="row primeraFila">
      <!--Logo-->
      <div class="logo col-xs-3">
        <h2 class="logoH2">H4T</h2>
      </div>
      <!--Buscador-->
      <div class="col-xs-4">
        <form class="buscador form-inline" action="Search" method="POST">
          <input type='search' name="criterio"  id="criterio" class='form-control input-lg' placeholder='Buscar una publicación...'>
          <button type='submit' class='btn btn-lg btn-default '><span class="glyphicon glyphicon-search"></span></button>
        </form>
      </div>
      <!--Perfil/Login-->
        <%
            if (request.getSession().getAttribute("estado_sesion") != null)
            {
                switch((EstadoSesion)request.getSession().getAttribute("estado_sesion")){
			case LOGGED_IN:%>
                        <jsp:include page="LoggedProfile.jsp"/>
				<%break;
			default:%>
                        <jsp:include page="NotLoggedProfile.jsp"/>
                                <%
		}
            }
            else{%>
            <jsp:include page="NotLoggedProfile.jsp"/>
            <%};
        %>
    </div>
    <div class="row">
        <div class="col-xs-8">
            <button class="btn btn-primary">Info Proveedor</button>
            <button class="btn btn-primary">Info Promoción</button>   
            <button class="btn btn-primary">Info Servicio</button>
        </div>
         <%
            if (request.getSession().getAttribute("estado_sesion") != null)
            {
                switch((EstadoSesion)request.getSession().getAttribute("estado_sesion")){
			case LOGGED_IN:%>
                        <div class="col-xs-4 accion_perfil">
                            <button type='button' class='btn btn-default carro'><span class="glyphicon glyphicon-shopping-cart"></span> Carro de compras</button>
                            <button type="button" name="cerrar_sesion" class="btn btn-link" onclick="location.href ='Logout'">Cerrar Sesión</button>
                        </div>            
                        <%break;
			default:%>
                        
                         <%
		}
            }
            else{%>
            
            <%};
        %>
                        
    </div>
  </div>
</header>
