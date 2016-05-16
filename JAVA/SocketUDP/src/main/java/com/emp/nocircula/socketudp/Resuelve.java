/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.nocircula.socketudp;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sala
 */
public class Resuelve implements Runnable {

    private InetAddress address;
    private int port;
    private String JSONPeticion;

    @Override
    public void run() {
        try {
            ObjectMapper mapper = new ObjectMapper();
            byte[] buf = null;
            DatagramPacket packet = null;
            PooSimple obj = mapper.readValue(JSONPeticion, PooSimple.class);
            Resultado res = null;
            String jsonInString = null;
            if (obj != null) {
                buf = new byte[256];
                res = obj.ejecuta();
                jsonInString = mapper.writeValueAsString(res);
                buf = jsonInString.getBytes();
                packet = new DatagramPacket(buf, buf.length, address, port);
                SocketUDPServer.send(packet);
            }
        } catch (IOException ex) {
            Logger.getLogger(Resuelve.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    void evalua(InetAddress address, int port, String JSONPeticion) {
        this.address = address;
        this.port = port;
        this.JSONPeticion = JSONPeticion;
    }

}
