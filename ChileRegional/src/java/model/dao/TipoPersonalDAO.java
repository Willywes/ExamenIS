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
import model.dto.TipoPersonalDTO;

/**
 *
 * @author Willywes
 */
public class TipoPersonalDAO {

    private final String SQL_READ = "SELECT * FROM tipo_usuario WHERE id = ?;";
    private final String SQL_READALL = "SELECT * FROM tipo_usuario;";

    private static final Conexion con = Conexion.conectar();

    
    public TipoPersonalDTO buscarPorId(int id){
        
        PreparedStatement ps;
        ResultSet rs;
        TipoPersonalDTO tipo = null;

        try {

            ps = con.getConexion().prepareCall(SQL_READ);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                tipo = new TipoPersonalDTO(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoPersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return tipo;
        
    }
    
    // listamos los tipos de usuarios
    public List<TipoPersonalDTO> listarTodos() {

        PreparedStatement ps;
        ResultSet rs;
        ArrayList<TipoPersonalDTO> lista = new ArrayList<TipoPersonalDTO>();

        try {

            ps = con.getConexion().prepareCall(SQL_READALL);
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(new TipoPersonalDTO(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoPersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return lista;
    }
}
