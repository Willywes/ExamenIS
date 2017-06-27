/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.ClienteDAO;
import model.dao.PersonalDAO;
import model.dao.ProductoDAO;
import model.dao.SolicitudDAO;
import model.dto.PersonalDTO;
import model.dto.SolicitudDTO;
import utils.EstadoSolicitudEmun;

/**
 *
 * @author Willywes
 */
@WebServlet(name = "ConfirmarSolicitud", urlPatterns = {"/confirmar-solicitud.do"})
public class ConfirmarSolicitud extends HttpServlet {

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
            out.println("<title>Servlet ConfirmarSolicitud</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmarSolicitud at " + request.getContextPath() + "</h1>");
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

        int idPro = Integer.parseInt(request.getParameter("idProducto"));
        int idCli = Integer.parseInt(request.getParameter("idCliente"));

        List<PersonalDTO> listaPersonal = new PersonalDAO().leerTodos();
        List<PersonalDTO> listaVendedores = new ArrayList<PersonalDTO>();

        for (PersonalDTO item : listaPersonal) {

            if (item.getTipoUsuario().getNombre().equals("VENDEDOR")) {
                listaVendedores.add(item);
            }

        }
        int n = listaVendedores.size();

        int numero = (int) (Math.random() * n);

        PersonalDTO venFinal = listaVendedores.get(numero);

        try {

            //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Timestamp fecha = new Timestamp(new Date().getTime());

            if (new SolicitudDAO().crear(new SolicitudDTO(0, fecha, new ClienteDAO().buscarPorId(idCli), new ProductoDAO().buscarPorId(idPro), venFinal, EstadoSolicitudEmun.PENDIENTE))) {
                mapMensajes.put("rut", "Solicitud Registrada Correctamente.");
                request.setAttribute("mapMensajes", mapMensajes);
                request.getRequestDispatcher("confirmacion.jsp").forward(request, response);
            } else {
                mapMensajes.put("rut", "No se pudo Registrar la solicitud.");
            }
        } catch (Exception ez) {
            mapMensajes.put("basededatos", "Error de conexion. " + ez.getMessage());
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
