<%-- 
    Document   : index
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>solicitud Confirmada</title>
    </head>
    <body>

        <!-- header -->
        <header>

            <%@include file="navbar.jsp" %>


        </header>
        <!-- fin del header -->
        <%@include file="userbar.jsp" %>
        <div class="uk-container">


            <div uk-grid>

                <div class="uk-width-1-2">

                   <c:if test="${not empty mapMensajes}">
                                    <h1>
                                       

                                        <div><c:out value="${mapMensajes['clave']}"/></div>
                                        <div><c:out value="${mapMensajes['rut']}"/></div>
                                        <div><c:out value="${mapMensajes['basededatos']}"/></div>


                                    </h1>
                                </c:if>

                </div>

            </div>
        </div>

    </body>
</html>
