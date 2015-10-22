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
             <div clas="row">
                <span class="titulo_registro">Completa todos los campos:</span>
             </div>
            <div class="row">
                <form class="form-horizontal formulario_registro" action="Registrar" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-xs-8 col-xs-offset-4">
                            <input type="text" class="form-control" name="nick_registro" id="nick_registro" placeholder="Nickname">
                            <span id="nick_warning"><span class="glyphicon glyphicon-warning-sign"></span><p class="msj_error"> Este nick ya está en uso.</p></span>
                        </div>
                        <div class="col-xs-8 col-xs-offset-4">
                            <input type="email" class="form-control" name="email_registro" id="email_registro" placeholder="Correo electronico">
                            <span id="email_warning"><span class="glyphicon glyphicon-warning-sign"></span><p class="msj_error"> Este email ya está en uso.</p></span>
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
                        <div class="col-xs-8 col-xs-offset-4">
                            <input type="password" class="form-control" name="conf_contrasena_registro" id="conf_contrasena_registro" placeholder="Confirmar contraseña">
                            <span id="cont_warning"><span class="glyphicon glyphicon-warning-sign"></span><p class="msj_error"> Las contraseñas no coinciden.</p></span>
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="date" class="form-control" name="fecha_registro" id="fecha_registro" placeholder="yyyy-MM-dd">
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <div class="img_div">
                            <button class="btn btn-default"><!-- this is skinnable -->Imagen de perfil</button>
                            <input type="file" name="file" />
                            </div>
                        </div>
                        <div class="col-xs-4 col-xs-offset-4">
                            <input type="submit"  id="submit_btn_registro" class="btn btn-primary">
                        </div>
                    </div>
                </form>
          </div>
         </div>
         
         <script>
             var arr = {nick : false, email : false};
             function val(){
             if ((($("#nick_registro").val()) === ("")) || (($("#email_registro").val()) === ("")) || (($("#nombre_registro").val()) === ("")) || (($("#apellido_registro").val()) === ("")) || (($("#contrasena_registro").val()) === ("")) || (($("#fecha_registro").val()) === ("")))
                 $("#submit_btn_registro").attr('disabled', 'disabled');
             else if ((arr.nick) || (arr.email))
             {
                 $("#submit_btn_registro").attr('disabled', 'disabled');
             }
             else if(($("#contrasena_registro").val()) !== ($('#conf_contrasena_registro').val()))
             {
                 $("#cont_warning").css('visibility', 'visible');
                 $("#submit_btn_registro").attr('disabled', 'disabled');
            }
             else
             {
                  $("#cont_warning").css('visibility', 'hidden');
                 $("#submit_btn_registro").removeAttr('disabled');
             }
             }
             $(document).ready(function(){
             $("#submit_btn_registro").attr('disabled', 'disabled');
             $("#nick_registro").keyup(function(){
                 $.get("RegistroAjax", {nick : $("#nick_registro").val(), email : $("#email_registro").val()}, function(responseJson) {
                     arr = responseJson;
                     val();
                     if (arr.nick)
                     {
                         $("#nick_registro").css('color', 'red');
                         $("#nick_warning").css('visibility', 'visible');
                         $("#submit_btn_registro").attr('disabled', 'disabled');
                     }
                     else
                     {
                         $("#nick_warning").css('visibility', 'hidden');
                         $("#nick_registro").css('color', 'inherit');
                     }
                     
                 });
             });
             $("#email_registro").keyup(function(){
                 $.get("RegistroAjax", {nick : $("#nick_registro").val(), email : $("#email_registro").val()}, function(responseJson) {
                     arr = responseJson;
                     val();
                     if (arr.email)
                     {
                         $("#email_registro").css('color', 'red');
                          $("#email_warning").css('visibility', 'visible');
                          $("#submit_btn_registro").attr('disabled', 'disabled');
                     }
                      else
                      {
                          $("#email_warning").css('visibility', 'hidden');
                         $("#email_registro").css('color', 'inherit');
                     }
                 });
             });
             
             $("#fecha_registro").keyup(function(){
                 val();
             });
             
             $("#conf_contrasena_registro").focusout(function(){
                 val();
             });
             
             $("#conf_contrasena_registro").keyup(function(){
                 val();
             });
             
             $("#contrasena_registro").keyup(function(){
                 val();
             });
             
             $("#apellido_registro").keyup(function(){
                 val();
             });
             
             $("#nombre_registro").keyup(function(){
                 val();
             });
             });
            
         </script>
         <jsp:include page="WEB-INF/templates/footer.jsp"/>
    </body>
</html>
