/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.servicios.PublicadorControladorReserva;
import com.h4t.servicios.PublicadorControladorReservaService;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "VerFactura", urlPatterns = {"/VerFactura"})
public class VerFactura extends HttpServlet {

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
        try {
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
            PublicadorControladorReservaService servicio = new PublicadorControladorReservaService(new URL(srv +"/controlador_reserva?wsdl"));
            PublicadorControladorReserva port = servicio.getPublicadorControladorReservaPort();
            int factura = Integer.parseInt(request.getParameter("id"));
            //Pido factura via WS, el servidor central se encarga de generarla a partir de la DB
            byte[] pdf = port.obtenerFactura(factura);
            String destino = getServletContext().getRealPath("/") + "/media/facturas/" + String.valueOf(factura) + ".pdf";
            //Escribo pdf en disco
            FileOutputStream fos = new FileOutputStream(destino);
            fos.write(pdf);
            fos.close();
            //Muestro PDF sin cambiar url para ocultar la ruta del archivo
            request.getRequestDispatcher("/media/facturas/" + String.valueOf(factura) + ".pdf").forward(request, response);
        } finally {
            
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
