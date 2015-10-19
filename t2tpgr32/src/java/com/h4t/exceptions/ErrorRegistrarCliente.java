/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.exceptions;

/**
 *
 * @author piñe
 */
public class ErrorRegistrarCliente extends Exception {

	/**
	 * Creates a new instance of <code>UsuarioNoEncontrado</code> without detail message.
	 */
	public ErrorRegistrarCliente() {
	}

	/**
	 * Constructs an instance of <code>UsuarioNoEncontrado</code> with the specified detail message.
	 * @param msg the detail message.
	 */
	public ErrorRegistrarCliente(String msg) {
		super(msg);
	}
}