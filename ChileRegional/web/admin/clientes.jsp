<%-- 
    Document   : panel
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

<%@page import="model.dao.ProductoDAO"%>
<%@page import="model.dao.SolicitudDAO"%>
<%@page import="model.dto.SolicitudDTO"%>
<%@page import="controller.Solicitud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dto.PersonalDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.dto.ClienteDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- UIkit CSS -->
        <link rel="stylesheet" href="assets/css/uikit.min.css" />
        <link rel="stylesheet" href="assets/css/custom.css" />

        <!-- jQuery is required -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- UIkit JS -->
        <script src="assets/js/uikit.min.js"></script>
        <script src="assets/js/uikit-icons.min.js"></script>

        <!--growl -->
        <script src="assets/js/jquery.growl.js" type="text/javascript"></script>
        <link href="assets/css/jquery.growl.css" rel="stylesheet" type="text/css" />


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
    </head>
    <body>

        <!-- header -->
        <header>

            <%@include file="navbar.jsp" %>


        </header>
        <!-- fin del header -->

        <div class="uk-container">
            <br>
            <div class="uk-margin" uk-grid>

                <div class="uk-width-1-1">


                    <div class="uk-grid">
                        <div class="uk-width-3-4">
                            <h3>LISTA DE CLIENTES</h3>
                        </div>
                        <div class="uk-width-1-4">

                        </div>
                    </div>
                    <table class="uk-table uk-table-striped uk-table-small uk-table-hover">
                        <thead>
                            <tr>
                                <th>RUT</th>
                                <th>Nombre</th>
                                <th>F. de Nacimiento</th>
                                <th>Teléfono</th>
                                <th>EMail</th>
                                <th>Solicitudes</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%                                List<ClienteDTO> listaCliente = null;
                                SimpleDateFormat sdf = new SimpleDateFormat("dd-MMMM-yyyy");
                                String tipo = null;
                                try {

                                    userSession = request.getSession();
                                    if (null != userSession.getAttribute("tipoUsuario")) {
                                        tipo = userSession.getAttribute("tipoUsuario").toString();
                                    }

                                    if (tipo.equals("VENDEDOR")) {

                                        if (null != userSession.getAttribute("personal")) {

                                            PersonalDTO per = (PersonalDTO) userSession.getAttribute("personal");
                                            listaCliente = new ArrayList<ClienteDTO>();
                                            List<SolicitudDTO> listSoli = new SolicitudDAO().listarTodos();

                                            for (SolicitudDTO c : listSoli) {
                                                if (c.getPersonal().getId() == per.getId()) {
                                                    boolean flag = false; // verificar si existe el tipo
                                                    for (ClienteDTO item : listaCliente) {

                                                        if (item.getId() == c.getCliente().getId()) {
                                                            flag = true;
                                                        }

                                                    }
                                                    if (!flag) {
                                                        listaCliente.add(new ClienteDAO().buscarPorId(c.getCliente().getId()));
                                                    }

                                                }
                                            }

                                        }

                                    } else {

                                        listaCliente = new ClienteDAO().leerTodos();
                                    }

                                } catch (Exception ex) {
                                    out.println(ex.getMessage());
                                }

                                for (ClienteDTO p : listaCliente) {
                                    out.println("<tr>");
                                    out.println("<td>" + p.getRut() + "-" + p.getDv() + "</td>");
                                    out.println("<td>" + p.getNombres() + " " + p.getPaterno() + " " + p.getMaterno() + "</td>");
                                    out.println("<td>" + sdf.format(p.getFechaNac()) + "</td>");
                                    out.println("<td>" + p.getTelefono() + "</td>");
                                    out.println("<td>" + p.getEmail() + "</td>");
                                    List<SolicitudDTO> listaSolicitud = new SolicitudDAO().listarPorClientes(p.getId());
                                    out.println("<td>");
                                    out.println("<button  type='submit'  uk-toggle=\"target: #mod" + p.getId() + "\" class='uk-button uk-button-primary uk-button-small' data-uk-tooltip title='Ver (" + listaSolicitud.size() + ") Solicitudes'><span uk-icon='icon: search'></span></i> (" + listaSolicitud.size() + ")</button>");
                                    
                                    // formulario modal
                                    out.println("<div id=\"mod" + p.getId() + "\" uk-modal><div class=\"uk-modal-dialog uk-modal-body\"><h2 class=\"uk-modal-title\"></h2><button class=\"uk-modal-close-default uk-close uk-icon\" type=\"button\"><span uk-icon=\"icon: close\"></span></button>");

                                    out.print("<h2>Solicitudes del Cliente </h2>");
                                    out.print("<div>CLIENTE : " + p.getNombres() + " " + p.getPaterno() + " " + p.getMaterno() + "</div>");

                                    out.print("<table class='uk-table uk-table-striped uk-table-small uk-table-hover'>");
                                    out.print("<thead><tr><th>ID Soli.</th><th>FECHA Solicitud.</th><th>PRODUCTO</th><th>ESTADO</th></tr></thead>");
                                    out.print("<tbody>");
                                    for (SolicitudDTO item : listaSolicitud) {
                                        out.println("<tr><td>" + item.getId() + "</td>");
                                        out.println("<td>" + sdf.format(item.getFecha()) + "</td>");
                                        
                                        String nomPro = "Sin Producto";
                                        try{
                                             nomPro = new ProductoDAO().buscarPorId(item.getProducto().getId()).getNombre();
                                        }catch(Exception e){
                                           
                                        }
                                        out.println("<td>" + nomPro + "</td>");

                                        if (item.getEstado().toString().equals("RECHAZADA")) {
                                            out.println("<td style='color:red;'><strong>" + item.getEstado().toString() + "</strong></td>");
                                        }
                                        if (item.getEstado().toString().equals("APROBADA")) {
                                            out.println("<td style='color:green;'><strong>" + item.getEstado().toString() + "</strong></td>");
                                        }
                                        if (item.getEstado().toString().equals("PENDIENTE")) {
                                            out.println("<td style='color:blue;'><strong>" + item.getEstado().toString() + "</strong></td>");
                                        }
                                        out.println("</tr>");
                                    }

                                    out.println("</tbody></table></div></div></td>");
                                    
                                    
                                    out.println("<td><a target='_blank' href='tel:+" + p.getTelefono() + "' class='uk-button uk-button-primary uk-button-small' data-uk-tooltip title='Llamar a Cliente'style='background-color : orange;'><span uk-icon='icon: phone'></span></i></a>&nbsp;");
                                    out.println("<a target='_blank' href='mailto:" + p.getEmail() + "'class='uk-button uk-button-primary uk-button-small' data-uk-tooltip title='Enviar E-Mail a Cliente'style='background-color : green;'><span uk-icon='icon: mail'></span></i></a></td>");
                                    
                                    
                                    out.println("</tr>");
                                    

                                    

                                }
out.println("</tbody></table>");

                            %>


                            </div>


                            </div>
                            </div>

                            </body>
                            </html>
