/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.dto.SolicitudBeneficiarioDTO;

/**
 *
 * @author Willywes
 */
public class SolicitudBeneficiarioDAO {
    
    private final String SQL_CREATE = "INSERT INTO solicitud_beneficiario VALUES (?,?,?);";
    private final String SQL_DELETE = "DELETE FROM solicitud_beneficiario WHERE solicitud_id = ? AND beneficiario_id = ?;";
    private final String SQL_MODIFICAR = "UPDATE solicitud_beneficiario SET porcentaje = ? WHERE solicitud_id = ? AND beneficiario_id = ?;";
    
    
    private static final Conexion con = Conexion.conectar();
    
    public boolean guardar(SolicitudBeneficiarioDTO sb){
        
        PreparedStatement ps;
        
        try {
            ps = con.getConexion().prepareStatement(SQL_CREATE);
            ps.setInt(1, sb.getSolicitudId());
            ps.setInt(1, sb.getBeneficiario().getId());
            ps.setInt(1, sb.getPorcentaje());
            
            if (ps.executeUpdate() > 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SolicitudBeneficiarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            con.desconectar();
        }
        
        
        return false;
    }
    
    public boolean guardar(int solicitudId, int beneficiarioId, int porcentaje){
        
        PreparedStatement ps;
        
        try {
            ps = con.getConexion().prepareStatement(SQL_CREATE);
            ps.setInt(1, solicitudId);
            ps.setInt(1, beneficiarioId);
            ps.setInt(1, porcentaje);
            
            if (ps.executeUpdate() > 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SolicitudBeneficiarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            con.desconectar();
        }
        
        
        return false;
    }
    
    public boolean eliminar(int solicitudId, int beneficiarioId){
        
        PreparedStatement ps;
        
        try {
            ps = con.getConexion().prepareStatement(SQL_DELETE);
            ps.setInt(1, solicitudId);
            ps.setInt(1, beneficiarioId);
            
            if (ps.executeUpdate() > 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SolicitudBeneficiarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            con.desconectar();
        }
        
        
        return false;
    }
    
    public boolean cambiarPorcentaje(int solicitudId, int beneficiarioId, int porcentaje){
        
        PreparedStatement ps;
        
        try {
            ps = con.getConexion().prepareStatement(SQL_CREATE);
            ps.setInt(1, solicitudId);
            ps.setInt(1, beneficiarioId);
            ps.setInt(1, porcentaje);
            
            if (ps.executeUpdate() > 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SolicitudBeneficiarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            con.desconectar();
        }
        
        
        return false;
    }
}
