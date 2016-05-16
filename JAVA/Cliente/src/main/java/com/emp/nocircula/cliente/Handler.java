/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.nocircula.cliente;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

/**
 *
 * @author Sala
 */
public class Handler implements Runnable {

    private static int x = 20;
    private static final Object flag = new Object();

    @Override
    public void run() {
        try {
            try (DatagramSocket socketUDP = new DatagramSocket()) {

                PooSimple simple = new PooSimple();
                ObjectMapper mapper = new ObjectMapper();
                String json;
                Double rnd= Math.random();
                
                synchronized (flag) {
                    Handler.x= 20 + (int) ((rnd * 40) - (rnd * 20));
                    simple.setX(Handler.x);
                }

                json = mapper.writeValueAsString(simple);

                byte[] mensaje = json.getBytes();
                InetAddress hostServidor = InetAddress.getByName("localhost");
                int puertoServidor = 11;

                // Construimos un datagrama para enviar el mensaje al servidor
                DatagramPacket peticion = new DatagramPacket(mensaje, json.length(), hostServidor,
                        puertoServidor);

                // Enviamos el datagrama
                socketUDP.send(peticion);

                // Construimos el DatagramPacket que contendrá la respuesta
                byte[] bufer = new byte[1000];
                DatagramPacket respuesta
                        = new DatagramPacket(bufer, bufer.length);
                socketUDP.receive(respuesta);

                // Enviamos la respuesta del servidor a la salida estandar
                System.out.println("Respuesta: "+ simple.getX() + ": " + new String(respuesta.getData()));

                // Cerramos el socket
                socketUDP.close();
            }

        } catch (SocketException e) {
            System.out.println("Socket: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("IO: " + e.getMessage());
        }

    }
}
