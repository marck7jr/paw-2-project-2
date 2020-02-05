<%-- 
    Document   : Cart
    Created on : 28/01/2020, 04:59:14
    Author     : lucim
--%>

<%@page import="Models.Item"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="x" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty param.edit}">
    <jsp:setProperty name="entity" property="id"/>
    <jsp:setProperty name="entity" property="account" value="${_dao.find(param.account)}"/>
    <jsp:setProperty name="entity" property="items"/>
</c:if>
<c:if test="${not empty param.edit}">
    <c:set var="entity" value="${dao.find(param.edit)}"/>
</c:if>
<c:choose>
    <c:when test="${not empty entity.account and empty param.edit}">
        ${dao.save(entity)}
        <jsp:setProperty name="entity" property="id" value="0"/>
        <jsp:setProperty name="entity" property="account" value="${null}"/>
    </c:when>
    <c:when test="${not empty param.delete}">
        ${dao.delete(dao.find(param.delete))}
    </c:when>
</c:choose>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAVAtacado | Carrinhos</title>
        <link href="resources/css/site.min.css" type="text/css" rel="stylesheet">
        <link href="resources/css/fabric.min.css" type="text/css" rel="stylesheet">
    </head>
    <body class="ms-Fabric">
        <x:nav/>
        <div class="jsp-content-layout">
            <form>
                <h1>Carrinhos</h1>
                <div>
                    <input id="entity-id" name="id" type="number" value="${entity.id}" hidden/>
                </div>    
                <div>
                    <label for="entity-account">Usuário</label>
                    <select id="entity-account" name="account" value="${entity.account.id}">
                        <c:forEach var="e" items="${_dao.list()}">
                            <option value="${e.id}">${e.name}</option>
                        </c:forEach>
                    </select>
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
                        <th>Usuário</th>
                        <th>Items</th>
                        <th></th>
                    </tr>
                </thead>
                <c:forEach var="e" items="${dao.list()}">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.account.name}</td>
                        <td>${e.items.size()}</td>                   
                        <td>
                            <div>                                
                                <a id="edit" href="products?edit=${e.id}">
                                    <i class="ms-Icon ms-Icon--SaveAs"></i>
                                </a>
                                <a id="delete" href="products?delete=${e.id}">
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