<%-- 
    Document   : InfoServicio
    Created on : 06-oct-2015, 10:59:26
    Author     : piñe
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.h4t.modelo.EstadoSesion"%>
<%@page import="tpgr32.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
        <title>jQuery UI Datepicker - Default functionality</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <% DataServicio info = (DataServicio)request.getAttribute("info_servicio"); %>
        <div class = "container InfoServicio">
            <div class="row">    
                <div class="col-xs-4">
                    <p>  IMAGENES </p>
                </div>
                <div class="col-xs-8">
                  <h3><%=info.getNombre()%></h3>
                  <br/>
                   <p><%=info.getDescripcion()%></p>
                <br/>
                </div>
            </div>
                <br/>
                <div class ="row">
                    <div class ="col-xs-4 table-responsive">
                        <table class ="table">
                          <tr class ="active">
                          <td>Proveedor:</td>
                          <td class="result">
                              <%=info.getProveedor() %>
                          </td>
                          </tr>
                          <tr class = "success">
                          <td>Origen:</td>
                          <td class="result">
                              <%=info.getCiudadOrigen() %>
                          </td>
                          </tr>
                          <tr class="active">
                          <td>Destino:</td>
                          <td class="result">
                              <%=info.getCiudadDestino() %>
                          </td>
                          </tr>
                          <tr class= "success">
                          <td>Precio:</td>
                          <td class="result">
                              <%=info.getPrecio() %>
                          </td>
                          </tr>
                        </table>
                    </div>
                          <div class ="col-xs-8">
                              <%
            if (request.getSession().getAttribute("estado_sesion") != null)
            {
                switch((EstadoSesion)request.getSession().getAttribute("estado_sesion")){
			case LOGGED_IN:{%>
                        <script type="text/javascript">
		      <%--   function validate()
		           {
			     var correct = true;
		
			     var cantidad = $('#cantidad').val().toString();
                        
                             if(!/^([0-9])*$/.test(cantidad)){
			       $('#error_cantidadnon').show();
		               correct = false;
                             }
                             else
                              $('#error_cantidadnon').hide();
			
                            
                            var fechaini = $('#fechaini').val().toString();
			    
                            if(fechaini === '') {
				$('#error_fechaini').show();
				correct = false;
			    } else
				$('#error_fechaini').hide();
                            
                            var fechafin = $('#fechafin').val().toString();
			    
                            if(fechafin === '') {
				$('#error_fechafin').show();
				correct = false;
			    } else
				$('#error_fechafin').hide();
		
			    return correct;
		           } --%>
	               </script>
                       <% 
                            String link = "AgregarAlCarro?publicacion=" + info.getNombre() + "&proveedor=" +info.getProveedor(); 
                       %>
                        <form class="form-horizontal" id="submit_form" action= "<%=link%>" method="post">
                            <div class ="form-group">
		           <label for="cantidad" class="col-xs-3">Cantidad de reservas:</label>
		           <input type="number" id="cantidad" class="col-xs-4" name="cantidad" value="1"/>
                          <%-- <span id="error_cantidadnon" class="error">Debes ingresar una cantidad correcta</span> --%>
                            </div>
                            <div class ="form-group">
		           <label for="fechaini" class="col-xs-3">Fecha de inicio:</label>
		           <input type="date" id="fechaini" class="col-xs-4" name="fechaini"/>
                            </div>
		           <%-- <span id="error_fechaini" class="error">Debes ingresar fecha posterior a la actual</span> --%>
		           <div class ="form-group">
                           <label for="fechafin" class="col-xs-3">Fecha de fin:</label>
                           <input  type="date" id="fechafin" class="col-xs-4" name="fechafin"/> 
                           </div>
                           <div class ="form-group"> 
		         <button type='submit' class='btn btn-default carro'><span class="glyphicon glyphicon-shopping-cart col-xs-3"></span>Agregar al Carro</button>
                           </div>
	               </form>

                                    
                        <%}
                        break; 

                        default:{%>
                         <p>Debe <a href="index.jsp">Iniciar sesión</a> o <a href="registro.jsp"> Registrase</a>
                            para agregar al Carro de Compras</p>
                        <%}
                            
		}
            }
            else{%>
            <p>Debe <a href="index.jsp">Iniciar sesión</a> o <a href="registro.jsp"> Registrase</a>
                para agregar al Carro de Compras</p>
           
            <%};
        %>   
                          </div>
                </div>
                             
      </div>
                
    </body>
</html>
