/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import javax.servlet.http.HttpServletRequest;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;
import tpgr32.FabricaControladores;

/**
 *
 * @author Nico
 */
public class ServletTest {
    
    public ServletTest() {
       
    }
     @Before
     public void setUp(){
     final FabricaControladores fab = FabricaControladores.getInstancia();//carga datos
     fab.getControladorPublicacion();
     }
     
     @Test
     public void getLoginTest()
     {
         Login log = new Login();
         HttpServletRequest request;
     }

    
    
}
