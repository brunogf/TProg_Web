<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="perfil">
  <div class="imagenPerfil">
    <img src="media/Images/perfil.jpg" width="50" alt="Imagen Perfil" />
  </div>
  <div class="nombre">
      <h3>${pageContext.session.getAttribute("Nombre")}<h3>
  </div>
  <div class="accion_perfil">
    <button type='button' class='btn btn-default '>Carrito de compras</button>
    <button type="button" name="cerrar_sesion" class="btn btn-link">Cerrar Sesión</button>
  </div>
</div>
