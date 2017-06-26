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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.CategoriaDAO;
import model.dao.ProductoDAO;
import model.dto.CategoriaDTO;
import model.dto.ProductoDTO;

/**
 *
 * @author Willywes
 */
@WebServlet(name = "GestionProductos", urlPatterns = {"/admin/gestion-productos.do"})
public class GestionProductos extends HttpServlet {

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
            out.println("<title>Servlet GestionProductos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GestionProductos at " + request.getContextPath() + "</h1>");
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

        ProductoDTO producto = null;

        // Instancias
        Map<String, String> mapMensajes = new HashMap<>();
        String mensaje = null;

        String accion = request.getParameter("accion");

        String nombreCategoria = null;

        // guardar categoria
        if (accion.equals("guardar-categoria")) {

            nombreCategoria = request.getParameter("nombre-categoria");

            if (new CategoriaDAO().crear(new CategoriaDTO(0, nombreCategoria))) {
                mensaje = "Categoria registradada correctamente.";
                request.setAttribute("mensaje", mensaje);
                request.getRequestDispatcher("/admin/gestion-productos.jsp").forward(request, response);
                return;

            } else {
                mensaje = "No se registro la Categoria.";
            }
        }

        // guardar producto
        if (accion.equals("guardar-producto")) {

            String nombreProducto = request.getParameter("nombre-producto");
            String descripcion = request.getParameter("descripcion-producto");
            String valorUFTemp = request.getParameter("valoruf-producto");
            String idCategoriaTemp = request.getParameter("id-categoria");

            float valorUF = 0;
            int idCategoria = Integer.parseInt(idCategoriaTemp);

            try {
                valorUF = Float.parseFloat(valorUFTemp);
            } catch (Exception e) {
                mapMensajes.put("uf", "Error en el valor de la UF.");
            }
            if (idCategoria == 0) {
                mapMensajes.put("idCategoria", "Selecciona una categoría para el producto.");
            }
            try {
                producto = new ProductoDTO(0, nombreProducto, descripcion, valorUF, new CategoriaDAO().buscarPorId(idCategoria));

                if (new ProductoDAO().crear(producto)) {
                    producto = null;
                    mensaje = "Producto registrado correctamente.";
                    request.setAttribute("mensaje", mensaje);
                    request.getRequestDispatcher("/admin/gestion-productos.jsp").forward(request, response);
                    return;

                } else {
                    mensaje = "No se pudo registrar el producto.";
                }
            } catch (Exception e) {
                mensaje = "No se pudo registrar el producto.";
                mapMensajes.put("producto-categoria", "Selecciona una categoría para el producto.");
            }

        }

        //eliminar categoria
        if (accion.equals("eliminar-categoria")) {
            int idCat = Integer.parseInt(request.getParameter("idCategoriaDelete"));
            if (new CategoriaDAO().eliminar(idCat)) {

                mensaje = "Categoría eliminada correctamente.";
                request.setAttribute("mensaje", mensaje);
                request.getRequestDispatcher("/admin/gestion-productos.jsp").forward(request, response);
                return;

            } else {
                mensaje = "No se pudo eliminar la categoría.";
            }
        }

        //eliminar producto
        if (accion.equals("eliminar-producto")) {
            int idPro = Integer.parseInt(request.getParameter("idProductoDelete"));
            if (new ProductoDAO().eliminar(idPro)) {

                mensaje = "Producto eliminado correctamente.";
                request.setAttribute("mensaje", mensaje);
                request.getRequestDispatcher("/admin/gestion-productos.jsp").forward(request, response);
                return;

            } else {
                mensaje = "No se pudo eliminar el producto.";
            }
        }

        // modificar categoria
        if (accion.equals("modificar-categoria")) {

            String nombre = request.getParameter("nombreCategoriaMod");
            int id = Integer.parseInt(request.getParameter("idCategoriaMod"));

            if (new CategoriaDAO().modificar(new CategoriaDTO(id, nombre))) {
                mensaje = "Categoria modificada correctamente.";
                request.setAttribute("mensaje", mensaje);
                request.getRequestDispatcher("/admin/gestion-productos.jsp").forward(request, response);
                return;

            } else {
                mensaje = "No se modifico la Categoria.";
            }
        }

        // modificar producto
        if (accion.equals("modificar-producto")) {

            String idTemp = request.getParameter("idProMod");
            String nombreProducto = request.getParameter("nombreProMod");
            String descripcion = request.getParameter("descProMod");
            String valorUFTemp = request.getParameter("valorProMod");
            String idCategoriaTemp = request.getParameter("idCatMod");

            int id = Integer.parseInt(idTemp);
            float valorUF = 0;
            int idCategoria = Integer.parseInt(idCategoriaTemp);

            try {
                valorUF = Float.parseFloat(valorUFTemp);
            } catch (Exception e) {
                mapMensajes.put("uf", "Error en el valor de la UF.");
            }
            if (idCategoria == 0) {
                mapMensajes.put("idCategoria", "Selecciona una categoría para el producto.");
            }

            try {
                producto = new ProductoDTO(id, nombreProducto, descripcion, valorUF, new CategoriaDAO().buscarPorId(idCategoria));

                if (new ProductoDAO().modificar(producto)) {
                    producto = null;
                    mensaje = "Producto modificado correctamente.";
                    request.setAttribute("mensaje", mensaje);
                    request.getRequestDispatcher("/admin/gestion-productos.jsp").forward(request, response);
                    return;

                } else {
                    mensaje = "No se pudo modificar el producto.";
                }
            } catch (Exception e) {
                mensaje = "No se pudo modificar el producto.";
                mapMensajes.put("producto-categoria", "Selecciona una categoría para el producto.");
            }

        }

        request.setAttribute("producto", producto);
        request.setAttribute("mapMensajes", mapMensajes);
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("/admin/gestion-productos.jsp").forward(request, response);
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
