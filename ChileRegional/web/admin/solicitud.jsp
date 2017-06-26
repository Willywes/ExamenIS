<%-- 
    Document   : panel
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="utils.EstadoSolicitudEmun"%>
<%@page import="model.dao.CategoriaDAO"%>
<%@page import="model.dto.ClienteDTO"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.dao.ProductoDAO"%>
<%@page import="model.dto.ProductoDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.dao.SolicitudDAO"%>
<%@page import="model.dto.SolicitudDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.dao.TipoUsuarioDAO"%>
<%@page import="model.dao.PersonalDAO"%>
<%@page import="model.dto.TipoUsuarioDTO"%>
<%@page import="model.dto.PersonalDTO"%>
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
        <title>Solicitudes</title>
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

                    <c:if test="${not empty mensaje}">
                        <div uk-alert>
                            <a class="uk-alert-close" uk-close></a>
                            <p style="font-size: 24px;"><c:out value="${mensaje}" /></p>
                        </div>
                    </c:if>

                    <c:if test="${not empty mapMensajes}">
                        <div uk-alert>
                            <a class="uk-alert-close" uk-close></a>
                            <div><c:out value="${mapMensajes['rut']}"/></div>
                        </div>
                    </c:if>

                    <div class="uk-grid">
                        <div class="uk-width-3-4">
                            <h3>LISTADO DE SOLICITUDES</h3>
                        </div>
                        <div class="uk-width-1-4">
                            <form action="solicitud.jsp" name="solicitudes" method="get">

                                <%                                    
                                    String v = request.getParameter("soli");
                                    int soliValue = 0;
                                    try {
                                        soliValue = Integer.parseInt(v);
                                    } catch (Exception ex) {
                                    }
                                %>

                                <select class="uk-select" name="soli" onchange="document.solicitudes.submit()">

                                    <c:set var="valor" value="<%= soliValue%>"/>
                                    <option value="0" ${4 == valor ? 'selected':''}>Todas las Solicitudes</option>
                                    <option value="1" ${1 == valor ? 'selected':''}>Pendientes</option>
                                    <option value="2" ${2 == valor ? 'selected':''}>Aprobadas</option> 
                                    <option value="3" ${3 == valor ? 'selected':''}>Rechazadas</option>
                                </select>


                            </form>
                        </div>
                    </div>
                    <table class="uk-table uk-table-striped uk-table-small uk-table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>FECHA</th>
                                <th>PRODUCTO</th>
                                <th>VENDEDOR</th>
                                <th>CLIENTE</th>
                                <th>ESTADO</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<SolicitudDTO> listaSolicitudes = null;

                                SimpleDateFormat sdf = new SimpleDateFormat("dd-MMMM-yyyy");

                                try {

                                    if (soliValue == 1) {
                                        
                                        listaSolicitudes = new ArrayList<SolicitudDTO>();

                                        for (SolicitudDTO p : new SolicitudDAO().listarTodos()) {
                                            
                                            if (p.getEstado().toString().equals("PENDIENTE")) {
                                                
                                                listaSolicitudes.add(p);
                                            }
                                        }
                                    } else if (soliValue == 2) {

                                        listaSolicitudes = new ArrayList<SolicitudDTO>();

                                        for (SolicitudDTO p : new SolicitudDAO().listarTodos()) {

                                            if (p.getEstado().toString().equals("APROBADA")) {
                                                listaSolicitudes.add(p);
                                            }
                                        }
                                    } else if (soliValue == 3) {

                                        listaSolicitudes = new ArrayList<SolicitudDTO>();

                                        for (SolicitudDTO p : new SolicitudDAO().listarTodos()) {

                                            if (p.getEstado().toString().equals("RECHAZADA")) {
                                                listaSolicitudes.add(p);
                                            }
                                        }
                                    } else{
                                        listaSolicitudes = new SolicitudDAO().listarTodos();
                                    }

                                    for (SolicitudDTO p : listaSolicitudes) {
                                        out.println("<tr>");
                                        out.println("<td>" + p.getId() + "</td>");
                                        out.println("<td>" + sdf.format(p.getFecha()) + "</td>");
                                        if (p.getProducto() != null) {

                                            ProductoDTO pro = new ProductoDAO().buscarPorId(p.getProducto().getId());

                                            out.println("<td>" + pro.getNombre() + "</td>");
                                        } else {
                                            out.println("<td style='color:red;'><strong>SIN PRODUCTO</strong></td>");
                                        }

                                        PersonalDTO per = new PersonalDAO().buscarPorId(p.getPersonal().getId());
                                        String nomPer = per.getNombres() + " " + per.getPaterno() + " " + per.getMaterno();
                                        out.println("<td>" + nomPer + "</td>");

                                        ClienteDTO cli = new ClienteDAO().buscarPorId(p.getCliente().getId());
                                        String nomCli = cli.getNombres() + " " + cli.getPaterno() + " " + cli.getMaterno();
                                        out.println("<td>" + nomCli + "</td>");
                                        if (p.getEstado().toString().equals("RECHAZADA")) {
                                            out.println("<td style='color:red;'><strong>" + p.getEstado().toString() + "</strong></td>");
                                        }
                                        if (p.getEstado().toString().equals("APROBADA")) {
                                            out.println("<td style='color:green;'><strong>" + p.getEstado().toString() + "</strong></td>");
                                        }
                                        if (p.getEstado().toString().equals("PENDIENTE")) {
                                            out.println("<td style='color:blue;'><strong>" + p.getEstado().toString() + "</strong></td>");
                                        }

                                        out.println("<td>");
                                        out.println("<button  type='submit'  uk-toggle=\"target: #mod" + p.getId() + "\" class='uk-button uk-button-primary uk-button-small' data-uk-tooltip title='Ver Detalle'><span uk-icon='icon: search'></span></i></button>");
                                        out.println("</td>");
                                        out.println("</tr>");

                                        // formulario modal
                                        out.println("<div id=\"mod" + p.getId() + "\" uk-modal><div class=\"uk-modal-dialog uk-modal-body\"><h2 class=\"uk-modal-title\"></h2><button class=\"uk-modal-close-default uk-close uk-icon\" type=\"button\"><span uk-icon=\"icon: close\"></span></button>");

                                        out.print("<h2>Detalles de la Solicitud N° " + p.getId() + "</h2>");

                                        out.print("<div><strong>Fecha de la Solicitud : </strong>" + sdf.format(p.getFecha()) + "</div>");
                                        out.print("<div><strong>Estado de la Solicitud : </strong>");

                                        if (p.getEstado().toString().equals("RECHAZADA")) {
                                            out.println("<span style='color:red;'><strong>" + p.getEstado().toString() + "</strong></span>");
                                        }
                                        if (p.getEstado().toString().equals("APROBADA")) {
                                            out.println("<span style='color:green;'><strong>" + p.getEstado().toString() + "</strong></span>");
                                        }
                                        if (p.getEstado().toString().equals("PENDIENTE")) {
                                            out.println("<span style='color:blue;'><strong>" + p.getEstado().toString() + "</strong></span>");
                                        }

                                        out.print("</div>");

                                        out.print("<h3 style='margin: 5px 0;'>Detalles del Cliente</h3>");
                                        out.print("<div><strong>RUT : </strong>" + cli.getRut() + "-" + cli.getDv() + "</div>");
                                        out.print("<div><strong>Nombres : </strong>" + nomCli + "</div>");
                                        out.print("<div><strong>F. de Nac : </strong>" + sdf.format(cli.getFechaNac()) + "</div>");
                                        out.print("<div><strong>Teléfono : </strong>" + cli.getTelefono() + "</div>");
                                        out.print("<div><strong>E-Mail : </strong>" + cli.getEmail() + "</div>");

                                        out.print("<h3 style='margin: 5px 0;'>Vendedor Asginado</h3>");
                                        out.print("<div><strong>vendedor : </strong>" + nomPer + "</div>");

                                        out.print("<h3 style='margin: 5px 0;'>Producto</h3>");
                                        if (p.getProducto() != null) {

                                            ProductoDTO pro = new ProductoDAO().buscarPorId(p.getProducto().getId());

                                            out.println("<div><strong>Nombre : </strong>" + pro.getNombre() + "</div>");
                                            out.println("<div><strong>Categoria : </strong>" + new CategoriaDAO().buscarPorId(pro.getCategoria().getId()).getNombre() + "</div>");
                                            out.println("<div><strong>Valor UF : </strong>" + pro.getValorUF() + "</div>");
                                        } else {
                                            out.println("<div style='color:red;'><strong>SIN PRODUCTO</strong></div>");
                                        }
                                        out.print("<br>");
                                        out.print("<form action='solicitud.do' method='POST'>");
                                        out.print("<input type='hidden' name='idSolicitud' value='" + p.getId() + "'>");
                                        out.println("<button name='accion' value='aprobar' type='submit' class='uk-button uk-button-danger uk-button-small' style='background : green;' data-uk-tooltip title='Aprobar'><span uk-icon='icon: check'></span></i> APROBAR</button>&nbsp;");
                                        out.println("<button name='accion' value='rechazar' type='submit' class='uk-button uk-button-danger uk-button-small' style='background : red;' data-uk-tooltip title='Rechazar'><span uk-icon='icon: close'></span></i> RECHAZAR</button>");
                                        out.println("<button name='accion' value='pendiente' type='submit' class='uk-button uk-button-primary uk-button-small'  data-uk-tooltip title='Volver Pendiente'><span uk-icon='icon: refresh'></span></i> VOLVER PENDIENTE</button>");

                                        out.println("</form></div></div>");

                                    }

                                } catch (Exception ex) {
                                    out.println(ex.getMessage());
                                }

                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>
