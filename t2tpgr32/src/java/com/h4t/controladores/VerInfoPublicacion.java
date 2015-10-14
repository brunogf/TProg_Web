/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tpgr32.*;

/**
 *
 * @author spesamosca
 */
@WebServlet(name = "VerInfoPublicacion", urlPatterns = {"/VerInfoPublicacion"})
public class VerInfoPublicacion extends HttpServlet {

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
        FabricaControladores fab = FabricaControladores.getInstancia();
        IControladorPublicacion cp = fab.getControladorPublicacion();     
        IControladorUsuario cu = fab.getControladorUsuario();
        String promocion = (String)request.getParameter("Promocion");
        String proveedor = (String)request.getParameter("proveedor");
        if (promocion != null){
            request.setAttribute("info_promocion", cp.infoPromocion(proveedor, promocion));   
            request.setAttribute("servicios_de_promocion", cp.infoPromocion(proveedor, promocion).getServicios());
            request.getRequestDispatcher("WEB-INF/Publicacion/InfoPromocion.jsp").forward(request, response);
        }
        else{
            String servicio = (String)request.getParameter("Servicio");
            request.setAttribute("info_servicio", cp.infoServicio(proveedor, servicio));
            request.getRequestDispatcher("WEB-INF/Publicacion/InfoServicio.jsp").forward(request, response);
        }
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
