<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-xs-1">
  <!--Por ahora vacia-->
</div>
<div class="col-xs-4 datosPerfil">
    <a href="Perfil" target="_self">
    <div class="imagenPerfil">
        
        <img src="${pageContext.session.getAttribute("Imagen")}" width="50px" height="50px" alt="Imagen Perfil" class="img-thumbnail">
    </div>
  <div class="nombre">
      <h3>${pageContext.session.getAttribute("Nombre")}<h3>
  </div></a>
</div>
