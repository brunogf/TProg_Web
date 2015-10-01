/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.util.*;
import tpgr32.*;

/**
 *
 * @author Bruno González
 */
@WebServlet(name = "Registrar", urlPatterns = {"/Registrar"})
public class RegistrarCliente extends HttpServlet {

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
        //FALTA CARGAR CLIENTE CON IMAGEN.
        
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        FabricaControladores fab = FabricaControladores.getInstancia();
        IControladorUsuario cu = fab.getControladorUsuario();
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                       
        String nick = (String) request.getParameter("nick");
        String nombre = (String) request.getParameter("nombre");
        String apellido = (String) request.getParameter("apellido");
        String mail = (String) request.getParameter("email");
        String pass = (String) request.getParameter("password");
        
        
        try{
            Date fnac = df.parse(request.getParameter("fechanac").toString());                       
            cu.altaCliente(nick, nombre, apellido, mail, fnac, pass);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }catch(Exception e){
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
        //TODO
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
