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
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <% DataServicio info = (DataServicio)request.getAttribute("info_servicio"); 
           String imagen0 = (String)request.getAttribute("imagen0");
           String imagen1 = (String)request.getAttribute("imagen1");
           String imagen2 = (String)request.getAttribute("imagen2");
        %>
        <div class = "container InfoServicio">
            <div class="row">    
                <div class="col-xs-4">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
     <% if (imagen0 != null)
     { %>
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <% }
     if (imagen1 != null)
     { %>
    <li data-target="#myCarousel" data-slide-to="1"></li>
     <% }
     if (imagen2 != null)
     { %> 
    <li data-target="#myCarousel" data-slide-to="2"></li>
     <% } %>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
       <% if (imagen0 != null)
     { %>
    <div class="item active">
      <a href='<%=imagen0%>' >
         <img src="<%=imagen0%>" width="400" height="600" >
      </a>
    </div>
     <% }
       if (imagen1 != null)
     { %>
    <div class="item">
        <a href='<%=imagen1%>' >
      <img src="<%=imagen1%>" width="400" height="600" >
        </a>
    </div>
     <% }
       if (imagen2 != null)
     { %>
    <div class="item">
        <a href='<%=imagen2%>' >
      <img src="<%=imagen2%>" width="400" height="600" >
        </a>
    </div>
    <% } %>
  </div>
 

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
                </div>
                <div class="col-xs-8">
                  <h3><%=info.getNombre()%></h3>
                  <br/>
                   <p><%=info.getDescripcion()%></p>
                   <br/>
                   <br/>
                   <p class="precio"><%="USD "+String.valueOf(info.getPrecio()) %></p>
                <br/>
                </div>
            </div>
                <br/>
                <div class ="row">
                    <div class ="col-xs-4 table-responsive">
                        <table class ="table">
                          <tr class ="active">
                          <td class="tablaInfoServ">Proveedor:</td>
                          <td class="result">
                              <%=info.getProveedor() %>
                          </td>
                          </tr>
                          <tr class = "success">
                          <td class="tablaInfoServ">Origen:</td>
                          <td class="result">
                              <%=info.getCiudadOrigen() %>
                          </td>
                          </tr>
                          <tr class="active">
                          <td class="tablaInfoServ">Destino:</td>
                          <td class="result">
                              <%=info.getCiudadDestino() %>
                          </td>
                          </tr>
                          <tr class= "success">
                          <td class="tablaInfoServ">Precio:</td>
                          <td class="result">
                              <%="USD "+String.valueOf(info.getPrecio()) %>
                          </td>
                          </tr>
                          <tr class= "active">
                          <td class="tablaInfoServ">Categorias:</td>
                          <td class="result">
                              <% 
                                boolean flag = false;
                                String s = "";
                                for (String c : info.getCategorias())
                                { if(flag){
                                    s = s +", " + c;
                                } else s = s + c;
                                flag = true;}
                              %>
                                <%=s%>
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
                            String link = "AgregarAlCarro?servicio=" + info.getNombre() + "&proveedor=" +info.getProveedor(); 
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
                </div>
                             
      </div>
                <jsp:include page="WEB-INF/templates/footer.jsp"/>
    </body>
</html>
