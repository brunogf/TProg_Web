/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import tpgr32.*;
import java.util.*;
import javax.imageio.ImageIO;


/**
 *
 * @author Bruno González
 */

@WebServlet(name = "Perfil", urlPatterns = {"/Perfil"})
public class VerPerfil extends HttpServlet {

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
        FabricaControladores fab = FabricaControladores.getInstancia();
        ManejadorUsuario mu = ManejadorUsuario.getInstance();
        ControladorUsuario cu = fab.getControladorUsuario();
        
        try {
            Cliente usr = (Cliente)mu.encontrarUsuario(request.getSession().getAttribute("Usuario").toString());
            DataCliente du = (DataCliente)cu.infoCliente(usr.getNickname());
            if(du.getImage() != null)
            {
                    
                    Image i = cu.getImagenDelUsuario(du.getNickname()); 
                    BufferedImage bi = (BufferedImage)i;
                    String destino = getServletContext().getRealPath("/") + "media\\Images\\" + du.getNickname().toLowerCase() + ".jpg";
                    File d = new File(destino);
                    if (!(d.exists())){
                        BufferedImage newBufferedImage = new BufferedImage(bi.getWidth(),
			bi.getHeight(), BufferedImage.TYPE_INT_RGB);
                        newBufferedImage.createGraphics().drawImage(bi, 0, 0, Color.WHITE, null);
                        ImageIO.write(newBufferedImage,"jpg",d);
                    }
            }
            request.setAttribute("info", du);
            request.getRequestDispatcher("/WEB-INF/Usuario/perfil.jsp").forward(request, response);
	}finally{
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
