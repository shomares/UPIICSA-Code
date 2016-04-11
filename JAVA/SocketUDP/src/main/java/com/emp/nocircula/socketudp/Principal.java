/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.nocircula.socketudp;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sala
 */
public class Principal {
    
    public static void main(String... args){
        System.out.println("Inicializando Server");
        SocketUDPServer server= new SocketUDPServer();
        Thread th= new Thread(server);
        try {
            th.start();
            th.join();
        } catch (InterruptedException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
