/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.modelo.FabricaWS;
import com.h4t.servicios.DataServicioBean;
import com.h4t.servicios.PublicadorControladorPublicacion;
import com.h4t.servicios.PublicadorControladorPublicacionService;
import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
       
        PublicadorControladorPublicacionService service = FabricaWS.getInstance().getPublicacionService();
        PublicadorControladorPublicacion port = service.getPublicadorControladorPublicacionPort(); 
        
        DataServicioBean dts = port.infoServicio(proveedor, servicio);
        List<byte[]> imList = dts.getImagenes();
        Set<Image> imagenes = new HashSet<Image>();
        for (byte[] barr : imList){
            BufferedImage bi = ImageIO.read(new ByteArrayInputStream(barr));
            imagenes.add(bi);
        }
        
        int num = 0;
        for (Image i : imagenes){
            BufferedImage b_img = (BufferedImage)i;
            String destino = getServletContext().getRealPath("/") + "/media/Images/"+servicio+String.valueOf(num)+".jpg";
            File arch = new File(destino);
            if (!(arch.exists())){
              BufferedImage newBufferedImage = new BufferedImage(b_img.getWidth(),
			b_img.getHeight(), BufferedImage.TYPE_INT_RGB);
	      newBufferedImage.createGraphics().drawImage(b_img, 0, 0, Color.WHITE, null);
              ImageIO.write(newBufferedImage,"jpg",arch);
            }
            String atr = "imagen"+String.valueOf(num);
            request.setAttribute(atr,"media/Images/"+servicio+String.valueOf(num)+".jpg");
            num++;
        }
        request.setAttribute("info_servicio",dts);
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
