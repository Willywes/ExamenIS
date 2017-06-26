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
import model.dto.CategoriaDTO;

/**
 *
 * @author Willywes
 */
public class CategoriaDAO {

    private final String SQL_CREATE = "INSERT INTO categoria (nombre) VALUES (?);";
    private final String SQL_UPDATE = "UPDATE categoria SET nombre = ? WHERE id = ?;";
    private final String SQL_DELETE = "DELETE FROM categoria WHERE id = ?;";
    private final String SQL_READ = "SELECT * FROM categoria WHERE id = ?;";
    private final String SQL_READALL = "SELECT * FROM categoria order by nombre;";

    private static final Conexion con = Conexion.conectar();

    public boolean crear(CategoriaDTO c) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareStatement(SQL_CREATE);
            ps.setString(1, c.getNombre().toUpperCase());

            if (ps.executeUpdate() > 0) {

                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public boolean modificar(CategoriaDTO c) {

        PreparedStatement ps;

        try {

            ps = con.getConexion().prepareStatement(SQL_UPDATE);
            ps.setString(1, c.getNombre().toUpperCase());
            ps.setInt(2, c.getId());

            if (ps.executeUpdate() > 0) {

                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public CategoriaDTO buscarPorId(int id) {

        PreparedStatement ps;
        ResultSet rs;
        CategoriaDTO categoria = null;

        try {
            ps = con.getConexion().prepareStatement(SQL_READ);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {

                categoria = new CategoriaDTO(rs.getInt(1), rs.getString(2));
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return categoria;
    }

    public List<CategoriaDTO> listarTodas() {

        PreparedStatement ps;
        ResultSet rs;
        ArrayList<CategoriaDTO> lista = new ArrayList<>();

        try {
            ps = con.getConexion().prepareStatement(SQL_READALL);

            rs = ps.executeQuery();

            while (rs.next()) {

                lista.add(new CategoriaDTO(rs.getInt(1), rs.getString(2)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return lista;
    }
}
