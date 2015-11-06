/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.servicios_usuario.DataPublicacion;
import com.h4t.servicios_usuario.DataUsuario;
import com.h4t.servicios_usuario.PublicadorControladorUsuario;
import com.h4t.servicios_usuario.PublicadorControladorUsuarioService;
import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author spesamosca
 */
@WebServlet(name = "VerInfoProveedor", urlPatterns = {"/VerInfoProveedor"})
public class VerInfoProveedor extends HttpServlet {

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
        PublicadorControladorUsuarioService servicio = new PublicadorControladorUsuarioService();
        PublicadorControladorUsuario port = servicio.getPublicadorControladorUsuarioPort();
        String proveedor = (String)request.getParameter("Proveedor");
        request.setAttribute("info_proveedor", port.infoProveedor(proveedor));   
        port.listarPublicacionesProveedor(proveedor).getItem();
        Set<DataPublicacion> sdtp = new HashSet<DataPublicacion>();
        List<DataPublicacion> ldp = port.listarPublicacionesProveedor(proveedor).getItem();
        for (DataPublicacion dtpub : ldp)
            sdtp.add(dtpub);
        request.setAttribute("publicaciones_de_proveedor", sdtp);
        DataUsuario data_usr = port.infoProveedor(proveedor);
        if(data_usr.getImg() != null)
                {
                    
                    byte[] img = port.getImagenDelUsuario(data_usr.getNickname()); 
                    BufferedImage b_img = ImageIO.read(new ByteArrayInputStream(img));
                    String destino = getServletContext().getRealPath("/") + "media\\Images\\" + data_usr.getNickname().toLowerCase() + ".jpg";
                    File file_d = new File(destino);
                    if (!(file_d.exists())){
                        BufferedImage newBufferedImage = new BufferedImage(b_img.getWidth(),
			b_img.getHeight(), BufferedImage.TYPE_INT_RGB);
                        newBufferedImage.createGraphics().drawImage(b_img, 0, 0, Color.WHITE, null);
                        ImageIO.write(newBufferedImage,"jpg",file_d);
                    }
                }
        request.getRequestDispatcher("InfoProveedor.jsp").forward(request, response);
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
