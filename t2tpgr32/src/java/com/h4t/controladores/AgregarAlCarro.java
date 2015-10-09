/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tpgr32.*;
import java.util.regex.*;

/**
 *
 * @author piñe
 */
@WebServlet(name = "AgregarAlCarro", urlPatterns = {"/AgregarAlCarro"})
public class AgregarAlCarro extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         Set<ParDPD> carro = (Set<ParDPD>)request.getSession().getAttribute("publicaciones-carro");
         if(carro == null){
             carro = new HashSet<ParDPD>();
             request.getSession().setAttribute("publicaciones-carro", request);
         }
         FabricaControladores fab = FabricaControladores.getInstancia();
         IControladorPublicacion pub = fab.getControladorPublicacion();
         DataPublicacion dp = pub.infoServicio(request.getParameter("publicacion"),request.getParameter("proveedor"));
         try{
         String fechaini = request.getParameter("fechaini").toString();
         String fechafin = request.getParameter("fechafin").toString();
         String datosfechaini[] = fechaini.split("[/]");
         String datosfechafin[] = fechafin.split("[/]");
         
         Date fechainicial =  new Date(Integer.parseInt(datosfechaini[2]),Integer.parseInt(datosfechaini[1])
                               ,Integer.parseInt(datosfechaini[0]));
         Date fechafinal =  new Date(Integer.parseInt(datosfechafin[2]),Integer.parseInt(datosfechafin[1])
                               ,Integer.parseInt(datosfechafin[0]));
         DataDisponibilidad dd = new DataDisponibilidad(Integer.parseInt(request.getParameter("cantidad")),
                                     fechainicial,fechafinal);
         
         ParDPD par = new ParDPD(dp,dd);
         
         carro.add(par);
         request.getSession().setAttribute("publicaciones-carro", carro);
         response.sendRedirect("");
         }
         catch(Exception e){
            out.print("EXCEPCION!");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AgregarAlCarro.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AgregarAlCarro.class.getName()).log(Level.SEVERE, null, ex);
        }
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