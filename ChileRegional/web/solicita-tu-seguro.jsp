<%-- 
    Document   : index
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

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
        <title>Solicita tu Seguro</title>
    </head>
    <body>

        <!-- header -->
        <header>

            <%@include file="navbar.jsp" %>


        </header>

        <%

            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setNamespaceAware(true);
            String url = "http://indicadoresdeldia.cl/webservice/indicadores.xml";

            Document doc = factory.newDocumentBuilder().parse(new URL(url).openStream());
            String ufString = doc.getFirstChild().getChildNodes().item(2).getChildNodes().item(1).getTextContent();

            String ufDobuble = doc.getFirstChild().getChildNodes().item(2).getChildNodes().item(1).getAttributes().getNamedItem("valor").getNodeValue();
            double ufD = 0;

            try {
                ufD = Double.parseDouble(ufDobuble);

            } catch (Exception ex) {

            }


        %>
        <!-- fin del header -->
        <%@include file="userbar.jsp" %>
        <div class="uk-container">




            <div class="uk-child-width-1-1" uk-grid>
                <div><p id="uf" >Valor de la U.F <strong><% out.print(ufString);%></strong> para hoy <span id="date"></span></p></div>
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
                <div>
                    <div uk-grid>
                        <div class="uk-width-auto">
                            <h4>CATEGORIAS</h4>
                            <ul class="uk-tab-left" uk-tab="connect: #component-tab-left; animation: uk-animation-fade">
                                <%
                                    List<CategoriaDTO> listaCat = null;

                                    try {

                                        listaCat = new CategoriaDAO().listarTodas();

                                        for (CategoriaDTO item : listaCat) {
                                            out.println("<li><a class='uk-button uk-button-danger' style='background :#ec0000; color: white;' href=\"#\">" + item.getNombre() + "</a></li>");
                                        }

                                    } catch (Exception e) {

                                    }


                                %>

                            </ul>
                        </div>
                        <div class="uk-width-expand">
                            <h4>PRODUCTOS</h4>                           

                            <ul id="component-tab-left" class="uk-switcher">
                                <%                                    try {

                                        List<ProductoDTO> listapro = new ProductoDAO().listarTodos();

                                        NumberFormat fu = new DecimalFormat("#,000");
                                        NumberFormat fp = new DecimalFormat("#0.00");

                                        for (CategoriaDTO item : listaCat) {

                                            out.println("<li>");
                                            out.println("<div style='margin-top: 10px; padding-top: 10px;  border-top: 1px solid #e5e5e5;' ></div>");
                                            out.println("<ul class='uk-list uk-list-divider'>");
                                            for (ProductoDTO p : listapro) {

                                                if (item.getId() == p.getCategoria().getId()) {
                                                    out.println("<li>"
                                                            + "<h4><strong>" + p.getNombre() + "</strong></h4>"
                                                            + "<form action='armar-solicitud.jsp' method='get'>"
                                                            + "<button type='submit' name='idProducto' value='" + p.getId() +"' style='float:right;' class='uk-button uk-button-primary'>SELECCIONAR</button>"
                                                            + "</form>"
                                                            + "<p>" + p.getDescripcion() + "</p>"
                                                            + "<p><strong>CAPITAL ASEGURADO</strong> : " + fu.format(p.getValorUF()) + " UF  en Pesos $" + fu.format(p.getValorUF() * ufD) + "</p>"
                                                            + "<p><strong>PRIMA MENSUAL</strong> : " + fp.format(p.getValorUF()/1335) + " UF  en Pesos $" + fu.format((p.getValorUF()* ufD)/1335) + "</p>"
                                                            + "<p></p>"
                                                            + "</li>");
                                                }
                                            }

                                            out.println("</ul>");
                                            out.println("</li>");
                                        }

                                    } catch (Exception e) {

                                    }


                                %>

                                
                            </ul>
                        </div>
                    </div>
                </div>


            </div>
        </div>


    </body>
</html>
