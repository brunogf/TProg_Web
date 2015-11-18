/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.google.gson.Gson;
import com.h4t.modelo.FabricaWS;
import com.h4t.servicios.ParDPD;
import com.h4t.servicios.PublicadorControladorReserva;
import com.h4t.servicios.PublicadorControladorReservaService;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

        Set<ParDPD> pubs = (HashSet) request.getSession().getAttribute("publicaciones-carro");
        
        PublicadorControladorReservaService servicio = FabricaWS.getInstance().getReservaService();
        PublicadorControladorReserva port = servicio.getPublicadorControladorReservaPort();

        String usr = request.getSession().getAttribute("Usuario").toString();
        String json = new Gson().toJson(pubs);
        int nro = port.generarReserva(json, usr);
        Date fechaactual = new Date();
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        try {
            port.cambiarFechaCreacionReserva(df.format(fechaactual), nro);
        } catch (Exception ex) {
            //Pagina ERROR
        }
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
