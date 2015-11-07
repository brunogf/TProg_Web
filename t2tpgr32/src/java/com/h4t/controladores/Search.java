/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.servicios.DataPublicacion;
import com.h4t.servicios.PublicadorControladorPublicacion;
import com.h4t.servicios.PublicadorControladorPublicacionService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
public class Search extends HttpServlet {

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
        PublicadorControladorPublicacionService servicio = new PublicadorControladorPublicacionService();
        PublicadorControladorPublicacion port = servicio.getPublicadorControladorPublicacionPort(); 
        if ((request.getParameter("criterio"))==null)
        {
            request.setAttribute("publicaciones", new HashSet<DataPublicacion>());
        }
        else
        {
            Set<DataPublicacion> publicaciones = null;
            List<DataPublicacion> ldp = port.buscarPublicacionCompleta(((String)request.getParameter("criterio"))).getItem();
            if((ldp == null)||(ldp.isEmpty()))
                publicaciones = new HashSet<DataPublicacion>();
            else
                publicaciones = new HashSet<DataPublicacion>(ldp);
            request.setAttribute("publicaciones", publicaciones);
        }
        request.getRequestDispatcher("WEB-INF/Search/Search.jsp").forward(request, response);
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
