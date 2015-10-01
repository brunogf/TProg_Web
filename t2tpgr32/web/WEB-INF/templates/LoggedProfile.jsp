<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-xs-1">
  <!--Por ahora vacia-->
</div>
<div class="imagenPerfil col-xs-1">
    <a href="Perfil" target="_self">
    <img src="${pageContext.session.getAttribute("Imagen")}" width="100px" height="100px" alt="Imagen Perfil"></a>
</div>
<div class="col-xs-3 datosPerfil">
  <div class="nombre">
      <h3>${pageContext.session.getAttribute("Nombre")}<h3>
  </div>
  <div class="accion_perfil">

    <button type='button' class='btn btn-default carro'><span class="glyphicon glyphicon-shopping-cart"></span>Carro</button>
    <select name="opciones" class="form-control">
              <option value="perfil" onclick="location.href ='Perfil'">Mi Perfil</option>
      </select>
    <button type="button" name="cerrar_sesion" class="btn btn-link" onclick="location.href ='Logout'">Cerrar Sesión</button>
  </div>
  <div>      
      
  </div>
</div>
