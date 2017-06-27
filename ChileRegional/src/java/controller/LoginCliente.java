/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.ClienteDAO;
import model.dto.ClienteDTO;

/**
 *
 * @author Willywes
 */
@WebServlet(name = "LoginCliente", urlPatterns = {"/login-cliente.do"})
public class LoginCliente extends HttpServlet {

    HttpSession clienteSession;

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
            out.println("<title>Servlet LoginCliente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginCliente at " + request.getContextPath() + "</h1>");
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

        clienteSession = request.getSession();

        if (null == clienteSession.getAttribute("cliente")) {
            response.sendRedirect("solicita-tu-seguro.jsp");
        } else {
            response.sendRedirect("solicita-tu-seguro.jsp");
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

        String accion = request.getParameter("accion");
        String idProducto = null;

        if (accion.equals("logearFront")) {

            try {

                int rut = Integer.parseInt(request.getParameter("rut"));
                String clave = request.getParameter("clave");
                idProducto = request.getParameter("idPro");

                if (new ClienteDAO().validarExiste(rut)) {

                    if (new ClienteDAO().validarAcesso(rut, clave)) {
                        clienteSession = request.getSession();

                        clienteSession.setAttribute("cliente", new ClienteDAO().buscarPorRut(rut));

                        response.sendRedirect("solicita-tu-seguro.jsp");
                        return;
                    } else {
                        mapMensajes.put("clave", "Clave incorrecta.");
                        request.setAttribute("mapMensajes", mapMensajes);
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }

                } else {
                    mapMensajes.put("rut", "No existe un usuario con este RUT.");
                    request.setAttribute("mapMensajes", mapMensajes);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } catch (Exception e) {
                mapMensajes.put("basededatos", "Error de conexion.");
                request.setAttribute("mapMensajes", mapMensajes);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        }

        if (accion.equals("logear")) {

            try {

                int rut = Integer.parseInt(request.getParameter("rut"));
                String clave = request.getParameter("clave");
                idProducto = request.getParameter("idPro");

                if (new ClienteDAO().validarExiste(rut)) {

                    if (new ClienteDAO().validarAcesso(rut, clave)) {
                        clienteSession = request.getSession();

                        clienteSession.setAttribute("cliente", new ClienteDAO().buscarPorRut(rut));

                        mapMensajes.put("rut", "Puede continuar con el proceso de solicitud.");
                        request.setAttribute("mapMensajes", mapMensajes);
                        request.getRequestDispatcher("armar-solicitud.jsp").forward(request, response);
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

        if (accion.equals("registrar")) {

            try {

                idProducto = request.getParameter("idPro");

                int rut = Integer.parseInt(request.getParameter("rut"));
                String dv = request.getParameter("dv");
                String nombres = request.getParameter("nombres");
                String paterno = request.getParameter("paterno");
                String materno = request.getParameter("paterno");

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Timestamp fechaNac = new Timestamp((dateFormat.parse(request.getParameter("fnac"))).getTime());

                String sexo = request.getParameter("sexo");
                String direccion = request.getParameter("direccion");
                int telefono = Integer.parseInt(request.getParameter("telefono"));
                String email = request.getParameter("email");

                String clave = "1234";

                if (!new ClienteDAO().validarExiste(rut)) {

                    if (new ClienteDAO().crear(new ClienteDTO(0, rut, dv, clave, fechaNac, nombres, paterno, materno, sexo, direccion, telefono, email))) {
                        if (new ClienteDAO().validarAcesso(rut, clave)) {
                            clienteSession = request.getSession();

                            clienteSession.setAttribute("cliente", new ClienteDAO().buscarPorRut(rut));

                            mapMensajes.put("rut", "Puede continuar con el proceso de solicitud.");
                            request.setAttribute("mapMensajes", mapMensajes);
                            request.getRequestDispatcher("armar-solicitud.jsp").forward(request, response);

                        } else {
                            mapMensajes.put("rut", "Cliente Registrado. Inicie Session");
                        }

                        mapMensajes.put("rut", "Cliente Registrado.");
                    } else {
                        mapMensajes.put("clave", "No se pudo registrar, intentelo denuevo");
                    }

                } else {
                    mapMensajes.put("rut", "Usuario ya registrado, inicie sessión.");
                }
            } catch (Exception ez) {
                mapMensajes.put("basededatos", "Error de conexion. " + ez.getMessage());
            }

        }

        request.setAttribute("mapMensajes", mapMensajes);
        request.getRequestDispatcher("armar-solicitud.jsp").forward(request, response);
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
