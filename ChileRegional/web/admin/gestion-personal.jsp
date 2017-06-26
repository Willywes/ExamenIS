<%-- 
    Document   : panel
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

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
        <title>Gestión del Personal</title>
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
                            <div><c:out value="${mapMensajes['dv']}"/></div>
                            <div><c:out value="${mapMensajes['nombres']}"/></div>
                            <div><c:out value="${mapMensajes['paterno']}"/></div>
                            <div><c:out value="${mapMensajes['materno']}"/></div>
                            <div><c:out value="${mapMensajes['telefono']}"/></div>
                            <div><c:out value="${mapMensajes['email']}"/></div>
                            <div><c:out value="${mapMensajes['tipo']}"/></div>
                        </div>
                    </c:if>

                    <div class="uk-grid">
                        <div class="uk-width-3-4">
                            <h3>LISTA DEL PERSONAL</h3>
                        </div>
                        <div class="uk-width-1-4">
                            <button style="float:right;" class="uk-button uk-button-primary" uk-toggle="target: #agregar" type="button">Agregar Personal</button>
                        </div>
                    </div>
                    <table class="uk-table uk-table-striped uk-table-small uk-table-hover">
                        <thead>
                            <tr>
                                <th>RUT</th>
                                <th>Nombre</th>
                                <th>Tipo de Personal</th>
                                <th>EMail</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%

                                List<PersonalDTO> listaPersonal = null;

                                try {

                                    listaPersonal = new PersonalDAO().leerTodos();

                                } catch (Exception ex) {
                                    out.println(ex.getMessage());
                                }

                                for (PersonalDTO p : listaPersonal) {
                                    out.println("<tr>");
                                    out.println("<td>" + p.getRut() + "-" + p.getDv() + "</td>");
                                    out.println("<td>" + p.getNombres() + " " + p.getPaterno() + " " + p.getMaterno() + "</td>");
                                    out.println("<td>" + new TipoUsuarioDAO().buscarPorId(p.getTipoUsuario().getId()).getNombre() + "</td>");
                                    out.println("<td>" + p.getEmail() + "</td>");
                                    out.println("<td>");
                                    out.println("<button  type='submit' class='uk-button uk-button-danger uk-button-small' style='background : orange;' data-uk-tooltip title='Editar'><span uk-icon='icon: file-edit'></span></i></button></td>");
                                    out.println("</tr>");

                                }


                            %>

                        </tbody>


                    </table>
                </div>

                <!-- This is the modal -->
                <div id="agregar" uk-modal>
                    <div class="uk-modal-dialog uk-modal-body">
                        <h2 class="uk-modal-title"></h2>
                        <button class="uk-modal-close-default uk-close uk-icon" type="button"><span uk-icon="icon: close"></span></button>

                        <form method="POST" action="gestion-personal.do">
                            <legend class="uk-legend">AGREGAR USUARIO</legend>
                            <div class="uk-margin">
                                <div class="uk-grid">
                                    <div class="uk-width-2-3">
                                        <input class="uk-input" type="number" min="1000000" max="99999999" name="rut" value="${registroPersonal.getRut()}" required placeholder=" RUT 12345678"/>
                                    </div>
                                    <div class="uk-width-1-3">
                                        <input class="uk-input" type="text" name="dv" value="${registroPersonal.getDv()}" maxlength="1" required placeholder="K"/>
                                    </div>
                                </div>
                            </div>
                            <div class="uk-margin">
                                <input class="uk-input" type="text" name="nombres" value="${registroPersonal.getNombres()}" required placeholder="Nombres"/>
                            </div>
                            <div class="uk-margin">
                                <input class="uk-input" type="text" name="paterno" value="${registroPersonal.getPaterno()}" required placeholder="Apellido Paterno"/>
                            </div>
                            <div class="uk-margin">
                                <input class="uk-input" type="text" name="materno" value="${registroPersonal.getMaterno()}" required placeholder="Apellido Materno"/>
                            </div>                        
                            <div class="uk-margin">
                                <input class="uk-input" type="text" name="telefono" value="${registroPersonal.getTelefono()}" required maxlength="9" placeholder="Teléfono"/>
                            </div>
                            <div class="uk-margin">
                                <input class="uk-input" type="email" name="email" value="${registroPersonal.getEmail()}" required placeholder="ejemplo@email.com"/>
                            </div>
                            <div class="uk-margin">
                                <select name="tipo" class="uk-select">
                                    <option value="0">Seleccione Tipo</option>
                                    <option value="1">SUPERADMIN</option>
                                    <option value="2">SUPERVISOR</option>
                                    <option value="3">VENDEDOR</option>
                                </select>
                            </div>

                            <button type="submit" class="uk-button uk-button-primary uk-width-1-1">Guardar</button>

                        </form>
                    </div>
                </div>


            </div>
        </div>

    </body>
</html>
