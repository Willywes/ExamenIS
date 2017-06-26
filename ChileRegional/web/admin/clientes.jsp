<%-- 
    Document   : panel
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

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
                            </tr>
                        </thead>
                        <tbody>

                            <%

                                List<ClienteDTO> listaCliente = null;
                                SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM 'del' yyyy");

                                try {

                                    listaCliente = new ClienteDAO().leerTodos();

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
                                    out.println("<td><a target='_blank' href='tel:+"+ p.getTelefono() + "' class='uk-button uk-button-primary uk-button-small' data-uk-tooltip title='Llamar a Cliente'><span uk-icon='icon: phone'></span></i></a>&nbsp;");
                                    out.println("<a target='_blank' href='mailto:"+ p.getEmail() + "'class='uk-button uk-button-primary uk-button-small' data-uk-tooltip title='Enviar E-Mail a Cliente'><span uk-icon='icon: mail'></span></i></a></td>");
                                    out.println("</tr>");

                                }


                            %>

                        </tbody>


                    </table>
                </div>


            </div>
        </div>

    </body>
</html>
