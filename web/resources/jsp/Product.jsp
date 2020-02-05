<%-- 
    Document   : Product
    Created on : 28/01/2020, 02:48:32
    Author     : lucim
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="x" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty param.edit}">
    <jsp:setProperty name="entity" property="id"/>
    <jsp:setProperty name="entity" property="name"/>
    <c:if test="${not empty param.price}">
        <jsp:setProperty name="entity" property="price" value="${Double.parseDouble(param.price)}"/>
    </c:if>
    <jsp:setProperty name="entity" property="units"/>
    <jsp:setProperty name="entity" property="department" value="${_dao.find(param.department)}"/>
</c:if>
<c:if test="${not empty param.edit}">
    <c:set var="entity" value="${dao.find(param.edit)}"/>
</c:if>
<c:choose>
    <c:when test="${not empty entity.name and empty param.edit}">
        ${dao.save(entity)}
        <jsp:setProperty name="entity" property="id" value="0"/>
        <jsp:setProperty name="entity" property="name" value=""/>
        <jsp:setProperty name="entity" property="price" value="0"/>
        <jsp:setProperty name="entity" property="units" value="0"/>
        <jsp:setProperty name="entity" property="department" value="${null}"/>
    </c:when>
    <c:when test="${not empty param.delete}">
        ${dao.delete(dao.find(param.delete))}
    </c:when>
</c:choose>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAVAtacado | Produtos</title>
        <link href="resources/css/site.min.css" type="text/css" rel="stylesheet">
        <link href="resources/css/fabric.min.css" type="text/css" rel="stylesheet">
    </head>
    <body class="ms-Fabric">
        <x:nav/>
        <div class="jsp-content-layout">
            <form>
                <h1>Produtos</h1>
                <div>
                    <input id="entity-id" name="id" type="number" value="${entity.id}" hidden/>
                </div>
                <div>
                    <label for="entity-name">Nome</label>
                    <input id="entity-name" name="name" type="text" value="${entity.name}"/>
                </div>
                <div>
                    <label for="entity-price">Preço</label>
                    <input id="entity-price" name="price" type="number" step=".01" value="${entity.price}"/>
                </div>
                <div>
                    <label for="entity-units">Unidades</label>
                    <input id="entity-units" name="units" type="number" value="${entity.units}"/>
                </div>            
                <div>
                    <label for="entity-department">Departamento</label>
                    <select id="entity-department" name="department" value="${entity.department.id}">
                        <c:forEach var="d" items="${_dao.list()}">
                            <option value="${d.id}">${d.name}</option>
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
                        <th>Nome</th>
                        <th>Preço</th>
                        <th>Unidades</th>
                        <th>Departamento</th>
                        <th></th>
                    </tr>
                </thead>
                <c:forEach var="e" items="${dao.list()}">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                        <td>R$ ${e.price}</td>
                        <td>${e.units}</td>                    
                        <td>${e.department.name}</td>                    
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
