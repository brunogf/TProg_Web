<%-- 
    Document   : registro
    Created on : 29/09/2015, 02:48:58 PM
    Author     : Bruno González
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=1.0">
        <link rel="stylesheet" href="media/css/bootstrap.min.css">
        <title>Registrar Usuario</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        
        <registro>
            <form class="form-inline" action="Registrar" method="POST">
                
                <%--AJAX--%>
                <div class="form-group">
                    <label for="Nick">Nick: </label>
                    <input type="text" class="form-control" name="nick" id="Nick" placeholder="NickName">
                </div>
                <br />                
                <div class="form-group">
                    <label for="Email">Correo Electrónico: </label>
                    <input type="email" class="form-control" name="email" id="Email" placeholder="E-mail">
                </div>
                <br />
                <%--AJAX--%>
                
                <div class="form-group">
                    <label for="Nombre">Nombre: </label>
                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre">
                </div>
                <br />
                <div class="form-group">
                    <label for="Apellido">Apellido: </label>
                    <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Apellido">
                </div>
                <br />
                
                <%--AJAX--%>
                <div class="form-group">
                    <label for="Contraseña">Contraseña: </label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Contraseña">
                </div>
                <br />
                <div class="form-group">
                    <label for="ConfirmarContraseña">Confirmar contraseña: </label>
                    <input type="password" class="form-control" name="confpassword" id="confpassword" placeholder="Confirmar">
                </div>
                <br />
                <%--AJAX--%>
                
                <div class="form-group">
                    <label for="Imagen">Imagen: </label>
<!--                    <form method="post" action="${ pageContext.request.contextPath}/Uploader" encType="multipart/form-data">
                        <input type="file" name="file" value="select images..."/>
                        <input type="submit" value="start upload"/>
                    </form>-->
                </div>
                <br />
                <div class="form-group">
                    <label for="fechanac">Fecha de nacimiento: </label>
                    <input type="date" class="form-control" name="fechanac" id="fechanac" placeholder="dd/mm/yy">
                </div>
                <br />
                <input type="submit" class="subbut" value="Registrar">
            </form>
        </registro>
    </body>
</html>
