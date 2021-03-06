/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.google.gson.Gson;
import com.h4t.modelo.FabricaWS;
import com.h4t.servicios.DataPublicacion;
import com.h4t.servicios.PublicadorControladorPublicacion;
import com.h4t.servicios.PublicadorControladorPublicacionService;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
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
 * @author Usuario
 */
@WebServlet(name = "AjaxSearchRequest", urlPatterns = {"/AjaxSearchRequest"})
public class AjaxSearchRequest extends HttpServlet {

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
        
        PublicadorControladorPublicacionService servicio = FabricaWS.getInstance().getPublicacionService();
        PublicadorControladorPublicacion port = servicio.getPublicadorControladorPublicacionPort();    
        
        String json;
        if ((request.getParameter("criterio"))==null)
        {
            json = new Gson().toJson(new ArrayList<String>());
            request.setAttribute("publicaciones", new HashSet<DataPublicacion>());
        }
        else
        {
            Set<DataPublicacion> publicaciones;
            List<DataPublicacion> ldtp = port.buscarPublicacion((String)request.getParameter("criterio")).getItem();
            if ((ldtp == null)||(ldtp.isEmpty())){
                publicaciones = new HashSet<DataPublicacion>();
            }
            else
                publicaciones = new HashSet(ldtp);
            request.setAttribute("publicaciones", publicaciones);
            List<String> lista = new ArrayList<String>();
            for(DataPublicacion p : publicaciones)
                lista.add(p.getNombre());
            Collections.sort(lista, Collator.getInstance());
            json = new Gson().toJson(lista);
        }
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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
