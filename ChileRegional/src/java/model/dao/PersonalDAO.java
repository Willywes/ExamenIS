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
import model.dto.PersonalDTO;

/**
 *
 * @author Willywes
 */
public class PersonalDAO {

    private final String SQL_CREATE = "INSERT INTO personal (rut, dv, clave, nombres, paterno, materno, telefono, email, tipo_usuario_id) VALUES (?,?,?,?,?,?,?,?,?);";
    private final String SQL_UPDATE = "UPDATE personal SET rut = ?, dv = ?, clave = ?, nombres = ?, paterno = ?, materno = ?, telefono = ?, email = ?, tipo_usuario_id = ? WHERE id = ?";
    private final String SQL_READ = "SELECT * from personal WHERE id = ?";
    private final String SQL_READALL = "SELECT * from personal";

    private static final Conexion con = Conexion.conectar();

    public boolean crear(PersonalDTO p) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareCall(SQL_CREATE);

            ps.setInt(1, p.getRut());
            ps.setString(2, p.getDv().toUpperCase());
            ps.setString(3, p.getClave());
            ps.setString(4, p.getNombres().toUpperCase());
            ps.setString(5, p.getPaterno().toUpperCase());
            ps.setString(6, p.getMaterno().toUpperCase());
            ps.setInt(7, p.getTelefono());
            ps.setString(8, p.getEmail().toLowerCase());
            ps.setInt(9, p.getTipoPersonal().getId());

            if (ps.executeUpdate() > 0) {

                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public boolean modificar(PersonalDTO p) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareCall(SQL_UPDATE);

            ps.setInt(1, p.getRut());
            ps.setString(2, p.getDv().toUpperCase());
            ps.setString(3, p.getClave());
            ps.setString(4, p.getNombres().toUpperCase());
            ps.setString(5, p.getPaterno().toUpperCase());
            ps.setString(6, p.getMaterno().toUpperCase());
            ps.setInt(7, p.getTelefono());
            ps.setString(8, p.getEmail().toLowerCase());
            ps.setInt(9, p.getTipoPersonal().getId());
            ps.setInt(10, p.getId());

            if (ps.executeUpdate() > 0) {

                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public boolean activar(int id) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareCall("UPDATE personal SET activo = 1 WHERE id = ? ");
            ps.setInt(1, id);

            if (ps.executeUpdate() > 0) {

                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public boolean desactivar(int id) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareCall("UPDATE personal SET activo = 0 WHERE id = ? ");
            ps.setInt(1, id);

            if (ps.executeUpdate() > 0) {

                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public PersonalDTO buscarPorId(int id) {

        PreparedStatement ps;
        ResultSet rs;
        PersonalDTO personal = null;

        try {

            ps = con.getConexion().prepareCall(SQL_READ);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {

                personal = new PersonalDTO(
                        rs.getInt(1), //id
                        rs.getInt(2), // rut
                        rs.getString(3), //dv
                        rs.getString(4), //clave
                        rs.getString(5), //nombres
                        rs.getString(6), //paterno
                        rs.getString(7), // materno
                        rs.getInt(8), //telefono
                        rs.getString(9), //email
                        rs.getBoolean(10), //activo
                        new TipoPersonalDAO().buscarPorId(rs.getInt(11)) // tipo personal
                );
            }

        } catch (SQLException ex) {
            Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return personal;
    }

    public List<PersonalDTO> leerTodos() {

        PreparedStatement ps;
        ResultSet rs;
        ArrayList<PersonalDTO> lista = new ArrayList<PersonalDTO>();

        try {

            ps = con.getConexion().prepareCall(SQL_READALL);

            rs = ps.executeQuery();

            while (rs.next()) {

                lista.add(new PersonalDTO(
                        rs.getInt(1), //id
                        rs.getInt(2), // rut
                        rs.getString(3), //dv
                        rs.getString(4), //clave
                        rs.getString(5), //nombres
                        rs.getString(6), //paterno
                        rs.getString(7), // materno
                        rs.getInt(8), //telefono
                        rs.getString(9), //email
                        rs.getBoolean(10), //activo
                        new TipoPersonalDAO().buscarPorId(rs.getInt(11))) // tipo personal
                );
            }

        } catch (SQLException ex) {
            Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return lista;
    }
}
