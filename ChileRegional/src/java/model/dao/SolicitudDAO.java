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
import model.dto.BeneficiarioDTO;
import model.dto.ProductoDTO;
import model.dto.SolicitudDTO;
import utils.EstadoSolicitudEmun;

/**
 *
 * @author Willywes
 */
public class SolicitudDAO {

    private final String SQL_CREATE = "INSERT INTO solicitud (fecha, cliente_id, producto_id, personal_id, estado) VALUES (?,?,?,?,?); ";
    private final String SQL_UPDATE = "UPDATE solicitud SET fecha = ?, cliente_id = ?, producto_id = ?, personal_id = ?, estado = ? WHERE id = ?;";
    private final String SQL_READ = "SELECT * FROM solicitud WHERE id = ?;";
    private final String SQL_READALL = "SELECT * FROM solicitud;";

    private static final Conexion con = Conexion.conectar();

    public boolean crear(SolicitudDTO s) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareStatement(SQL_CREATE);
            ps.setTimestamp(1, s.getFecha());
            ps.setInt(2, s.getCliente().getId());
            ps.setInt(3, s.getProducto().getId());
            ps.setInt(4, s.getPersonal().getId());
            ps.setString(5, s.getEstado().toString());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public boolean modificar(SolicitudDTO s) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareStatement(SQL_UPDATE);
            ps.setTimestamp(1, s.getFecha());
            ps.setInt(2, s.getCliente().getId());
            ps.setInt(3, s.getProducto().getId());
            ps.setInt(4, s.getPersonal().getId());
            ps.setString(5, s.getEstado().toString());
            ps.setInt(6, s.getId());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }
    
    public boolean aprobar(int id) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareStatement("UPDATE solicitud SET estado = ? WHERE id = ?;");
            ps.setString(1, EstadoSolicitudEmun.APROBADA.toString());
            ps.setInt(2, id);

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }
    public boolean rechazar(int id) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareStatement("UPDATE solicitud SET estado = ? WHERE id = ?;");
            ps.setString(1, EstadoSolicitudEmun.RECHAZADA.toString());
            ps.setInt(2, id);

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }
    
    public boolean pendiente(int id) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareStatement("UPDATE solicitud SET estado = ? WHERE id = ?;");
            ps.setString(1, EstadoSolicitudEmun.PENDIENTE.toString());
            ps.setInt(2, id);

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public SolicitudDTO buscarPorId(int id) {

        PreparedStatement ps;
        ResultSet rs;
        SolicitudDTO solicitud = null;

        try {
            ps = con.getConexion().prepareStatement(SQL_READ);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {

                solicitud = new SolicitudDTO(rs.getInt(1), rs.getTimestamp(2), new ClienteDAO().buscarPorId(rs.getInt(3)), new ProductoDAO().buscarPorId(rs.getInt(4)), new PersonalDAO().buscarPorId(rs.getInt(5)), EstadoSolicitudEmun.valueOf(rs.getString(6)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return solicitud;
    }

    public List<SolicitudDTO> listarTodos() {

        PreparedStatement ps;
        ResultSet rs;
        ArrayList<SolicitudDTO> lista = new ArrayList<>();

        try {
            ps = con.getConexion().prepareStatement(SQL_READALL);

            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(new SolicitudDTO(rs.getInt(1), rs.getTimestamp(2), new ClienteDAO().buscarPorId(rs.getInt(3)), new ProductoDAO().buscarPorId(rs.getInt(4)), new PersonalDAO().buscarPorId(rs.getInt(5)), EstadoSolicitudEmun.valueOf(rs.getString(6))));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return lista;
    }

}
