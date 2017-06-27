<%-- 
    Document   : index
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.net.URL"%>
<%@page import="model.dao.ProductoDAO"%>
<%@page import="model.dto.ProductoDTO"%>
<%@page import="model.dao.CategoriaDAO"%>
<%@page import="model.dto.CategoriaDTO"%>
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
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


        <!-- jQuery is required -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- UIkit JS -->
        <script src="assets/js/uikit.min.js"></script>
        <script src="assets/js/uikit-icons.min.js"></script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arma tu Solicitud</title>
    </head>
    <body>

        <!-- header -->
        <header>

            <%@include file="navbar.jsp" %>


        </header>


        <!-- fin del header -->
        <%@include file="userbar.jsp" %>
        <div class="uk-container">

            <div class="uk-child-width-1-1" uk-grid>

                <c:if test="${not empty mensaje}">
                    <div uk-alert>
                        <a class="uk-alert-close" uk-close></a>
                        <p style="font-size: 24px;"><c:out value="${mensaje}" /></p>
                    </div>
                </c:if>

                <c:if test="${not empty mapMensajes}">
                    <div uk-alert>
                        <a class="uk-alert-close" uk-close></a>
                        <div><c:out value="${mapMensajes['basededatos']}"/></div>
                        <div><c:out value="${mapMensajes['pro']}"/></div>
                        <div><c:out value="${mapMensajes['clave']}"/></div>
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


                <div>
                    <div uk-grid>

                        <%
                            String idProducto = "1";

                            try {
                                idProducto = request.getParameter("idProducto");

                            } catch (Exception ex) {

                            }

                        %>

                        <c:if test="${empty sessionScope.cliente}">


                            <div class="uk-width-1-1">
                                <h3>DATOS DE USUARIOS</h3>
                                <p>Si usted ya es cliente inicie sesión de lo contrario cree una nueva cuenta para registrar sus datos.</p>
                                <ul class="uk-subnav uk-subnav-pill" uk-switcher="animation: uk-animation-slide-left-medium, uk-animation-slide-right-medium">
                                    <li><a href="#">Iniciar Sesión</a></li>
                                    <li><a href="#">Registrar Nuevo Cliente</a></li>

                                </ul>



                                <ul class="uk-switcher uk-margin">
                                    <!-- login -->
                                    <li>
                                        <div class="uk-grid">
                                            <div class="uk-width-1-3">

                                                <form action="login-cliente.do" method="POST">
                                                    <legend class="uk-legend">Acceso de Clientes</legend>
                                                    <input type="hidden" name="idProducto" value="<% out.print(idProducto);%>"/>
                                                    <div class="uk-margin">
                                                        <input class="uk-input" type="number" min="1000000" max="99999999" name="rut" value="" required placeholder=" RUT 12345678"/>
                                                    </div>
                                                    <div class="uk-margin">
                                                        <input class="uk-input" type="password" name="clave" placeholder="Clave de Acceso" required>
                                                    </div>

                                                    <div class="uk-margin">
                                                        <button type="submit" name="accion" value="logear" class="uk-button uk-button-danger uk-width-1-1" >Acceder</button>
                                                    </div>
                                                </form>

                                            </div>                                       
                                        </div>
                                    </li>
                                    <!-- nuevo registro-->
                                    <li>

                                        <div class="uk-grid">
                                            <div class="uk-width-1-1">

                                                <form action="login-cliente.do" method="POST">

                                                    <legend class="uk-legend">Nuevo Cliente</legend>

                                                    <input type="hidden" name="idProducto" value="<% out.print(idProducto);%>"/>

                                                    <div class="uk-grid">
                                                        <div class="uk-width-1-3">
                                                            <div class="uk-margin">
                                                                <div class="uk-grid">
                                                                    <div class="uk-width-2-3">
                                                                        <input class="uk-input" type="number" min="1000000" max="99999999" name="rut" value="" required placeholder=" RUT 12345678"/>
                                                                    </div>
                                                                    <div class="uk-width-1-3">
                                                                        <input class="uk-input" type="text" name="dv" value="" maxlength="1" required placeholder="K"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="uk-margin">
                                                                <input class="uk-input" type="text" name="nombres" value="" required placeholder="Nombres"/>
                                                            </div>
                                                            <div class="uk-margin">
                                                                <input class="uk-input" type="text" name="paterno" value="" required placeholder="Apellido Paterno"/>
                                                            </div>
                                                            <div class="uk-margin">
                                                                <input class="uk-input" type="text" name="materno" value="" required placeholder="Apellido Materno"/>
                                                            </div> 

                                                            <div class="uk-margin">
                                                                <input class="uk-input" type="date" name="fnac" required>
                                                            </div>
                                                        </div>



                                                        <div class="uk-width-1-3">

                                                            <div class="uk-margin">
                                                                <select name="sexo" class="uk-select">
                                                                    <option value="MASCULINO">MASCULINO</option>
                                                                    <option value="FEMENINO">FEMENINO</option>
                                                                </select>
                                                            </div>
                                                            <div class="uk-margin">
                                                                <input class="uk-input" type="text" name="direccion" value="" required placeholder="Dirección"/>
                                                            </div> 

                                                            <div class="uk-margin">
                                                                <input class="uk-input" type="text" name="telefono" value="" required maxlength="9" placeholder="Teléfono"/>
                                                            </div>
                                                            <div class="uk-margin">
                                                                <input class="uk-input" type="email" name="email" value="" required placeholder="ejemplo@email.com"/>
                                                            </div>


                                                            <button type="submit" name="accion" value="registrar" class="uk-button uk-button-primary uk-width-1-1">Guardar</button>
                                                        </div> 
                                                    </div>

                                                </form>

                                            </div>                                       
                                        </div>

                                    </li>

                                </ul>

                            </div>
                        </c:if>
                        <c:if test="${not empty sessionScope.cliente}">

                            <form action="test.do" method="GET">

                                <input type="hidden" name="idProducto" value="<% out.print(idProducto);%>"/>
                                <button type="submit" name="accion" value="solicitar" class="uk-button uk-button-primary uk-width-1-1">Guardar</button>
                            </form>
                        </c:if>

                    </div>
                </div>


            </div>
        </div>


    </body>
</html>
