<%-- 
    Document   : 500
    Created on : 19-oct-2015, 12:00:33
    Author     : piñe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-language" content="es" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="media/css/bootstrap.min.css">
        <script src="media/js/jquery.min.js"></script>
        <script src="media/js/bootstrap.min.js"></script>
        <title>Error interno en el servidor</title>
    </head>
    <body>
        <p>
        Ocurrió un error al procesar la página. Puedes intentar recargar o 
        <a href="/">volver</a> al inicio.
        </p>
        <div class="main">
            <pre><%= exception.getClass().getName() %>: <%= exception.getMessage() %>
                <% for(StackTraceElement ste: exception.getStackTrace()){ %><%= ste.toString() %>
                <% } %>
            </pre>
        </div>
    </body>
</html>
