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
    <div class="row">
      <!--Logo-->
      <div class="logo col-xs-12 col-md-3">
        <h2 class="logoH2">H4T</h2>
      </div>
      <!--Buscador-->
      <div class="col-xs-12 col-sm-4 col-md-4">
        <form class="buscador form-inline" action="" method="">
          <input type='search' class='form-control input-lg' placeholder='Buscar una publicación...' id="criterio">
          <button type='submit' class='btn btn-lg btn-default '>Buscar</button>
        </form>
      </div>
      <!--Perfil/Login-->
      <div class="col-xs-12 col-md-5">
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

    </div>
  </div>
</header>
