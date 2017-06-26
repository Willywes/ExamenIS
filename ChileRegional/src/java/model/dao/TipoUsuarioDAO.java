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
import model.dto.TipoUsuarioDTO;

/**
 *
 * @author Willywes
 */
public class TipoUsuarioDAO {

    private final String SQL_READ = "SELECT * FROM tipo_usuario WHERE id = ?;";
    private final String SQL_READALL = "SELECT * FROM tipo_usuario;";

    private static final Conexion con = Conexion.conectar();

    
    public TipoUsuarioDTO buscarPorId(int id){
        
        PreparedStatement ps;
        ResultSet rs;
        TipoUsuarioDTO tipo = null;

        try {

            ps = con.getConexion().prepareStatement(SQL_READ);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                tipo = new TipoUsuarioDTO(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return tipo;
        
    }
    
    // listamos los tipos de usuarios
    public List<TipoUsuarioDTO> listarTodos() {

        PreparedStatement ps;
        ResultSet rs;
        ArrayList<TipoUsuarioDTO> lista = new ArrayList<TipoUsuarioDTO>();

        try {

            ps = con.getConexion().prepareStatement(SQL_READALL);
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(new TipoUsuarioDTO(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.desconectar();
        }

        return lista;
    }
}
