/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.nocircula.cliente;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sala
 */
public class Principal {

    public static void main(String... args) {
        Thread thread = new Thread(new HandlerProc());
        thread.start();
        try {
            thread.join();
        } catch (InterruptedException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
