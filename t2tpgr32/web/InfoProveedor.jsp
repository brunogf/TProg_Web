<%-- 
    Document   : InfoProveedor
    Created on : 16/10/2015, 09:17:12 PM
    Author     : spesamosca
--%>

<%@page import="tpgr32.DataServicio"%>
<%@page import="java.util.HashSet"%>
<%@page import="tpgr32.DataPublicacion"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Set"%>
<%@page import="tpgr32.DataProveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <div class="container InfoProveedor"> 
              <% 
                 DataProveedor info_proveedor = (DataProveedor) request.getAttribute("info_proveedor");
                 Set<DataPublicacion> publicaciones_de_proveedor =(HashSet) request.getAttribute("publicaciones_de_proveedor");                 
              %>
                    <h3>Información del proveedor</h3>
                        <br/>
                        <label>Nickname:</label><%=info_proveedor.getNickname()%>
                        <br/>
                        <label>Nombre:</label><%=info_proveedor.getNombre()%>
                        <br/>
                        <label>Empresa:</label><%=info_proveedor.getEmpresa()%>
                        <br/>  
                            <%  
                                String imagen = "media/Images/";
                                
                                imagen = imagen + info_proveedor.getNickname().toLowerCase() + ".jpg";
                            %>   
                            <img src="<%=imagen%>" width="150px" height="150px" alt="Imagen Perfil" onError="this.onerror=null;this.src='media/Images/perfil.jpg';" class="img-thumbnail"> 
                        <br/>
                        <h4>Publicaciones</h4>                        
                        
                                <div class="col-xs-6 table-responsive">
                                <table class="table">
                                        <tr class="cabeceraTabla">
                                            <td>Nombre</td>
                                            <td>Tipo</td>
                                        </tr>    
                                <%    
                                    String link;
                                    String pos;
                                    for(DataPublicacion p : publicaciones_de_proveedor)
                                    { 
                                        if (p instanceof DataServicio){
                                            link = "VerInfoServicio?Servicio=" + p.getNombre() +"&proveedor="+ p.getProveedor();
                                            pos = "Servicio";
                                        }
                                        else{
                                            link = "VerInfoPromocion?Promocion=" + p.getNombre() +"&proveedor="+ p.getProveedor();
                                            pos = "Promocion";
                                        }%>
                                        <tr class="result" onclick="location.href='<%=link%>'">
                                            <td><%=p.getNombre()%></td>
                                            <td><%=pos%></td>
                                        </tr>
                                    <%}%>
                                </table>
                               </div>                          
                        
        </div>
                                <jsp:include page="WEB-INF/templates/footer.jsp"/>
    </body>
</html>
