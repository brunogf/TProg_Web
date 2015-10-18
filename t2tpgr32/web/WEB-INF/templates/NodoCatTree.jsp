<%-- 
    Document   : NodoCatTree
    Created on : 17/10/2015, 03:46:22 PM
    Author     : spesamosca
--%>

<%@page import="java.util.Set"%>
<%@page import="tpgr32.CatTree"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
                <%
                CatTree raiz = (CatTree)request.getAttribute("categorias");
                if (raiz.tieneHijos())
                {
                    Set<CatTree> cs = raiz.getHijos();
                %>                  
                        <li class = "padre">
                            
                            <%=raiz.nombre()%>
                            
                                          
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
                link = "ListarServiciosDeCategoria?Categoria=" + raiz.nombre();
                %>             
                    <li>
                        <div class ="hoja" onclick="location.href='<%=link%>'">
                        <%=raiz.nombre()%>
                        </div>
                    </li>
                <%}%>
