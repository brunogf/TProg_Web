<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-xs-1">
  <!--Por ahora vacia-->
</div>
<div class="col-xs-4 datosPerfil">
    <a href="Perfil" target="_self">
    <div class="imagenPerfil">
        <%
            String imagen = "media/Images/";
            imagen = imagen + ((String)request.getSession().getAttribute("Usuario")).toLowerCase() + ".jpg";
        %>
        <img src="<%=imagen%>" width="50px" height="50px" alt="Imagen Perfil" onError="this.onerror=null;this.src='media/Images/perfil.jpg';" class="img-thumbnail"> 
   </div>
  <div class="nombre">
      <h3>${pageContext.session.getAttribute("Nombre")}<h3>
  </div></a>
</div>
