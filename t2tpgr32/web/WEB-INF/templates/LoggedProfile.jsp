<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="perfil">
  <div class="imagenPerfil">
      <img src="${pageContext.session.getAttribute("Imagen")}" width="200px" alt="Imagen Perfil" />
  </div>
  <div class="nombre">
      <h3>${pageContext.session.getAttribute("Nombre")}<h3>
  </div>
  <div class="accion_perfil">
    <button type="button" name="cerrar_sesion" class="btn btn-link">Cerrar Sesión</button>
    <button type="button" name="ver_perfil" class="btn btn-link">Ver Perfil</button>
  </div>
  <div class="carrito_button">
    <button type='button' class='btn btn-default'><span class="glyphicon glyphicon-shopping-cart"></span> Carro de compras</button>
  </div>


</div>
