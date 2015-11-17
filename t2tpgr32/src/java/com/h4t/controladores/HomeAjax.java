/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.google.gson.Gson;
import com.h4t.servicios.DataPromocion;
import com.h4t.servicios.DataServicio;
import com.h4t.servicios.DataServicioBean;
import com.h4t.servicios.PublicadorControladorPublicacion;
import com.h4t.servicios.PublicadorControladorPublicacionService;
import com.h4t.servicios.PublicadorControladorReserva;
import com.h4t.servicios.PublicadorControladorReservaService;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author NIco
 */
@WebServlet(name = "HomeAjax", urlPatterns = {"/HomeAjax"})
public class HomeAjax extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        String Categoria = request.getParameter("cat");
        String Json = "";
        String srv = "http://";
        Properties config = new Properties();
        try{
            FileInputStream input;
            if(System.getProperty("os.name").toUpperCase().contains("WINDOWS"))
                input = new FileInputStream(System.getProperty("user.home") + "/Documents/server.properties");
            else
                input = new FileInputStream(System.getProperty("user.home") + "/Quick Order/server.properties");
            config.load(input);
            srv = srv + config.getProperty("host") +":"+ config.getProperty("port");
        }catch(Exception e){
            srv = "http://localhost:9128";
        }
        PublicadorControladorPublicacionService servicio = new PublicadorControladorPublicacionService(new URL(srv +"/controlador_publicacion?wsdl"));
        PublicadorControladorPublicacion port = servicio.getPublicadorControladorPublicacionPort();    
        if (tipo.equals("Promocion")){
            List<DataPromocion> ldp = port.listarPromociones().getItem();
            Set<DataPromocion> Promociones = null;  
            if((ldp == null) || (ldp.isEmpty()))
                Promociones = new HashSet<DataPromocion>();
            else
                Promociones = new HashSet<DataPromocion>(ldp);
                    
            Json = new Gson().toJson(Promociones);
        }
        else if (tipo.equals("Servicio")){
            List<DataServicioBean> ldsb = port.listarServiciosDeCategoria(Categoria).getItem();
            Set<DataServicioBean> ServiciosDeCategoria = null;
            if((ldsb == null) || (ldsb.isEmpty()))
                ServiciosDeCategoria = new HashSet<DataServicioBean>();
            else
                ServiciosDeCategoria = new HashSet<DataServicioBean>(ldsb);
            Json = new Gson().toJson(ServiciosDeCategoria);
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(Json);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
