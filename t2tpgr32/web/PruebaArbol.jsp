<%-- 
    Document   : PruebaArbol
    Created on : 15-oct-2015, 21:11:20
    Author     : piñe
--%>

<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="tpgr32.*"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="WEB-INF/templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="WEB-INF/templates/header.jsp"/>
        <h1>Hello World!</h1>
        <div class="container">
            <div class="row">
              <select class="col-md-1" name="Dia">
                <option value="1" selected>Dia</option>
                <% for(int i = 1; i <= 31 ; i++){
                %>  
                   <option value="<%=i%>"><%=String.valueOf(i)%></option>
                 <%} 
             
                %>
             
              </select>
               <select class="col-md-1" name="Mes">
                <option value="1" selected>Mes</option>
                <% for(int i = 1; i <= 12 ; i++){
                %>  
                   <option value="<%=i%>"><%=String.valueOf(i)%></option>
                 <%} 
             
                %>
                 
              </select> 
                <select class="col-md-2" name="Ano">
                <option value="2015" selected>Año</option>
                <% for(int i = 2015; i <= 2020 ; i++){
                %>  
                   <option value="<%=i%>"><%=String.valueOf(i)%></option>
                 <%} 
             
                %>
                 
              </select> 
            </div>
        </div>
    </body>
</html>
