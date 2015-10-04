<%@page import="com.h4t.modelo.EstadoSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div class="col-xs-1"></div>
<div class="col-xs-4">
    <form class="form-horizontal FormularioLogin" action="Login" method="POST">
            <div class="form-group-sm">
              <label for="Usuario" class="col-sm-2 control-label">Usuario</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="Usuario" name="Usuario" placeholder="eg: e.watson@gmail.com">
              </div>
            </div>
            <div class="form-group-sm">
              <label for="Pass" class="col-sm-2 control-label">Password</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" id="Pass" name="Pass" placeholder="Password">
              </div>
            </div>
        <%  
            if(session.getAttribute("estado_sesion") == EstadoSesion.INVALID_LOGIN)
            {%>
            <span class="invalid_login_message">Usuario ó contraseña incorrecto.</span>
            <%}    
        %>
            <div class="form-group-sm">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary btn-sm">Log in</button>  
                <button type="button" class="btn btn-link" onclick="location.href='registro.jsp'" >Registrarme</button> 
              </div>
            </div>
          </form>
       
</div>
