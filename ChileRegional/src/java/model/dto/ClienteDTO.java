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
public class ClienteDTO {

    private int id;
    private int rut;
    private String dv;
    private String clave;
    private Timestamp fechaNac;
    private String nombres;
    private String paterno;
    private String materno;
    private String sexo;
    private String direccion;
    private int telefono;
    private String email;

    public ClienteDTO() {
    }

    public ClienteDTO(int id, int rut, String dv, String clave, Timestamp fechaNac, String nombres, String paterno, String materno, String sexo, String direccion, int telefono, String email) {
        this.id = id;
        this.rut = rut;
        this.dv = dv;
        this.clave = clave;
        this.fechaNac = fechaNac;
        this.nombres = nombres;
        this.paterno = paterno;
        this.materno = materno;
        this.sexo = sexo;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
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

    public String getClave() {
        return clave;
    }

    public Timestamp getFechaNac() {
        return fechaNac;
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

    public String getSexo() {
        return sexo;
    }

    public String getDireccion() {
        return direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "ClienteDTO{" + "id=" + id + ", rut=" + rut + ", dv=" + dv + ", clave=" + clave + ", fechaNac=" + fechaNac + ", nombres=" + nombres + ", paterno=" + paterno + ", materno=" + materno + ", sexo=" + sexo + ", direccion=" + direccion + ", telefono=" + telefono + ", email=" + email + '}';
    }
    
    
    

}
