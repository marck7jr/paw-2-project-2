<%-- 
    Document   : Accounts
    Created on : 27/01/2020, 15:38:02
    Author     : lucim
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="x" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="Services.AccountDAO"/>
<c:if test="${empty param.edit}">
    <jsp:useBean id="entity" class="Models.Account"/>
    <jsp:setProperty name="entity" property="id"/>
    <jsp:setProperty name="entity" property="name"/>
    <jsp:setProperty name="entity" property="email"/>
    <fmt:parseDate var="parsedBirthDate" pattern="yyyy-MM-dd" type="date" value="${param.birthDate}"/>
    <jsp:setProperty name="entity" property="birthDate" value="${parsedBirthDate}"/>
    <jsp:setProperty name="entity" property="password"/>
</c:if>
<c:if test="${not empty param.edit}">
    <c:set var="entity" value="${dao.find(param.edit)}"/>
</c:if>
<c:choose>
    <c:when test="${not empty entity.name and empty param.edit}">
        ${dao.save(entity)}
        <jsp:setProperty name="entity" property="id" value="0"/>
        <jsp:setProperty name="entity" property="name" value=""/>
        <jsp:setProperty name="entity" property="email" value=""/>
        <jsp:setProperty name="entity" property="password" value=""/>
    </c:when>
    <c:when test="${not empty param.delete}">
        ${dao.delete(dao.find(param.delete))}
    </c:when>
</c:choose>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAVAtacado | Usuários</title>
        <link href="resources/css/site.min.css" type="text/css" rel="stylesheet">
        <link href="resources/css/fabric.min.css" type="text/css" rel="stylesheet">
    </head>
    <body class="ms-Fabric">
        <x:nav/>
        <div class="jsp-content-layout">
            <form>
                <h1>Usuários</h1>
                <div>
                    <input id="entity-id" name="id" type="number" value="${entity.id}" hidden/>
                </div>
                <div>
                    <label for="entity-name">Nome</label>
                    <input id="entity-name" name="name" type="text" value="${entity.name}"/>
                </div>
                <div>
                    <label for="entity-email">Email</label>
                    <input id="entity-email" name="email" type="email" value="${entity.email}"/>
                </div>
                <div>
                    <label for="entity-birthDay">Data de Nascimento</label>
                    <input id="entity-birthDay" name="birthDate" type="date" value="<c:if test="${not empty param.edit}"><fmt:formatDate pattern="yyyy-MM-dd" value="${entity.birthDate}"/></c:if>"/>
                </div>
                <div>
                    <label for="entity-password">Senha</label>
                    <input id="entity-password" name="password" type="password" value="${entity.password}"/>
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
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Data de Nascimento</th>
                        <th></th>
                    </tr>
                </thead>
                <c:forEach var="a" items="${dao.list()}">
                    <tr>
                        <td>${a.id}</td>
                        <td>${a.name}</td>
                        <td>${a.email}</td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${a.birthDate}"/></td>
                        <td>
                            <div>                                
                                <a id="edit" href="accounts?edit=${a.id}">
                                    <i class="ms-Icon ms-Icon--SaveAs"></i>
                                </a>
                                <a id="delete" href="accounts?delete=${a.id}">
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