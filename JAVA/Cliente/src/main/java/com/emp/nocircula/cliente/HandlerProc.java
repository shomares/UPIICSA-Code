/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.nocircula.cliente;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sala
 */
public class HandlerProc implements Runnable {

    @Override
    public void run() {
            ExecutorService executor = Executors.newFixedThreadPool(5);
        while (true) {
                try {
                    for(int i=0; i<100; i++)
                        executor.execute(new Handler());
                    Thread.sleep(1000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(HandlerProc.class.getName()).log(Level.SEVERE, null, ex);
                }
                

        }
    }
}
