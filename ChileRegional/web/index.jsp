<%-- 
    Document   : index
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

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


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- header -->
        <header>

            <nav class="uk-navbar-container" uk-navbar>
                <div class="uk-navbar-left">

                    <a class="uk-navbar-item uk-logo" href="index.jsp"><strong>CHILE</strong>REGIONAL</a>

                    <ul class="uk-navbar-nav">
                        <li class="uk-active"><a href="#">Active</a></li>
                        <li>
                            <a href="#">Parent</a>
                            <div class="uk-navbar-dropdown">
                                <ul class="uk-nav uk-navbar-dropdown-nav">
                                    <li class="uk-active"><a href="#">Active</a></li>
                                    <li><a href="#">Item</a></li>
                                    <li><a href="#">Item</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#">Item</a></li>
                    </ul>

                </div>
            </nav>


        </header>
        <!-- fin del header -->

        <div class="uk-container">
            <div class="uk-grid">
                <div>

                    <h1>Bienvenidos a <br><strong>CHILE</strong>REGIONAL</h1>

                </div>


            </div>
        </div>

    </body>
</html>
