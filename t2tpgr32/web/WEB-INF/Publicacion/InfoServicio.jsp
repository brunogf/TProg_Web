<%-- 
    Document   : InfoServicio
    Created on : 14/10/2015, 02:26:01 PM
    Author     : spesamosca
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.h4t.modelo.EstadoSesion"%>
<%@page import="tpgr32.DataServicio"%>
<%@page import="tpgr32.DataPromocion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp"/>
        <div class="container"> 
            <%DataServicio info_servicio = (DataServicio) request.getAttribute("info_servicio");%>
            <h3><%=info_servicio.getNombre()%></h3>
                <br/>
                <label>Descripción:</label>
                <p><%=info_servicio.getDescripcion()%></p>
                <br/>
                <br/>
                <label>Precio:</label>
                <label><%=info_servicio.getPrecio()%></label>
                <br/>
                <label>Origen:</label>
                <label><%= info_servicio.getCiudadOrigen()%></label>
                <br/>
                <label>Destino:</label>
                <label><%= info_servicio.getCiudadDestino()%></label>
                <br/>
                <label>Proveedor:</label>
                <label><%=info_servicio.getProveedor()%></label>
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
                            String link = "AgregarAlCarro?publicacion=" + info_servicio.getNombre() + "&proveedor=" +info_servicio.getProveedor(); 
                       %>
                        <form id="submit_form" action= "<%=link%>" method="post">
		           <label for="cantidad">Cantidad de reservas:</label>
		           <input type="number" id="cantidad" name="cantidad" value="1"/>
                          <%-- <span id="error_cantidadnon" class="error">Debes ingresar una cantidad correcta</span> --%>
		           <br/>
		           <label for="fechaini">Fecha de inicio:</label>
		           <input type="date" id="fechaini" name="fechaini"/>
		           <%-- <span id="error_fechaini" class="error">Debes ingresar fecha posterior a la actual</span> --%>
		           <br/>
                           <label for="fechafin">Fecha de fin:</label>
                           <input  type="date" id="fechafin" name="fechafin"/> >
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
