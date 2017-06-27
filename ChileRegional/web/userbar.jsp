
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty sessionScope.cliente}">
    <div class="uk-grid">
        <div class="uk-width-1-1" >
            <div style="float : right; margin: 5px;">
                <span>Bienvenido, <c:out value='${sessionScope.cliente.nombres.toString()}'/> <c:out value='${sessionScope.cliente.paterno.toString()}'/> <c:out value='${sessionScope.cliente.materno.toString()}'/></span> 
                <a href="logout-cliente.do" class="uk-button uk-button-primary uk-button-small">Desconectar</a>
            </div>
        </div>
    </div>
</c:if>