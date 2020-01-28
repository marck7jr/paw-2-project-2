<%-- 
    Document   : nav
    Created on : 27/01/2020, 14:50:31
    Author     : lucim
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<c:set var="uri" value="${pageContext.request.requestURI}"/>
<nav>
    <a href="<c:url value="/"/>" <c:if test="${fn:endsWith(uri, 'Index.jsp')}">active</c:if>>
        <i class="ms-Icon ms-Icon--Home"></i>
        <p>Início</p>
    </a>
    <a href="<c:url value="/accounts"/>" <c:if test="${fn:endsWith(uri, 'Account.jsp')}">active</c:if>>
        <i class="ms-Icon ms-Icon--People"></i>
        <p>Usuários</p>
    </a>
    <a href="<c:url value="/departments"/>" <c:if test="${fn:endsWith(uri, 'Department.jsp')}">active</c:if>>
        <i class="ms-Icon ms-Icon--BulletedTreeList"></i>
        <p>Departamentos</p>
    </a>
    <a href="<c:url value="/products"/>" <c:if test="${fn:endsWith(uri, 'Product.jsp')}">active</c:if>>
        <i class="ms-Icon ms-Icon--Product"></i>
        <p>Produtos</p>
    </a>
    <a href="<c:url value="/offers"/>" <c:if test="${fn:endsWith(uri, 'Offer.jsp')}">active</c:if>>
        <i class="ms-Icon ms-Icon--QRCode"></i>
        <p>Ofertas</p>
    </a>
    <a href="<c:url value="/carts"/>" <c:if test="${fn:endsWith(uri, 'Cart.jsp')}">active</c:if>>
        <i class="ms-Icon ms-Icon--ShoppingCart"></i>
        <p>Carrinho</p>
    </a>
    <a href="<c:url value="/items"/>" <c:if test="${fn:endsWith(uri, 'Item.jsp')}">active</c:if>>
        <i class="ms-Icon ms-Icon--WorkItem"></i>
        <p>Item</p>
    </a>
</nav>