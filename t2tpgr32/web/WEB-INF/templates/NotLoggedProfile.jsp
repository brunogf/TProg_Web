<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div class="col-xs-5">
    
        <form class="form-inline FormularioLogin" action="Login" method="POST">
        <div class="form-group">
          <label for="Usuario">Usuario</label>
          <input type="text" class="form-control" name="Usuario" id="Usuario" placeholder="e.watson@gmail.com">
        </div>
        <div class="form-group">
          <label for="Pass">Contraseña</label>
          <input type="password" class="form-control" name="Pass" id="Pass" placeholder="Ingresa tu contraseña...">
        </div>
        <br>
        <button type="submit" class="btn btn-primary loginbtn">Log In</button>
        <select name="opciones" class="form-control notLoggedOpciones">
            <option value="registrar" onclick="location.href ='registro.jsp'">Registrar</option>
        </select>
        
        </form>
       
</div>
