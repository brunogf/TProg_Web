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
import java.util.Set;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriter;
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
@WebServlet(name = "VerInfoServicio", urlPatterns = {"/VerInfoServicio"})
public class VerInfoservicio extends HttpServlet {

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
        
        String servicio = (String)request.getParameter("Servicio");
        String proveedor = (String)request.getParameter("proveedor");
        
        FabricaControladores fab = FabricaControladores.getInstancia();
        IControladorPublicacion pub = fab.getControladorPublicacion();
        DataServicio dts = pub.infoServicio(proveedor, servicio);
        Set<Image> imagenes = dts.getImagenes();
        int num = 0;
        for (Image i : imagenes){
            BufferedImage bi = (BufferedImage)i;
            String destino = getServletContext().getRealPath("/") + "media/Images/"+servicio+String.valueOf(num)+".jpg";
            File arch = new File(destino);
            if (!(arch.exists())){
              BufferedImage newBufferedImage = new BufferedImage(bi.getWidth(),
			bi.getHeight(), BufferedImage.TYPE_INT_RGB);
	      newBufferedImage.createGraphics().drawImage(bi, 0, 0, Color.WHITE, null);
              ImageIO.write(newBufferedImage,"jpg",arch);
            }
            String atr = "imagen"+String.valueOf(num);
            request.setAttribute(atr,"media/Images/"+servicio+String.valueOf(num)+".jpg");
            num++;
        }
        request.setAttribute("info_servicio",pub.infoServicio(proveedor, servicio));
        request.getRequestDispatcher("/InfoServicio.jsp").forward(request, response);
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
