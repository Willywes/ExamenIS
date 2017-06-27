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
        <title>Home</title>
    </head>
    <body>
        <div class="uk-width-1-1\@l" style="position: fixed; z-index: -100;">
            <div class="w3-content w3-section" style="max-width:100%; height: 100vh;">

                <img class="mySlides w3-animate-fading" src="assets/img/1.jpg" style="width:100%">
                <img class="mySlides w3-animate-fading" src="assets/img/2.jpg" style="width:100%">
                <img class="mySlides w3-animate-fading" src="assets/img/3.jpg" style="width:100%">
                <img class="mySlides w3-animate-fading" src="assets/img/4.jpg" style="width:100%">
            </div>

            <script>
                var myIndex = 0;
                carousel();

                function carousel() {
                    var i;
                    var x = document.getElementsByClassName("mySlides");
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";
                    }
                    myIndex++;
                    if (myIndex > x.length) {
                        myIndex = 1
                    }
                    x[myIndex - 1].style.display = "block";
                    setTimeout(carousel, 3000);
                }
            </script>

        </div>
        <!-- header -->
        <header>

            <%@include file="navbar.jsp" %>


        </header>
        <!-- fin del header -->
        <%@include file="userbar.jsp" %>
        <div class="uk-container">


            <div uk-grid>

                <div class="uk-width-1-2">

                    <h1 style="font-size: 50pt; color: #ec0000;">Bienvenidos a <br><strong>CHILE</strong>REGIONAL</h1>

                </div>

                <div class="uk-width-1-2">
                    <div class="uk-grid">

                        <div class="uk-width-1-3"></div>
                        <div class="uk-card uk-card-default uk-card-body uk-width-2-3" style="margin-top: 30px;">
                            <h2 class="uk-card-title">Aréa Clientes</h2>
                            <div class="uk-width-1-1" style="border-bottom: 1px solid #c5c5c5; margin-top : 0px; margin-bottom: 15px;"></div>
                            <div>
                                <c:if test="${not empty mapMensajes}">
                                    <div uk-alert>
                                        <a class="uk-alert-close" uk-close></a>

                                        <div><c:out value="${mapMensajes['clave']}"/></div>
                                        <div><c:out value="${mapMensajes['rut']}"/></div>
                                        <div><c:out value="${mapMensajes['basededatos']}"/></div>


                                    </div>
                                </c:if>
                                <form method="POST" action="login-cliente.do">
                                    <div class="uk-margin">
                                        <input class="uk-input" type="number" name="rut" placeholder="RUT sin puntos ni guión" required>
                                    </div>
                                    <div class="uk-margin">
                                        <input class="uk-input" type="password" name="clave" placeholder="Clave de Acceso" required >
                                    </div>

                                    <div class="uk-margin">
                                        <button type="submit" name="accion" value="logearFront" class="uk-button uk-button-danger uk-width-1-1" >Acceder</button>
                                    </div>
                                    <div class="uk-margin">

                                        <a href="#" class="uk-link" >Hazte Cliente</a><span></span>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
        </div>

    </body>
</html>
