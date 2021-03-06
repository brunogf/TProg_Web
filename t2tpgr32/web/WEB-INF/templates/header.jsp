<%--
    Document   : header
    Created on : 26-sep-2015, 19:46:11
    Author     : Nico
--%>

<%@page import="com.h4t.modelo.EstadoSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="media/css/bootstrap.min.css">
<link rel="stylesheet" href="media/styles.css">
<script src="media/js/jquery.min.js"></script>
<script src="media/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="media/js/jquery-ui/themes/cupertino/jquery-ui.min.css">
<script src="media/js/jquery-ui/jquery-ui.min.js"></script>
<script src="media/js/Search.js"></script>
<header>
  <div class='container'>
    <div class="row primeraFila">
      <!--Logo-->
      <div class="logo col-xs-3">
          <a class="linklogo" href="/t2tpgr32"><h2 class="logoH2">H4T</h2></a>
      </div>
      <!--Buscador-->
      <div class="col-xs-4">
        <form id="form-busqueda" class="buscador form-inline" action="Search" method="GET" autocomplete="off">
          <input autocomplete="off" type='search' name="criterio"  id="criterio" class='form-control input-lg' placeholder='Buscar una publicación...'>
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
            <button class="btn btn-sm btn-primary" onclick="location.href = 'Home'">Home</button>
            <button class="btn btn-sm btn-primary" onclick="location.href = 'ListarProveedores'">Proveedores</button>
            <button type="button" class="btn btn-sm btn-primary" onclick="location.href = 'ListarPromociones'">Promociones</button>   
            <button class="btn btn-sm btn-primary" onclick="location.href = 'ListarServicios'">Servicios</button>
        </div>
         <%
            if (request.getSession().getAttribute("estado_sesion") != null)
            {
                switch((EstadoSesion)request.getSession().getAttribute("estado_sesion")){
			case LOGGED_IN:{
                           String offset = ""; 
                        
          if(((String)request.getSession().getAttribute("TipoUsuario")).equals("cliente")){ %>
                        <div class="col-xs-4 accion_perfil">
                            <button type='button' class='btn btn-default carro' onclick="location.href='CarroDeCompras.jsp'"><span class="glyphicon glyphicon-shopping-cart"></span> Carro de compras</button>
                            <button type="button"  class="btn btn-sm btn-primary" onclick="location.href ='MisReservas'">Mis Reservas</button><%}
                                else{offset = " col-xs-offset-2";}    %>
                            <button type="button" name="cerrar_sesion" class="btn btn-sm btn-link<%=offset%>" onclick="location.href ='Logout'">Cerrar Sesión</button>
                        </div>            
                        <%}break;
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
