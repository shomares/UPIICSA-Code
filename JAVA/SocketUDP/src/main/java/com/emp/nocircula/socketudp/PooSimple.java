/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.nocircula.socketudp;

/**
 *
 * @author Sala
 */
public class PooSimple {
    private Integer x;
    private Integer y;
    
    private String accion;

    public Integer getX() {
        return x;
    }

    public void setX(Integer x) {
        this.x = x;
    }

    public Integer getY() {
        return y;
    }

    public void setY(Integer y) {
        this.y = y;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }
    private int fibo(int a){
        if(a==0 || a==1)
            return 1;
        return fibo(a-1) + fibo(a-2);
    
    }
    
    public Resultado ejecuta(){
        Resultado res= new Resultado();
        int r= fibo(x);
        res.setResultado(r);
        res.setMensaje("OK");
        return res;
    }
    
    
    
}
