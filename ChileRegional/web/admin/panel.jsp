<%-- 
    Document   : panel
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

<%@page import="org.w3c.dom.NamedNodeMap"%>
<%@page import="java.net.URL"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
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
        <link href="http://indicadoresdeldia.cl/webservice/indicadores.xml" type="application/rss+xml" rel="alternate" title="Indicadores económicos de Chile en tu página web" />

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
            <%                
                
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                factory.setNamespaceAware(true);
                String url = "http://indicadoresdeldia.cl/webservice/indicadores.xml";

                Document doc = factory.newDocumentBuilder().parse(new URL(url).openStream());
                String ufString = doc.getFirstChild().getChildNodes().item(2).getChildNodes().item(1).getTextContent();
                //String ufDobuble = doc.getFirstChild().getChildNodes().item(2).getChildNodes().item(1).getAttributes().getNamedItem("valor").getNodeValue();

            %>




            <p id="uf" >Valor de la U.F <strong><% out.print(ufString);%></strong> para hoy <span id="date"></span></p>

            <script>
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1; //January is 0!

                var yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = '0' + dd;
                }
                if (mm < 10) {
                    mm = '0' + mm;
                }
                var today = dd + '/' + mm + '/' + yyyy;
                document.getElementById("date").innerHTML = today;

            </script>
            
            <c:if test="${not empty sessionScope}">

            <c:if test="${sessionScope.tipoUsuario == 'SUPERADMIN'}">
                <div class="uk-child-width-1-4@m uk-grid-small uk-grid-match" uk-grid>
                <div>
                    <div class="uk-card uk-card-primary uk-card-body">
                        <h3 class="uk-card-title">Gestión Usuarios</h3>
                        <p>Módulo para gestionar los usuarios del sistema.</p>
                        <p><a href="gestion-personal.jsp" class="uk-button uk-button-default">Acceder</a></p>
                    </div>
                </div>
                <div>
                    <div class="uk-card uk-card-primary uk-card-body">
                        <h3 class="uk-card-title">Gestión Productos</h3>
                        <p>Módulo para la gestión de los productos y categorias.</p>
                        <p><a href="gestion-productos.jsp" class="uk-button uk-button-default">Acceder</a></p>
                    </div>
                </div>
                <div>
                    <div class="uk-card uk-card-primary uk-card-body">
                        <h3 class="uk-card-title">Solicitudes</h3>
                        <p>Modúlo para la gestión de las solicitudes.</p>
                        <p><a href="solicitud.jsp" class="uk-button uk-button-default">Acceder</a></p>
                    </div>
                </div>
                <div>
                    <div class="uk-card uk-card-primary uk-card-body">
                        <h3 class="uk-card-title">Clientes</h3>
                        <p>Módulo de acceso a la lista de Clientes.</p>
                        <p><a href="clientes.jsp" class="uk-button uk-button-default">Acceder</a></p>
                    </div>
                </div>
            </div>
            </c:if>
            
            <c:if test="${sessionScope.tipoUsuario == 'SUPERVISOR'}">
                <div class="uk-child-width-1-4@m uk-grid-small uk-grid-match" uk-grid>

                <div>
                    <div class="uk-card uk-card-primary uk-card-body">
                        <h3 class="uk-card-title">Solicitudes</h3>
                        <p>Modúlo para la gestión de las solicitudes.</p>
                        <p><a href="solicitud.jsp" class="uk-button uk-button-default">Acceder</a></p>
                    </div>
                </div>
                <div>
                    <div class="uk-card uk-card-primary uk-card-body">
                        <h3 class="uk-card-title">Clientes</h3>
                        <p>Módulo de acceso a la lista de Clientes.</p>
                        <p><a href="clientes.jsp" class="uk-button uk-button-default">Acceder</a></p>
                    </div>
                </div>
            </div>
            </c:if>
            
            <c:if test="${sessionScope.tipoUsuario == 'VENDEDOR'}">
                <div class="uk-child-width-1-4@m uk-grid-small uk-grid-match" uk-grid>

                <div>
                    <div class="uk-card uk-card-primary uk-card-body">
                        <h3 class="uk-card-title">Clientes</h3>
                        <p>Módulo de acceso a la lista de Clientes.</p>
                        <p><a href="clientes.jsp" class="uk-button uk-button-default">Acceder</a></p>
                    </div>
                </div>
            </div>
            </c:if>


        </c:if>
            
        </div>

    </body>
</html>
