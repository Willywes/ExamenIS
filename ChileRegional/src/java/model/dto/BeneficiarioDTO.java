/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dto;

/**
 *
 * @author Willywes
 */
public class BeneficiarioDTO {
    private int id;
    private int rut;
    private String dv;
    private String nombres;
    private String paterno;
    private String materno;
    private int telefono;
    private String email;
    private ClienteDTO cliente;

    public BeneficiarioDTO() {
    }

    public BeneficiarioDTO(int id, int rut, String dv, String nombres, String paterno, String materno, int telefono, String email, ClienteDTO cliente) {
        this.id = id;
        this.rut = rut;
        this.dv = dv;
        this.nombres = nombres;
        this.paterno = paterno;
        this.materno = materno;
        this.telefono = telefono;
        this.email = email;
        this.cliente = cliente;
    }

    public int getId() {
        return id;
    }

    public int getRut() {
        return rut;
    }

    public String getDv() {
        return dv;
    }

    public String getNombres() {
        return nombres;
    }

    public String getPaterno() {
        return paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public int getTelefono() {
        return telefono;
    }

    public String getEmail() {
        return email;
    }

    public ClienteDTO getCliente() {
        return cliente;
    }

    @Override
    public String toString() {
        return "BenecifiarioDTO{" + "id=" + id + ", rut=" + rut + ", dv=" + dv + ", nombres=" + nombres + ", paterno=" + paterno + ", materno=" + materno + ", telefono=" + telefono + ", email=" + email + ", cliente=" + cliente.toString() + '}';
    }
    
    
    
}
