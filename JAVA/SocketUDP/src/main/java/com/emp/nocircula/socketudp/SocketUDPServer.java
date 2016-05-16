/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.nocircula.socketudp;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sala
 */
public class SocketUDPServer implements Runnable {
    
    private final static Object Flag = new Object();
    public static DatagramSocket socket;
    private static Exception ex;
    
    public SocketUDPServer() {
        try {
            synchronized (Flag) {
                socket = new DatagramSocket(11);
            }
            ex = null;
            
        } catch (SocketException ex) {
            Logger.getLogger(SocketUDPServer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void send(DatagramPacket packet) {
        synchronized (Flag) {
            try {
                socket.send(packet);
            } catch (IOException es) {
                ex = es;
            }
        }
        
    }
    
    public boolean isBusy() {
        return ex == null;
    }
    
    @Override
    public void run() {
        byte[] bufer = new byte[1000];
        ExecutorService executor = Executors.newFixedThreadPool(20);
        
        while (ex == null) {
            DatagramPacket peticion = new DatagramPacket(bufer, bufer.length);
            try {
                Resuelve res = new Resuelve();
                String JSONPeticion;
                socket.receive(peticion);
                JSONPeticion = new String(peticion.getData(), 0, peticion.getLength());
                res.evalua(peticion.getAddress(), peticion.getPort(), JSONPeticion);
                executor.execute(res);
                
            } catch (IOException es) {
                ex = es;
            }
        }
        socket.close();
    }
    
}
