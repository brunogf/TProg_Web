/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.servicios.DataDisponibilidad;
import com.h4t.servicios.DataPublicacion;
import com.h4t.servicios.ParDPD;
import com.h4t.servicios.PublicadorControladorPublicacion;
import com.h4t.servicios.PublicadorControladorPublicacionService;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.datatype.DatatypeFactory;

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
        String Promo = (String)request.getParameter("promocion");
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
        PublicadorControladorPublicacionService servicio = new PublicadorControladorPublicacionService(new URL(srv +"/controlador_publicacion?wsdl"));
        PublicadorControladorPublicacion port = servicio.getPublicadorControladorPublicacionPort();    
        if (Promo == null){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            Set<ParDPD> carro = (Set<ParDPD>)request.getSession().getAttribute("publicaciones-carro");
            if(carro == null){
                carro = new HashSet<ParDPD>();
                request.getSession().setAttribute("publicaciones-carro", carro);
            }
            DataPublicacion d_pub = port.infoServicio(request.getParameter("proveedor").toString(),request.getParameter("servicio").toString());
            try{
             DateFormat dfini = new SimpleDateFormat("yyyy-MM-dd");
             DateFormat dffin = new SimpleDateFormat("yyyy-MM-dd");
             Date fechainicial = dfini.parse(request.getParameter("fechaini").toString());
             Date fechafinal = dffin.parse(request.getParameter("fechafin").toString());
             DataDisponibilidad d_disp = new DataDisponibilidad();
             d_disp.setCant(Integer.parseInt(request.getParameter("cantidad")));
             GregorianCalendar fecha = new GregorianCalendar();
             fecha.setTime(fechainicial);
             d_disp.setFechaIni(DatatypeFactory.newInstance().newXMLGregorianCalendar(fecha));
             fecha.setTime(fechafinal);
             d_disp.setFechaFin(DatatypeFactory.newInstance().newXMLGregorianCalendar(fecha));
             

            ParDPD par = new ParDPD();
            par.setDd(d_disp);
            par.setDpub(d_pub);
            carro.add(par);
            request.getSession().setAttribute("publicaciones-carro", carro);
            request.getRequestDispatcher("CarroDeCompras.jsp").forward(request, response);
            }
            catch(Exception e){
               out.print(e.getMessage());
           }        
        }
        else{
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            Set<ParDPD> carro = (Set<ParDPD>)request.getSession().getAttribute("publicaciones-carro");
            if(carro == null){
                carro = new HashSet<ParDPD>();
                request.getSession().setAttribute("publicaciones-carro", carro);
            }
            DataPublicacion d_pub = port.infoPromocion(request.getParameter("proveedor").toString(),request.getParameter("promocion").toString());
            try{
                DateFormat dfini = new SimpleDateFormat("yyyy-MM-dd");
                DateFormat dffin = new SimpleDateFormat("yyyy-MM-dd");
                Date fechainicial = dfini.parse(request.getParameter("fechaini").toString());
                Date fechafinal = dffin.parse(request.getParameter("fechafin").toString());
                DataDisponibilidad d_disp = new DataDisponibilidad();
                d_disp.setCant(Integer.parseInt(request.getParameter("cantidad")));
                GregorianCalendar fecha = new GregorianCalendar();
                fecha.setTime(fechainicial);
                d_disp.setFechaIni(DatatypeFactory.newInstance().newXMLGregorianCalendar(fecha));
                fecha.setTime(fechafinal);
                d_disp.setFechaFin(DatatypeFactory.newInstance().newXMLGregorianCalendar(fecha));

               ParDPD par = new ParDPD();
               par.setDd(d_disp);
               par.setDpub(d_pub);
               carro.add(par);
               request.getSession().setAttribute("publicaciones-carro", carro);
               request.getRequestDispatcher("CarroDeCompras.jsp").forward(request, response);
            }
            catch(Exception e){
               out.print(e.getMessage());
            }
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
