/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Willywes
 */
public class Conexion {

    public static Conexion instace;
    private Connection cn;
    private final String DRIVER = "com.mysql.jdbc.Driver";
    private final String URL = "jdbc:mysql://localhost:3306/";
    private final String DB = "chile_regional";
    private final String USER = "root";
    private final String PASS = "";

    private Conexion() {

        try {
            Class.forName(DRIVER);
            cn = DriverManager.getConnection(URL + DB, USER, PASS);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

    public synchronized static Conexion conectar() {
        if (instace == null) {
            instace = new Conexion();
        }
        return instace;
    }

    public Connection getConexion() {
        return cn;
    }

    public void desconectar() {
        instace = null;
    }
}
