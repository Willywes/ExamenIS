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
public class PersonalDTO {

    private int id;
    private int rut;
    private String dv;
    private String clave;
    private String nombres;
    private String paterno;
    private String materno;
    private int telefono;
    private String email;
    private boolean activo;
    private TipoPersonalDTO tipoPersonal;

    public PersonalDTO() {
    }

    public PersonalDTO(int id, int rut, String dv, String clave, String nombres, String paterno, String materno, int telefono, String email, boolean activo, TipoPersonalDTO tipoPersonal) {
        this.id = id;
        this.rut = rut;
        this.dv = dv;
        this.clave = clave;
        this.nombres = nombres;
        this.paterno = paterno;
        this.materno = materno;
        this.telefono = telefono;
        this.email = email;
        this.activo = activo;
        this.tipoPersonal = tipoPersonal;
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

    public boolean isActivo() {
        return activo;
    }

    public TipoPersonalDTO getTipoPersonal() {
        return tipoPersonal;
    }

    @Override
    public String toString() {
        return "PersonalDTO{" + "id=" + id + ", rut=" + rut + ", dv=" + dv + ", clave=" + clave + ", nombres=" + nombres + ", paterno=" + paterno + ", materno=" + materno + ", telefono=" + telefono + ", email=" + email + ", activo=" + activo + ", tipoPersonal=" + tipoPersonal.getNombre() + '}';
    }

    
}
