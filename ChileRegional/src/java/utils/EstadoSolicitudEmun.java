/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author Willywes
 */
public enum EstadoSolicitudEmun {

    PENDIENTE("PENDIENTE"),
    APROBADA("APROBADA"),
    RECHAZADA("RECHAZADA"),
    NULL("");
    
    private String estado;

    EstadoSolicitudEmun(String estado) {
        this.estado = estado;
    }

    public String estado() {
        return estado;
    }

}
