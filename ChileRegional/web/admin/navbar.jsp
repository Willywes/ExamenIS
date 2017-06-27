<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="uk-navbar-container" uk-navbar>
    <div class="uk-navbar-left">

        <%
            HttpSession userSession = request.getSession();
            if (null == userSession.getAttribute("personal")) {
                response.sendRedirect("index.jsp");
            }
        %>

        <a class="uk-navbar-item uk-logo" href="panel.jsp"><strong>CHILE</strong>REGIONAL</a>

        <c:if test="${not empty sessionScope}">

            <c:if test="${sessionScope.tipoUsuario == 'SUPERADMIN'}">
                <ul class="uk-navbar-nav">
                    <li><a href="gestion-personal.jsp">Gestión de Usuarios</a></li>
                    <li><a href="gestion-productos.jsp">Gestión de Productos</a></li>
                    <li><a href="solicitud.jsp">Solicitudes</a></li>
                    <li><a href="clientes.jsp">Clientes</a></li>
                </ul>
            </c:if>
            
            <c:if test="${sessionScope.tipoUsuario == 'SUPERVISOR'}">
                <ul class="uk-navbar-nav">
                    <li><a href="solicitud.jsp">Solicitudes</a></li>
                </ul>
            </c:if>
            
            <c:if test="${sessionScope.tipoUsuario == 'VENDEDOR'}">
                <ul class="uk-navbar-nav">
                    <li><a href="clientes.jsp">Clientes</a></li>
                </ul>
            </c:if>


        </c:if>

    </div>


    <div class="uk-navbar-right">
        <c:if test="${not empty sessionScope}">
            <div>Bienvenido, <c:out value='${sessionScope.personal.nombres.toString()}'/> <c:out value='${sessionScope.personal.paterno.toString()}'/>&nbsp;</div>

            <form action="logout-personal.do" method="GET">
                <button type="submit" value="Cerrar Sesión" class="uk-button uk-button-danger">Cerrar Sesión</button>&nbsp;
            </form>
        </c:if>
    </div>
</nav>