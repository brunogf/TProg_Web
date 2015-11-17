/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.servicios.DataPromocion;
import com.h4t.servicios.DataServicioBean;
import com.h4t.servicios.DataServicioBeanArray;
import com.h4t.servicios.PublicadorControladorPublicacion;
import com.h4t.servicios.PublicadorControladorPublicacionService;
import java.io.FileInputStream;
import java.io.IOException;
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
 * @author spesamosca
 */
@WebServlet(name = "VerInfoPromocion", urlPatterns = {"/VerInfoPromocion"})
public class VerInfoPromocion extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occont_usrrs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        String promocion = (String)request.getParameter("Promocion");
        String proveedor = (String)request.getParameter("proveedor");
        DataPromocion dtp = port.infoPromocion(proveedor, promocion);
        request.setAttribute("info_promocion", dtp);   
        DataServicioBeanArray dtsba = port.listarServiciosDePromocion(dtp.getProveedor(), dtp.getNombre());
        List<DataServicioBean> dtbl = dtsba.getItem();
        Set<DataServicioBean> dtbs = null;
        if((dtbl == null)||(dtbl.isEmpty()))
            dtbs = new HashSet<DataServicioBean>();
        else
            dtbs = new HashSet<DataServicioBean>(dtbl);
            
        request.setAttribute("servicios_de_promocion", dtbs);
        request.getRequestDispatcher("InfoPromocion.jsp").forward(request, response);
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
