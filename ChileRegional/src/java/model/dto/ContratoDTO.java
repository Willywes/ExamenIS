/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dto;

import java.sql.Timestamp;

/**
 *
 * @author Willywes
 */
public class ContratoDTO {
    
    private int id;
    private ClienteDTO cliente;
    private Timestamp fecha;
    private String nombreCategoria;
    private String nombreProducto;
    private Timestamp fechaInicio;
    private Timestamp fechaTermino;
    private float capitalUF;
    private float capitalPesos;
    private float primaUF;
    private float primaPesos;

    public ContratoDTO() {
    }

    public ContratoDTO(int id, ClienteDTO cliente, Timestamp fecha, String nombreCategoria, String nombreProducto, Timestamp fechaInicio, Timestamp fechaTermino, float capitalUF, float capitalPesos, float primaUF, float primaPesos) {
        this.id = id;
        this.cliente = cliente;
        this.fecha = fecha;
        this.nombreCategoria = nombreCategoria;
        this.nombreProducto = nombreProducto;
        this.fechaInicio = fechaInicio;
        this.fechaTermino = fechaTermino;
        this.capitalUF = capitalUF;
        this.capitalPesos = capitalPesos;
        this.primaUF = primaUF;
        this.primaPesos = primaPesos;
    }

    public int getId() {
        return id;
    }

    public ClienteDTO getCliente() {
        return cliente;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public Timestamp getFechaInicio() {
        return fechaInicio;
    }

    public Timestamp getFechaTermino() {
        return fechaTermino;
    }

    public float getCapitalUF() {
        return capitalUF;
    }

    public float getCapitalPesos() {
        return capitalPesos;
    }

    public float getPrimaUF() {
        return primaUF;
    }

    public float getPrimaPesos() {
        return primaPesos;
    }

    @Override
    public String toString() {
        return "Contrato{" + "id=" + id + ", cliente=" + cliente.toString() + ", fecha=" + fecha + ", nombreCategoria=" + nombreCategoria + ", nombreProducto=" + nombreProducto + ", fechaInicio=" + fechaInicio + ", fechaTermino=" + fechaTermino + ", capitalUF=" + capitalUF + ", capitalPesos=" + capitalPesos + ", primaUF=" + primaUF + ", primaPesos=" + primaPesos + '}';
    }
    
    
    
    
}
