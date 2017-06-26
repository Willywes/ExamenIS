/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dto;

import java.sql.Timestamp;
import utils.EstadoSolicitudEmun;


/**
 *
 * @author Willywes
 */
public class SolicitudDTO {
    
    private int id;
    private Timestamp fecha;
    private ClienteDTO cliente;
    private ProductoDTO producto;
    private PersonalDTO personal;
    private EstadoSolicitudEmun estado;

    public SolicitudDTO() {
    }
    
    

    public SolicitudDTO(int id, Timestamp fecha, ClienteDTO cliente, ProductoDTO producto, PersonalDTO personal, EstadoSolicitudEmun estado) {
        this.id = id;
        this.fecha = fecha;
        this.cliente = cliente;
        this.producto = producto;
        this.personal = personal;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public ClienteDTO getCliente() {
        return cliente;
    }

    public ProductoDTO getProducto() {
        return producto;
    }

    public PersonalDTO getPersonal() {
        return personal;
    }

    public EstadoSolicitudEmun getEstado() {
        return estado;
    }

    @Override
    public String toString() {
        return "SolicitudDTO{" + "id=" + id + ", fecha=" + fecha + ", cliente=" + cliente.toString() + ", producto=" + producto.toString() + ", personal=" + personal.toString() + ", estado=" + estado.toString() + '}';
    }
    
    
    
}
