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

/**
 *
 * @author Willywes
 */
public class BeneficiarioDAO {

    private final String SQL_CREATE = "INSERT INTO beneficiario (rut, dv, nombres, paterno, materno, telefono, email, cliente_id) VALUES (?,?,?,?,?,?,?,?);";
    private final String SQL_UPDATE = "UPDATE beneficiario SET rut = ?, dv = ?, nombres = ?, paterno = ?, materno = ?, telefono = ?, email =?, cliente_id = ? WHERE id = ?;";
    private final String SQL_READ = "SELECT * FROM beneficiario WHERE id = ?;";
    private final String SQL_READALL = "SELECT * FROM beneficiario ";

    private static final Conexion con = Conexion.conectar();

    public boolean crear(BeneficiarioDTO b) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareStatement(SQL_CREATE);
            ps.setInt(1, b.getRut());
            ps.setString(2, b.getDv());
            ps.setString(3, b.getNombres());
            ps.setString(4, b.getPaterno());
            ps.setString(5, b.getMaterno());
            ps.setInt(6, b.getTelefono());
            ps.setString(7, b.getEmail());
            ps.setInt(8, b.getCliente().getId());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BeneficiarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public boolean modificar(BeneficiarioDTO b) {

        PreparedStatement ps;

        try {
            ps = con.getConexion().prepareStatement(SQL_UPDATE);
            ps.setInt(1, b.getRut());
            ps.setString(2, b.getDv());
            ps.setString(3, b.getNombres());
            ps.setString(4, b.getPaterno());
            ps.setString(5, b.getMaterno());
            ps.setInt(6, b.getTelefono());
            ps.setString(7, b.getEmail());
            ps.setInt(8, b.getCliente().getId());
            ps.setInt(9, b.getId());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BeneficiarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public BeneficiarioDTO buscarPorId(int id) {

        PreparedStatement ps;
        ResultSet rs;
        BeneficiarioDTO beneficiario = null;

        try {
            ps = con.getConexion().prepareStatement(SQL_READ);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {
                beneficiario = new BeneficiarioDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), new ClienteDAO().buscarPorId(rs.getInt(9)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BeneficiarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return beneficiario;
    }

    public List<BeneficiarioDTO> listarTodos() {

        PreparedStatement ps;
        ResultSet rs;
        ArrayList<BeneficiarioDTO> lista = new ArrayList<>();

        try {
            ps = con.getConexion().prepareStatement(SQL_READALL);

            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(new BeneficiarioDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), new ClienteDAO().buscarPorId(rs.getInt(9))));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BeneficiarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return lista;
    }

}
