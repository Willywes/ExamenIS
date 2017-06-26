/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.PersonalDAO;
import model.dao.TipoUsuarioDAO;
import model.dto.PersonalDTO;

/**
 *
 * @author Willywes
 */
@WebServlet(name = "GestionPersonal", urlPatterns = {"/admin/gestion-personal.do"})
public class GestionPersonal extends HttpServlet {

    HttpSession userSession;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GestionPersonal</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GestionPersonal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        userSession = request.getSession();

        if (null == userSession.getAttribute("personal")) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("panel.jsp");
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        userSession = request.getSession();

        // Instancias
        Map<String, String> mapMensajes = new HashMap<>();
        String mensaje = null;

        // Recibir Parametros
        String rutTemp = request.getParameter("rut");
        String dv = request.getParameter("dv");
        String nombres = request.getParameter("nombres");
        String paterno = request.getParameter("paterno");
        String materno = request.getParameter("materno");
        String telefonoTemp = request.getParameter("telefono");
        String email = request.getParameter("email");
        String tipoTemp = request.getParameter("tipo");

        int rut = 0;
        int telefono = 0;
        int tipo = Integer.parseInt(tipoTemp);
        String clave = "1234";

        if (rutTemp.isEmpty()) {
            mapMensajes.put("rut", "Ingrese un Rut");
        }

        try {
            rut = Integer.parseInt(rutTemp);
        } catch (Exception e) {
            mapMensajes.put("rut", "El rut debe ser númerico.");
        }
        try {
            telefono = Integer.parseInt(telefonoTemp);
        } catch (Exception e) {
            mapMensajes.put("telefono", "El telefono debe ser númerico.");
        }

        if (tipo == 0) {
            mapMensajes.put("tipo", "Selecciona un tipo de usuario.");
        }

        PersonalDTO personal = new PersonalDTO(0, rut, dv, clave, nombres, paterno, materno, telefono, email, true, new TipoUsuarioDAO().buscarPorId(tipo));

        if (mapMensajes.isEmpty()) {

            if (!new PersonalDAO().validarExiste(rut)) {

                if (new PersonalDAO().crear(personal)) {
                    mensaje = "Usuario Registrado Correctamente.";
                    request.setAttribute("mensaje", mensaje);
                    request.getRequestDispatcher("/admin/gestion-personal.jsp").forward(request, response);
                    return;
                }
            } else {
                mensaje = "El usuario ya esta registrado.";
            }

        } else {
            mensaje = "No se pudo registrar el usuario.";
        }

        request.setAttribute("registroPersonal", personal);
        request.setAttribute("mapMensajes", mapMensajes);
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("/admin/gestion-personal.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
