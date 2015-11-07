<%-- 
    Document   : InfoPromocion
    Created on : 15/10/2015, 06:43:02 PM
    Author     : spesamosca
--%>

<%@page import="com.h4t.servicios.DataPromocion"%>
<%@page import="com.h4t.servicios.DataServicioBean"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.h4t.modelo.EstadoSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <div class="container InfoPromocion"> 
              <% 
                 DataPromocion info_promocion = (DataPromocion) request.getAttribute("info_promocion");
                 Set<DataServicioBean> servicios_de_promocion =(HashSet) request.getAttribute("servicios_de_promocion");                 
              %>
                    <h3>Información de la promoción</h3>
                        <br/>
                        <label>Nombre:</label><%=info_promocion.getNombre()%>
                        <br/>
                        <label>Proveedor:</label><%=info_promocion.getProveedor()%>
                        <br/>
                        <label>Descuento:</label><%=info_promocion.getDescuento()%>
                        <br/>
                        <label>Precio Total:</label><%=info_promocion.getPrecioTotal()%>
                        <br/>
                        <h4>Servicios asociados</h4>                        
                        <div class="container serviciosDePromocion"> 
                            <div class="row">
                                <div class="col-xs-6 table-responsive">
                                <table class="table">
                                        <tr class="cabeceraTabla">
                                            <td>Nombre</td>
                                            <td>Proveedor</td>
                                        </tr>    
                                <%    
                                    String link;                                   
                                    for(DataServicioBean s : servicios_de_promocion)
                                    { 
                                        link = "VerInfoServicio?Servicio=" + s.getNombre() +"&proveedor="+ s.getProveedor();%>
                                        <tr class="result" onclick="location.href='<%=link%>'">
                                            <td><%=s.getNombre()%></td>
                                            <td><%=s.getProveedor()%></td>
                                        </tr>
                                    <%}%>
                                </table></div>
                            </div>
                        </div> 
                        <%-- DESDE ACA --%>        
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
                            link = "AgregarAlCarro?promocion=" + info_promocion.getNombre() + "&proveedor=" +info_promocion.getProveedor(); 
                       %>
                        <form class="form-horizontal" id="submit_form" action= "<%=link%>" method="post">
                            <div class ="form-group">
		           <label for="cantidad" class="col-xs-3">Cantidad de reservas:</label>
		           <input type="number" id="cantidad" class="col-xs-1" name="cantidad" value="1"/>
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
                                
                        <%-- HASTA ACA --%>        
                    </div>
                    <jsp:include page="WEB-INF/templates/footer.jsp"/>
    </body>
</html>
