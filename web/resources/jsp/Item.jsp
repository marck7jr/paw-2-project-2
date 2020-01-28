<%-- 
    Document   : Item
    Created on : 28/01/2020, 04:44:39
    Author     : lucim
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="x" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="Services.ItemDAO"/>
<jsp:useBean id="_dao" class="Services.CartDAO"/>
<jsp:useBean id="__dao" class="Services.ProductDAO"/>
<c:if test="${empty param.edit}">
    <jsp:useBean id="entity" class="Models.Item"/>
    <jsp:setProperty name="entity" property="id"/>    
    <jsp:setProperty name="entity" property="cart" value="${_dao.find(param.cart)}"/>
    <jsp:setProperty name="entity" property="product" value="${__dao.find(param.product)}"/>
    <jsp:setProperty name="entity" property="units"/>
</c:if>
<c:if test="${not empty param.edit}">
    <c:set var="entity" value="${dao.find(param.edit)}"/>
</c:if>
<c:choose>
    <c:when test="${not empty entity.units and entity.units > 0 and empty param.edit}">
        ${dao.save(entity)}
        <jsp:setProperty name="entity" property="id" value="0"/>    
    <jsp:setProperty name="entity" property="product" value="${null}"/>
    <jsp:setProperty name="entity" property="cart" value="${null}"/>
    <jsp:setProperty name="entity" property="units" value="0"/>
    </c:when>
    <c:when test="${not empty param.delete}">
        ${dao.delete(dao.find(param.delete))}
    </c:when>
</c:choose>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAVAtacado | Items</title>
        <link href="resources/css/site.min.css" type="text/css" rel="stylesheet">
        <link href="resources/css/fabric.min.css" type="text/css" rel="stylesheet">
    </head>
    <body class="ms-Fabric">
        <x:nav/>
        <div class="jsp-content-layout">
            <form>
                <h1>Items</h1>
                <div>
                    <input id="entity-id" name="id" type="number" value="${entity.id}" hidden/>
                </div>
                <div>
                    <label for="entity-cart">Carrinho</label>
                    <select id="entity-cart" name="cart" value="${entity.cart.id}">
                        <c:forEach var="e" items="${_dao.list()}">
                            <option value="${e.id}">${e.account.name}</option>
                        </c:forEach>
                    </select>
                </div>            
                <div>
                    <label for="entity-product">Produto</label>
                    <select id="entity-product" name="product" value="${entity.product.id}">
                        <c:forEach var="e" items="${__dao.list()}">
                            <option value="${e.id}">${e.name}</option>
                        </c:forEach>
                    </select>
                </div>            
                <div>
                    <label for="entity-units">Unidades</label>
                    <input id="entity-units" name="units" type="number" value="${entity.units}"/>
                </div>    
                <button type="submit">
                    <i class="ms-Icon ms-Icon--Save"></i>
                    <p>Salvar</p>
                </button>
            </form>
            <table>
                <thead>                    
                    <tr>
                        <th>#ID</th>
                        <th>Carrinho</th>
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th></th>
                    </tr>
                </thead>
                <c:forEach var="e" items="${dao.list()}">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.cart.id}</td>
                        <td>${e.product.name}</td>
                        <td>${e.units}</td>                   
                        <td>
                            <div>                                
                                <a id="edit" href="items?edit=${e.id}">
                                    <i class="ms-Icon ms-Icon--SaveAs"></i>
                                </a>
                                <a id="delete" href="items?delete=${e.id}">
                                    <i class="ms-Icon ms-Icon--Delete"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>