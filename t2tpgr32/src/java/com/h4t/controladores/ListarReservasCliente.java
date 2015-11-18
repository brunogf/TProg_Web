/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.modelo.EstadoSesion;
import com.h4t.modelo.FabricaWS;
import com.h4t.servicios.DataCliente;
import com.h4t.servicios.PublicadorControladorUsuario;
import com.h4t.servicios.PublicadorControladorUsuarioService;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nico
 */
@WebServlet(name = "ListarReservasCliente", urlPatterns = {"/MisReservas"})
public class ListarReservasCliente extends HttpServlet {

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
        if(request.getSession().getAttribute("estado_sesion") == EstadoSesion.LOGGED_IN)
        {
            PublicadorControladorUsuarioService servicio = FabricaWS.getInstance().getUsuarioService();
            PublicadorControladorUsuario port = servicio.getPublicadorControladorUsuarioPort();
            DataCliente data_sur = port.infoCliente((String)request.getSession().getAttribute("Usuario"));
            request.setAttribute("reservas_usuario", data_sur.getReservas());
            request.getRequestDispatcher("/WEB-INF/Usuario/VerReservas.jsp").forward(request, response);
        }
        else
            response.sendRedirect("");//redirecciona al inicio
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
