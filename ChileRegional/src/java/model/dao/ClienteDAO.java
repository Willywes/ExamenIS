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
import model.dto.ClienteDTO;

/**
 *
 * @author Willywes
 */
public class ClienteDAO {

    private final String SQL_CREATE = "INSERT INTO cliente (rut, dv, clave, fecha_nac, nombres, paterno, materno, sexo, direccion, telefono, email) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
    private final String SQL_UPDATE = "UPDATE cliente SET rut = ?, dv = ?, clave = ?, fecha_nac = ?, nombres = ?, paterno = ?, materno = ?, sexo = ?, direccion = ?, telefono = ?, email = ? WHERE id = ?";
    private final String SQL_READ = "SELECT * from cliente WHERE id = ?";
    private final String SQL_READALL = "SELECT * from cliente";

    private static final Conexion con = Conexion.conectar();

    public boolean crear(ClienteDTO c) {

        PreparedStatement ps;

        try {

            ps = con.getConexion().prepareStatement(SQL_CREATE);

            ps.setInt(1, c.getRut());
            ps.setString(2, c.getDv().toUpperCase());
            ps.setString(3, c.getClave());
            ps.setTimestamp(4, c.getFechaNac());
            ps.setString(5, c.getNombres().toUpperCase());
            ps.setString(6, c.getPaterno().toUpperCase());
            ps.setString(7, c.getMaterno().toUpperCase());
            ps.setString(8, c.getSexo().toUpperCase());
            ps.setString(9, c.getDireccion().toUpperCase());
            ps.setInt(10, c.getTelefono());
            ps.setString(11, c.getEmail().toLowerCase());

            if (ps.executeUpdate() > 0) {

                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public boolean modificar(ClienteDTO c) {

        PreparedStatement ps;

        try {

            ps = con.getConexion().prepareStatement(SQL_UPDATE);

            ps.setInt(1, c.getRut());
            ps.setString(2, c.getDv().toUpperCase());
            ps.setString(3, c.getClave());
            ps.setTimestamp(4, c.getFechaNac());
            ps.setString(5, c.getNombres().toUpperCase());
            ps.setString(6, c.getPaterno().toUpperCase());
            ps.setString(7, c.getMaterno().toUpperCase());
            ps.setString(8, c.getSexo().toUpperCase());
            ps.setString(9, c.getDireccion().toUpperCase());
            ps.setInt(10, c.getTelefono());
            ps.setString(11, c.getEmail().toLowerCase());
            ps.setInt(12, c.getId());

            if (ps.executeUpdate() > 0) {

                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }

    public ClienteDTO buscarPorId(int id) {

        PreparedStatement ps;
        ResultSet rs;
        ClienteDTO cliente = null;

        try {

            ps = con.getConexion().prepareStatement(SQL_READ);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {

                cliente = new ClienteDTO(
                        rs.getInt(1), //id
                        rs.getInt(2), // rut
                        rs.getString(3), //dv
                        rs.getString(4), //clave
                        rs.getTimestamp(5), //fecha 
                        rs.getString(6), //nombres
                        rs.getString(7), //paterno
                        rs.getString(8), // materno
                        rs.getString(9), // sexo
                        rs.getString(10), // direccion
                        rs.getInt(11), //telefono
                        rs.getString(12) //email
                );
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return cliente;
    }

    public List<ClienteDTO> leerTodos() {

        PreparedStatement ps;
        ResultSet rs;
        ArrayList<ClienteDTO> lista = new ArrayList<ClienteDTO>();

        try {

            ps = con.getConexion().prepareCall(SQL_READALL);

            rs = ps.executeQuery();

            while (rs.next()) {

                lista.add(new ClienteDTO(
                        rs.getInt(1), //id
                        rs.getInt(2), // rut
                        rs.getString(3), //dv
                        rs.getString(4), //clave
                        rs.getTimestamp(5), //fecha 
                        rs.getString(6), //nombres
                        rs.getString(7), //paterno
                        rs.getString(8), // materno
                        rs.getString(9), // sexo
                        rs.getString(10), // direccion
                        rs.getInt(11), //telefono
                        rs.getString(12) //email
                ));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return lista;
    }
    
    public boolean validarExiste(int rut) {

        PreparedStatement ps;
        ResultSet rs;
        int rutBuscar = 0;

        try {

            ps = con.getConexion().prepareStatement("SELECT rut FROM cliente WHERE rut = ?;");
            ps.setInt(1, rut);

            rs = ps.executeQuery();

            if (rs.next()) {

                rutBuscar =  rs.getInt(1); // rut
            }
            
            if (rut == rutBuscar) {
                
                return true;
            } 

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }
    
    public boolean validarAcesso(int rut, String clave) {

        PreparedStatement ps;
        ResultSet rs;
        int rutBuscar = 0;
        String claveBuscar = "";

        try {

            ps = con.getConexion().prepareStatement("SELECT rut, clave FROM cliente WHERE rut = ?;");
            ps.setInt(1, rut);

            rs = ps.executeQuery();

            if (rs.next()) {

                rutBuscar =  rs.getInt(1); // rut
                claveBuscar = rs.getString(2);
            }
            
            if (rut == rutBuscar && clave.equals(claveBuscar)) {
                
                return true;
            } 

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return false;
    }
}
