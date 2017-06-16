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
public class ProductoDTO {
    
    private int id;
    private String nombre;
    private String descripcion;
    private float valorUF;
    private CategoriaDTO categoria;

    public ProductoDTO() {
    }

    public ProductoDTO(int id, String nombre, String descripcion, float valorUF, CategoriaDTO categoria) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.valorUF = valorUF;
        this.categoria = categoria;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public float getValorUF() {
        return valorUF;
    }

    public CategoriaDTO getCategoria() {
        return categoria;
    }

    @Override
    public String toString() {
        return "ProductoDTO{" + "id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", valorUF=" + valorUF + ", categoria=" + categoria.toString() + '}';
    }
    
    
    
}
