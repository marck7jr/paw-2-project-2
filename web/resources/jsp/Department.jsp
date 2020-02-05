<%-- 
    Document   : Department
    Created on : 28/01/2020, 02:16:00
    Author     : lucim
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="x" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty param.edit}">
    <jsp:setProperty name="entity" property="id"/>
    <jsp:setProperty name="entity" property="name"/>
</c:if>
<c:if test="${not empty param.edit}">
    <c:set var="entity" value="${dao.find(param.edit)}"/>
</c:if>
<c:choose>
    <c:when test="${not empty entity.name and empty param.edit}">
        ${dao.save(entity)}
        <jsp:setProperty name="entity" property="id" value="0"/>
        <jsp:setProperty name="entity" property="name" value=""/>
    </c:when>
    <c:when test="${not empty param.delete}">
        ${dao.delete(dao.find(param.delete))}
    </c:when>
</c:choose>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAVAtacado | Departamentos</title>
        <link href="resources/css/site.min.css" type="text/css" rel="stylesheet">
        <link href="resources/css/fabric.min.css" type="text/css" rel="stylesheet">
    </head>
    <body class="ms-Fabric">
        <x:nav/>
        <div class="jsp-content-layout">
            <form>
                <h1>Departamentos</h1>
                <div>
                    <input id="entity-id" name="id" type="number" value="${entity.id}" hidden/>
                </div>
                <div>
                    <label for="entity-name">Nome</label>
                    <input id="entity-name" name="name" type="text" value="${entity.name}"/>
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
                        <th></th>
                    </tr>
                </thead>
                <c:forEach var="e" items="${dao.list()}">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                        <td>
                            <div>                                
                                <a id="edit" href="departments?edit=${e.id}">
                                    <i class="ms-Icon ms-Icon--SaveAs"></i>
                                </a>
                                <a id="delete" href="departments?delete=${e.id}">
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