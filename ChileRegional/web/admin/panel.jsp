<%-- 
    Document   : panel
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

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
        <title>Panel de Control</title>
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

               
            </div>
        </div>

    </body>
</html>
