/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * @author piñe
 */
@WebServlet(name = "GenerarReserva", urlPatterns = {"/GenerarReserva"})
public class GenerarReserva extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
         
        Set<ParDPD> pubs = (HashSet)request.getSession().getAttribute("publicaciones-carro");
        FabricaControladores fab = FabricaControladores.getInstancia();
        IControladorReserva cont_r = fab.getControladorReserva();
        cont_r.borrarPublicacionesSeleccionadas();
        for(ParDPD par: pubs){
            
            cont_r.seleccionarProveedor(par.getDpub_().getProveedor());
            cont_r.seleccionarCliente(request.getSession().getAttribute("Usuario").toString());
            cont_r.seleccionarPublicacion(par.getDpub_().getNombre(),par.getDd_().getCant(),par.getDd_().getFechaIni(),par.getDd_().getFechaFin());
            
        }
        int nro = cont_r.confirmarReserva();
        Date fechaactual = new Date();
        cont_r.cambiarFechaCreacionReserva(fechaactual, nro);
        request.getSession().setAttribute("publicaciones-carro", null);
        request.getRequestDispatcher("MisReservas").forward(request, response);
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
     * Returns a short descont_ription of the servlet.
     *
     * @return a String containing servlet descont_ription
     */
    @Override
    public String getServletInfo() {
        return "Short descont_ription";
    }// </editor-fold>

}
