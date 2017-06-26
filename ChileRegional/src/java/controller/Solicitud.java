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
import model.dao.SolicitudDAO;

/**
 *
 * @author Willywes
 */
@WebServlet(name = "Solicitud", urlPatterns = {"/admin/solicitud.do"})
public class Solicitud extends HttpServlet {

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
            out.println("<title>Servlet Solicitud</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Solicitud at " + request.getContextPath() + "</h1>");
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
        String mensaje = null;
        
        String accion = request.getParameter("accion");
        
        // aprobar
        if (accion.equals("aprobar")) {
            int id = Integer.parseInt(request.getParameter("idSolicitud"));
            
            if (true) {
                
                if (new SolicitudDAO().aprobar(id)) {
                    mensaje = "Solicitud Aprobada";
                    request.setAttribute("mensaje", mensaje);
                    request.getRequestDispatcher("/admin/solicitud.jsp").forward(request, response);
                    return;
                }else{
                    mensaje = "No se pudo aprobar la Solicitud";
                }
            }
            
        }
        
        // rechazar
        if (accion.equals("rechazar")) {
            int id = Integer.parseInt(request.getParameter("idSolicitud"));
            
            if (true) {
                
                if (new SolicitudDAO().rechazar(id)) {
                    mensaje = "Solicitud Rechazada";
                    request.setAttribute("mensaje", mensaje);
                    request.getRequestDispatcher("/admin/solicitud.jsp").forward(request, response);
                    return;
                }else{
                    mensaje = "No se pudo rechazar la Solicitud";
                }
            }
        }
        
        // rechazar
        if (accion.equals("pendiente")) {
            int id = Integer.parseInt(request.getParameter("idSolicitud"));
            
            if (true) {
                
                if (new SolicitudDAO().pendiente(id)) {
                    mensaje = "La solicitud se ha dejado en estado PENDIENTE";
                    request.setAttribute("mensaje", mensaje);
                    request.getRequestDispatcher("/admin/solicitud.jsp").forward(request, response);
                    return;
                }else{
                    mensaje = "No se cambiar el estado de la Solicitud";
                }
            }
        }
        
        request.setAttribute("mapMensajes", mapMensajes);
        request.getRequestDispatcher("/admin/solicitud.jsp").forward(request, response);
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
