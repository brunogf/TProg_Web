<%-- 
    Document   : NodoCatTree
    Created on : 17/10/2015, 03:46:22 PM
    Author     : spesamosca
--%>

<%@page import="java.util.List"%>
<%@page import="com.h4t.servicios.CatTree"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
                <%
                CatTree raiz = (CatTree)request.getAttribute("categorias");
                if ((raiz.getHijos() != null)&&(raiz.getHijos().size() > 0))
                {
                    List<CatTree> cs = raiz.getHijos();
                %>                  
                        <li class = "padre" id='<%=raiz.nombre() + "_tree"%>'>
                            
                           <%=raiz.getCat()%>
                            
                                          
                            <ul>
                                <%for(CatTree c : cs){
                                    request.setAttribute("categorias", c);
                                %>
                                    <jsp:include page="NodoCatTree.jsp"/>
                                <%}%>
                            </ul>
                         </li>  
                <%}
                else{
                String link;
                //link = "ListarServiciosDeCategoria?Categoria=" + raiz.nombre();
                link = "servicio('" + raiz.getCat()+"')";
                %>             
                    <li>
                        <div class ="hoja" onclick="<%=link%>">
                        <%=raiz.getCat()%>
                        </div>
                    </li>
                <%}%>
