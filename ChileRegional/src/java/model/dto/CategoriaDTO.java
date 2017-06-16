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
public class CategoriaDTO {
    
    private int id;
    private String nombre;

    public CategoriaDTO() {
    }

    public CategoriaDTO(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return "CategoriaDTO{" + "id=" + id + ", nombre=" + nombre + '}';
    }
    
}
