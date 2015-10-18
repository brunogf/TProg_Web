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
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <div class="container registro">
            <section id="formulario">
                <p id="titulo">Ingresa tus datos</p>
                <form action="Registrar" method="POST">

                    <%--AJAX--%>
                    <input type="text" class="form-control" name="nick" id="Nick" placeholder="NickName">
                    <input type="email" class="form-control" name="email" id="Email" placeholder="Correo Electronico">
                    <%--AJAX--%>
                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre">
                    <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Apellido">
                    <%--AJAX--%>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Contraseña">
                    <input type="password" class="form-control" name="confpassword" id="confpassword" placeholder="Confirmar contraseña">
                    <%--AJAX--%>

                    <%--IMAGEN--%>
    <!--                    <form method="post" action="${ pageContext.request.contextPath}/Uploader" encType="multipart/form-data">
                            <input type="file" name="file" value="select images..."/>
                            <input type="submit" value="start upload"/>
                        </form>-->
                    <input type="date" class="form-control" name="fechanac" id="fechanac" placeholder="Fecha de Nacimiento (dd-mm-yy)">
                    <input type="submit" class="btn btn-primary" value="Enviar">
                </form>
            </section>
        </div>
    </body>
</html>
