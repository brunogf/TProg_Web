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
        <script>
           $(function() {
           $( "#fechaini" ).datepicker();
           });
            $(function() {
           $( "#fechafin" ).datepicker();
           });
        </script>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <% DataServicio info = (DataServicio)request.getAttribute("info_servicio"); %>
        <div class = "container">
                <h3><%=info.getNombre()%></h3>
                <br/>
                <label>Descripción:</label>
                <p><%=info.getDescripcion()%></p>
                <br/>
                <br/>
                <label>Precio:</label>
                <label><%=info.getPrecio()%></label>
                <br/>
                <label>Origen:</label>
                <label><%= info.getCiudadOrigen()%></label>
                <br/>
                <label>Destino:</label>
                <label><%= info.getCiudadDestino()%></label>
                <br/>
                <label>Proveedor:</label>
                <label><%=info.getProveedor()%></label>
                <br/>
                <br/>
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
                        <form id="submit_form" action= "<%=link%>" method="post">
		           <label for="cantidad">Cantidad de reservas:</label>
		           <input type="number" id="cantidad" name="cantidad" value="1"/>
                          <%-- <span id="error_cantidadnon" class="error">Debes ingresar una cantidad correcta</span> --%>
		           <br/>
		           <label for="fechaini">Fecha de inicio:</label>
		           <input type="text" id="fechaini" name="fechaini"/>
		           <%-- <span id="error_fechaini" class="error">Debes ingresar fecha posterior a la actual</span> --%>
		           <br/>
                           <label for="fechafin">Fecha de fin:</label>
                           <input type="text" id="fechafin" name="fechafin"/>
                           <%-- <span id="error_fechafin" class="error">Debes ingresar fecha posterior a la de inicio</span> --%>
		           <br/>
                           <%
                            
                            %>
		         <button type='submit' class='btn btn-default carro'><span class="glyphicon glyphicon-shopping-cart"></span>Agregar al Carro</button>
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
                
    </body>
</html>
