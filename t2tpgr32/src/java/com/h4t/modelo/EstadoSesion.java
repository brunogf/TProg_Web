/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.modelo;

public enum EstadoSesion {
    NOT_LOGGED_IN,           // nunca intentó iniciar sesión
    LOGGED_IN,     // tiene la sesión iniciada
    INVALID_LOGIN    // le erro a la sesión al menos una vez
}
