/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.dto.ProductoDTO;

/**
 *
 * @author Willywes
 */
public class ProductoDAO {

    private final String SQL_CREATE = "INSERT INTO producto (nombre, descripcion, valor_uf, categoria_id) VALUES (?,?,?,?);";
    private final String SQL_UPDATE = "UPDATE producto SET nombre = ?, descripcion = ?, valor_uf = ?, categoria_id =? WHERE id = ?;";
    private final String SQL_DELETE = "DELETE FROM producto WHERE id = ?;";
    private final String SQL_READ = "SELECT * FROM producto WHERE id = ?;";
    private final String SQL_READALL = "SELECT * FROM producto order by categoria_id";

    private static final Conexion con = Conexion.conectar();

    public boolean crear(ProductoDTO p) {

        PreparedStatement ps;

        try {

            ps = con.getConexion().prepareStatement(SQL_CREATE);
            ps.setString(1, p.getNombre().toUpperCase());
            ps.setString(2, p.getDescripcion());
            ps.setFloat(3, p.getValorUF());
            ps.setInt(4, p.getCategoria().getId());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public boolean modificar(ProductoDTO p) {

        PreparedStatement ps;

        try {

            ps = con.getConexion().prepareStatement(SQL_UPDATE);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getDescripcion());
            ps.setFloat(3, p.getValorUF());
            ps.setInt(4, p.getCategoria().getId());
            ps.setInt(5, p.getId());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public boolean eliminar(int id) {

        PreparedStatement ps;

        try {

            ps = con.getConexion().prepareStatement(SQL_DELETE);
            ps.setInt(1, id);

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public ProductoDTO buscarPorId(int id) {

        PreparedStatement ps;
        ResultSet rs;
        ProductoDTO producto = null;

        try {
            ps = con.getConexion().prepareStatement(SQL_READ);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {
                producto = new ProductoDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), new CategoriaDAO().buscarPorId(rs.getInt(5)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return producto;
    }

    public List<ProductoDTO> listarTodos() {

        PreparedStatement ps;
        ResultSet rs;
        ArrayList<ProductoDTO> lista = new ArrayList<>();

        try {
            ps = con.getConexion().prepareStatement(SQL_READALL);

            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(new ProductoDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), new CategoriaDAO().buscarPorId(rs.getInt(5))));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return lista;
    }

}
