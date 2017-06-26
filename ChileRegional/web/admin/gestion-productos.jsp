<%-- 
    Document   : panel
    Created on : 15-06-2017, 23:15:01
    Author     : Willywes
--%>

<%@page import="model.dao.ProductoDAO"%>
<%@page import="model.dto.ProductoDTO"%>
<%@page import="model.dao.CategoriaDAO"%>
<%@page import="model.dto.CategoriaDTO"%>
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
        <title>Gestión de Productos</title>
    </head>
    <body>
        <script>


            function confirmarDeleteCategoria() {
                var x = confirm("¿Está seguro de eliminar esta Categoria?. Al eliminar esta categoría, eliminara todos los productos asociados y las solicitudes que tengan productos asociadas quedarán sin un producto asociado.");
                if (x)
                    return true;
                else
                    return false;
            }
            function confirmarDeleteProducto() {
                var x = confirm("¿Está seguro de eliminar este Producto?. Al eliminar este Producto, eliminara todos los productos de las solicitudes asociadas.");
                if (x)
                    return true;
                else
                    return false;
            }


            function modificarCategoria(id, nombre) {

                document.getElementById("nombre-cat").innerHTML = nombre;
                document.getElementById('mod-id-cat').value = id;
                document.getElementById('mod-nombre-cat').value = nombre;
            }

            function modificarProducto(id, nombre, descripcion, valor) {

                document.getElementById("nombre-pro").innerHTML = nombre;
                document.getElementById("mod-id-pro").value = id;
                document.getElementById("mod-nombre-pro").value = nombre;
                document.getElementById("mod-descripcion-pro").value = descripcion;
                document.getElementById("mod-valor-pro").value = valor;
            }



        </script>


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
                            <div><c:out value="${mapMensajes['categoria-nombre']}"/></div>
                            <div><c:out value="${mapMensajes['producto-nombre']}"/></div>
                            <div><c:out value="${mapMensajes['producto-descripcion']}"/></div>
                            <div><c:out value="${mapMensajes['producto-valoruf']}"/></div>
                            <div><c:out value="${mapMensajes['producto-categoria']}"/></div>

                        </div>
                    </c:if>

                </div>

                <div class="uk-width-1-3">
                    <div class="uk-grid">
                        <div class="uk-width-1-2">
                            <h3>CATEGORÍAS</h3>
                        </div>
                        <div class="uk-width-1-2">

                        </div>
                    </div>
                    <table class="uk-table uk-table-striped uk-table-small uk-table-hover">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<CategoriaDTO> listaCategoria = null;

                                try {

                                    listaCategoria = new CategoriaDAO().listarTodas();

                                } catch (Exception ex) {
                                    out.println(ex.getMessage());
                                }

                                for (CategoriaDTO p : listaCategoria) {
                                    out.println("<tr>");

                                    out.println("<td>" + p.getNombre() + "</td>");
                                    out.println("<td>");
                                    out.println("<form action='gestion-productos.do' method='POST' >");
                                    out.println("<input type='hidden' name='idCategoriaDelete' value='" + p.getId() + "'>");
                                    out.println("<button Onclick='return confirmarDeleteCategoria();'type='submit' name='accion' value='eliminar-categoria' class='uk-button uk-button-danger uk-button-small' data-uk-tooltip title='Eliminar'><data-uk-tooltip title='Eliminar'><span uk-icon='icon: trash'></span></i></button>&nbsp;");

                                    out.println("<button onClick='modificarCategoria(" + p.getId() + ",\"" + p.getNombre() + "\");' class='uk-button uk-button-danger uk-button-small' style='background : orange;' data-uk-tooltip title='Editar' uk-toggle='target: #modificar-categoria'><span uk-icon='icon: file-edit'></span></i></button>");
                                    out.println("</form>");
                                    out.println("</td>");
                                    out.println("</tr>");

                                }


                            %>

                        </tbody>


                    </table>
                </div>

                <div class="uk-width-2-3">
                    <div class="uk-grid">
                        <div class="uk-width-1-3">
                            <h3>PRODUCTOS</h3>
                        </div>
                        <div class="uk-width-2-3">
                            <button style="float:right;" class="uk-button uk-button-primary" uk-toggle="target: #agregar-categoria" type="button">Agregar Categoría</button>
                            <div style="float: right;">&nbsp;</div>
                            <button style="float:right;" class="uk-button uk-button-primary" uk-toggle="target: #agregar-producto" type="button">Agregar Producto</button>
                        </div>
                    </div>
                    <table class="uk-table uk-table-striped uk-table-small uk-table-hover">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Valor UF</th>
                                <th>Descripción</th>
                                <th>Categoria</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%                                List<ProductoDTO> listaProductos = null;

                                try {

                                    listaProductos = new ProductoDAO().listarTodos();

                                } catch (Exception ex) {
                                    out.println(ex.getMessage());
                                }

                                for (ProductoDTO p : listaProductos) {
                                    out.println("<tr>");
                                    out.println("<td>" + p.getNombre() + "</td>");
                                    out.println("<td>" + p.getValorUF() + "</td>");
                                    out.println("<td>" + p.getDescripcion() + "</td>");
                                    out.println("<td>" + new CategoriaDAO().buscarPorId(p.getCategoria().getId()).getNombre() + "</td>");
                                    out.println("<td>");
                                    out.println("<form action='gestion-productos.do' method='POST' >");
                                    out.println("<input type='hidden' name='idProductoDelete' value='" + p.getId() + "'>");
                                    out.println("<button Onclick='return confirmarDeleteProducto();'type='submit' name='accion' value='eliminar-producto' class='uk-button uk-button-danger uk-button-small' data-uk-tooltip title='Eliminar'><data-uk-tooltip title='Eliminar'><span uk-icon='icon: trash'></span></i></button>&nbsp;");
                                    out.println("<button onClick='modificarProducto(" + p.getId() + ",\"" + p.getNombre() + "\",\"" + p.getDescripcion() + "\"," + p.getValorUF() + ");' class='uk-button uk-button-danger uk-button-small' style='background : orange;' data-uk-tooltip title='Editar' uk-toggle='target: #modificar-producto'><span uk-icon='icon: file-edit'></span></i></button>");
                                    out.println("</form>");
                                    out.println("</td>");
                                    out.println("</tr>");

                                }


                            %>

                        </tbody>


                    </table>
                </div>





                <!-- This is the modal -->
                <!-- agregar categroria-->
                <div id="agregar-categoria" uk-modal>
                    <div class="uk-modal-dialog uk-modal-body">
                        <h2 class="uk-modal-title"></h2>
                        <button class="uk-modal-close-default uk-close uk-icon" type="button"><span uk-icon="icon: close"></span></button>

                        <form method="POST" action="gestion-productos.do">
                            <legend class="uk-legend">AGREGAR NUEVA CATEGORÍA</legend>

                            <div class="uk-margin">
                                <input class="uk-input" type="text" minlength="4" maxlength="45" name="nombre-categoria" placeholder="Nombre de la Categoría" required/>
                            </div>
                            <button type="submit" name="accion" value="guardar-categoria" class="uk-button uk-button-primary uk-width-1-1">Guardar</button>

                        </form>
                    </div>
                </div>
                <!-- agregar producto-->
                <div id="agregar-producto" uk-modal>
                    <div class="uk-modal-dialog uk-modal-body">
                        <h2 class="uk-modal-title"></h2>
                        <button class="uk-modal-close-default uk-close uk-icon" type="button"><span uk-icon="icon: close"></span></button>

                        <form method="POST" action="gestion-productos.do">
                            <legend class="uk-legend">AGREGAR NUEVO PRODUCTO</legend>

                            <div class="uk-margin">
                                <input class="uk-input" type="text" minlength="4" maxlength="45" name="nombre-producto" placeholder="Nombre del Producto" required/>
                            </div>
                            <div class="uk-margin">
                                <textarea  class="uk-textarea" rows="5" type="text" minlength="4" maxlength="1024" name="descripcion-producto" placeholder="Descripción del Producto" required/></textarea>
                            </div>
                            <div class="uk-margin">
                                <input class="uk-input" type="number" step="0.00" min="10" max="999999" name="valoruf-producto" placeholder="Valor en UF" required/>
                            </div>

                            <div class="uk-margin">
                                <select name="id-categoria" class="uk-select">
                                    <option value='0'>Seleccione una Categoría</option>
                                    <%                                        for (CategoriaDTO p : listaCategoria) {

                                            out.println("<option value='" + p.getId() + "'>" + p.getNombre() + "</option>");

                                        }

                                    %>
                                </select>
                            </div>


                            <button type="submit" name="accion" value="guardar-producto" class="uk-button uk-button-primary uk-width-1-1">Guardar</button>

                        </form>
                    </div>
                </div>

                <!-- modificar categroria-->
                <div id="modificar-categoria" uk-modal>
                    <div class="uk-modal-dialog uk-modal-body">
                        <h2 class="uk-modal-title"></h2>
                        <button class="uk-modal-close-default uk-close uk-icon" type="button"><span uk-icon="icon: close"></span></button>

                        <form method="POST" action="gestion-productos.do">
                            <legend class="uk-legend">MODIFICAR CATEGORÍA</legend>
                            <span>Va a editar los datos de la Caterogía : </span>
                            <span id="nombre-cat"></span>


                            <div class="uk-margin">
                                <input id="mod-id-cat" type="hidden" name="idCategoriaMod" value=""/>
                                <input id="mod-nombre-cat" value="" class="uk-input" type="text" minlength="4" maxlength="45" name="nombreCategoriaMod" placeholder="Nuevo nombre de la Categoría" required/>
                            </div>
                            <button type="submit" name="accion" value="modificar-categoria" class="uk-button uk-button-primary uk-width-1-1">Guardar</button>

                        </form>
                    </div>
                </div>

                <!-- modificar producto-->
                <div id="modificar-producto" uk-modal>
                    <div class="uk-modal-dialog uk-modal-body">
                        <h2 class="uk-modal-title"></h2>
                        <button class="uk-modal-close-default uk-close uk-icon" type="button"><span uk-icon="icon: close"></span></button>

                        <form method="POST" action="gestion-productos.do">
                            <legend class="uk-legend">MODIFICAR PRODUCTO</legend>
                             <span>Va a editar los datos del Producto : </span>
                             <span id="nombre-pro"></span>
                             
                            <div class="uk-margin">
                                <input id="mod-id-pro" type="hidden" name="idProMod" value=""/>
                                <input value="" id="mod-nombre-pro" class="uk-input" type="text" minlength="4" maxlength="45" name="nombreProMod" placeholder="Nombre del Producto" required/>
                            </div>
                            <div class="uk-margin">
                                <textarea value="" id="mod-descripcion-pro" class="uk-textarea" rows="5" type="text" minlength="4" maxlength="1024" name="descProMod" placeholder="Descripción del Producto" required/></textarea>
                            </div>
                            <div class="uk-margin">
                                <input value="" id="mod-valor-pro" class="uk-input" type="number" step="0.00" min="10" max="999999" name="valorProMod" placeholder="Valor en UF" required/>
                            </div>

                            <div class="uk-margin">
                                <select name="idCatMod" class="uk-select">
                                    <option value='0'>Seleccione una Categoría</option>
                                    <%                                        
                                        
                                        for (CategoriaDTO p : listaCategoria) {

                                            out.println("<option value='" + p.getId() + "'>" + p.getNombre() + "</option>");

                                        }

                                    %>
                                </select>
                            </div>


                            <button type="submit" name="accion" value="modificar-producto" class="uk-button uk-button-primary uk-width-1-1">Guardar</button>

                        </form>
                    </div>
                </div>


            </div>
        </div>

    </body>
</html>
