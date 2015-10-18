<%-- 
    Document   : registro
    Created on : 29/09/2015, 02:48:58 PM
    Author     : Bruno González
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
        <script src="media/js/bootstrap-filestyle.min.js"></script>
    </head>
    <body>
       <jsp:include page="WEB-INF/templates/header.jsp"/>
         <div class="container registro">
             <div clas="row">
                <span class="titulo_registro">Ingresa tus datos:</span>
             </div>
            <div class="row">
                <form class="form-horizontal formulario_registro" action="Registrar" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="text" class="form-control" name="nick_registro" id="nick_registro" placeholder="Nickname">
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="email" class="form-control" name="email_registro" id="email_registro" placeholder="Correo electronico">
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="text" class="form-control" name="nombre_registro" id="nombre_registro" placeholder="Nombre">
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="text" class="form-control" name="apellido_registro" id="apellido_registro" placeholder="Apellido">
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="password" class="form-control" name="contrasena_registro" id="contrasena_registro" placeholder="Contraseña">
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="password" class="form-control" name="conf_contrasena_registro" id="conf_contrasena_registro" placeholder="Confirmar contraseña">
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="date" class="form-control" name="fecha_registro" id="fecha_registro" placeholder="dd/MM/yyyy">
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <div class="img_div">
                            <button class="btn btn-default"><!-- this is skinnable -->Imagen de perfil</button>
                            <input type="file" name="file" />
                            </div>
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="submit" class="btn btn-primary">
                        </div>
                    </div>
                </form>
          </div>
         </div>
    </body>
</html>
