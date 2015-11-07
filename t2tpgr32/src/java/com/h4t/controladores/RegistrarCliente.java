/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.exceptions.ErrorRegistrarCliente;
import com.h4t.servicios.PublicadorControladorUsuario;
import com.h4t.servicios.PublicadorControladorUsuarioService;
import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.util.*;
import javax.imageio.ImageIO;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author Bruno González
 */
@WebServlet(name = "Registrar", urlPatterns = {"/Registrar"})
@MultipartConfig
public class RegistrarCliente extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //FALTA CARGAR CLIENTE CON IMAGEN.
        response.setContentType("text/html;charset=UTF-8");
        
        Part filePart = request.getPart("file");
        InputStream fileContent = filePart.getInputStream();
        BufferedImage iBuff = ImageIO.read(fileContent);
        
   
       PublicadorControladorUsuarioService servicio = new PublicadorControladorUsuarioService();
        PublicadorControladorUsuario port = servicio.getPublicadorControladorUsuarioPort();
        
        DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
                       
        String nick = (String) request.getParameter("nick_registro");
        String nombre = (String) request.getParameter("nombre_registro");
        String apellido = (String) request.getParameter("apellido_registro");
        String mail = (String) request.getParameter("email_registro");
        String pass = (String) request.getParameter("contrasena_registro");
        
        
        try{
            DateFormat dtf = new SimpleDateFormat("dd-MM-yyyy");
            Date fnac = date_format.parse(request.getParameter("fecha_registro").toString()); 
            if (iBuff == null)
                port.altaCliente(nick, nombre, apellido, mail, dtf.format(fnac), pass);
            else if(iBuff != null){
                ByteArrayOutputStream bArray = new ByteArrayOutputStream();
                ImageIO.write(iBuff, "jpg", bArray);
                port.altaClienteConImg(nick, nombre, apellido, mail, dtf.format(fnac), bArray.toByteArray(), pass);
                String destino = getServletContext().getRealPath("/") + "/media/Images/" + nick + ".jpg";
                File file_d = new File(destino);
                if(file_d.exists())
                    file_d.delete();
                if (!(file_d.exists())){
                            BufferedImage newBufferedImage = new BufferedImage(iBuff.getWidth(),
                            iBuff.getHeight(), BufferedImage.TYPE_INT_RGB);
                            newBufferedImage.createGraphics().drawImage(iBuff, 0, 0, Color.WHITE, null);
                            ImageIO.write(newBufferedImage,"jpg",file_d);
                        }
            }
            response.sendRedirect("");
        }catch(Exception e){
            response.sendError(404); // error en registrar el cliente
	    request.getRequestDispatcher("/WEB-INF/errorPages/500.jsp").
						include(request, response);
				return;
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