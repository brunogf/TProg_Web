<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-xs-1">
  <!--Por ahora vacia-->
</div>
<div class="imagenPerfil col-xs-1">
    <img src="${pageContext.session.getAttribute("Imagen")}" width="200px" alt="Imagen Perfil" />
</div>
<div class="col-xs-3 datosPerfil">
  <div class="nombre">
      <h3>${pageContext.session.getAttribute("Nombre")}<h3>
  </div>
  <div class="accion_perfil">
    <button type='button' class='btn btn-default carro'><span class="glyphicon glyphicon-shopping-cart"></span>Carro</button>
    <button type="button" name="ver_perfil" class="btn btn-link" onclick="location.href ='Perfil'">Ver Perfil</button>
    <button type="button" name="cerrar_sesion" class="btn btn-link" onclick="location.href ='Logout'">Cerrar Sesión</button>
  </div>
</div>
