/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.modelo.EstadoSesion;
import com.h4t.servicios.DataUsuario;
import com.h4t.servicios.Estado;
import com.h4t.servicios.PublicadorControladorReserva;
import com.h4t.servicios.PublicadorControladorReservaService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nico
 */
@WebServlet(name = "CancelarReserva", urlPatterns = {"/CancelarReserva"})
public class CancelarReserva extends HttpServlet {

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
            if((request.getSession() != null) && (request.getSession().getAttribute("estado_sesion")) == EstadoSesion.LOGGED_IN)
            {
                String usr = (String)request.getSession().getAttribute("Usuario");
                int reserva = Integer.parseInt(request.getParameter("nro"));
                PublicadorControladorReservaService servicio = new PublicadorControladorReservaService();
                PublicadorControladorReserva port = servicio.getPublicadorControladorReservaPort();    
                String nick = port.getClienteReserva(reserva);
                if (nick.equals(usr))
                        {
                            try{
                            port.actualizarEstado(reserva, Estado.CANCELADA);
                            }catch(Exception ex){}
                             response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/VerInfoReserva?nro=" + request.getParameter("nro")));
                        }
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
     * Returns a short descont_reservaiption of the servlet.
     *
     * @return a String containing servlet descont_reservaiption
     */
    @Override
    public String getServletInfo() {
        return "Short descont_reservaiption";
    }// </editor-fold>

}
