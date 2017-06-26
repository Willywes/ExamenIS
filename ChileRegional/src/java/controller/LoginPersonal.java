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
@WebServlet(name = "LoginPaciente", urlPatterns = {"/admin/login-personal.do"})
public class LoginPersonal extends HttpServlet {

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
            out.println("<title>Servlet LoginPaciente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginPaciente at " + request.getContextPath() + "</h1>");
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

        Map<String, String> mapMensajes = new HashMap<>();
        int rut;

        String tempRut = request.getParameter("rut");
        String clave = request.getParameter("clave");

        if (tempRut.trim().length() == 0) {
            mapMensajes.put("rut", "Ingrese un Rut sin punto ni digito verificador.");
        }

        if (clave.trim().length() == 0) {
            mapMensajes.put("clave", "Ingrese una clave de acceso.");
        }

        try {
            rut = Integer.parseInt(tempRut);
        } catch (Exception ex) {
            mapMensajes.put("rut", "Error en el rut, ingrese solo números sin digito verificador ni puntos.");
            rut = 0;
        }

        if (mapMensajes.isEmpty()) {

            try {
                if (new PersonalDAO().validarExiste(rut)) {

                    if (new PersonalDAO().validarAcceso(rut, clave)) {

                        userSession = request.getSession();

                        PersonalDTO personal = new PersonalDAO().buscarPorRut(rut);
                        userSession.setAttribute("personal", personal);
                        userSession.setAttribute("tipoUsuario", new TipoUsuarioDAO().buscarPorId(personal.getId()).getNombre());

                        //request.getRequestDispatcher("/sistema/dashboard.jsp").forward(request, response);
                        response.sendRedirect("panel.jsp");
                        return;

                    } else {
                        mapMensajes.put("clave", "Clave incorrecta.");
                    }

                } else {
                    mapMensajes.put("rut", "No existe un usuario con este RUT.");
                }
            } catch (Exception e) {
                mapMensajes.put("basededatos", "Error de conexion.");
            }

        }

        request.setAttribute("mapMensajes", mapMensajes);
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);

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
