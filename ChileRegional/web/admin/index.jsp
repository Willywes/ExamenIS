<%-- 
    Document   : index
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Acceso al Sistema</title>
    </head>
    <body>
        <!-- header -->
        <header>

            <c:if test="${not empty mapMensajes}">

                
                <script>
                    
                    <c:if test="${not empty mapMensajes['rut']}">
                         $.growl.error({message: "<c:out value="${mapMensajes['rut']}"/>"});
                    </c:if>
                        
                    <c:if test="${not empty mapMensajes['clave']}">
                        $.growl.error({message: "<c:out value="${mapMensajes['clave']}"/>"});
                    </c:if>
                        
                    <c:if test="${not empty mapMensajes['basededatos']}">
                        $.growl.error({message: "<c:out value="${mapMensajes['basededatos']}"/>" });
                    </c:if>
                 
                </script>

            </c:if>
        </header>
        <!-- fin del header -->

        <div class="uk-container">
            <div class="uk-grid">
                <div class="uk-width-1-1" style="text-align: center;">

                    <h1 style="margin-bottom: 5px;">Acceso al Sistema</h1>
                    <h3 style="margin-top: 0px;">CHILE REGIONAL</h3>

                </div>
                <div class="uk-width-1-1" >
                    <div class="uk-card" style="background-color: #f5f5f5;  width: 350px; margin: 50px auto;">

                        <div class="uk-card-body">
                            <form method="POST" action="login-personal.do">
                                <legend class="uk-legend">Datos de Acceso</legend>
                                <div class="uk-margin">
                                    <input class="uk-input" type="number" maxlength="8" name="rut" placeholder="RUT sin puntos ni digito verificador"/>
                                </div>
                                <div class="uk-margin">
                                    <input class="uk-input" type="password" name="clave" placeholder="Clave de acceso"/>
                                </div>
                                <button type="submit" class="uk-button uk-button-primary uk-width-1-1">Acceder</button>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
