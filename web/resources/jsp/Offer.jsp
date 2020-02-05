<%-- 
    Document   : Offer
    Created on : 28/01/2020, 03:43:49
    Author     : lucim
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="x" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty param.edit}">
    <jsp:setProperty name="entity" property="id"/>
    <jsp:setProperty name="entity" property="code"/>
    <jsp:setProperty name="entity" property="discount"/>
    <jsp:setProperty name="entity" property="units"/>
    <c:if test="${not empty param.discount}">
        <jsp:setProperty name="entity" property="discount" value="${Double.parseDouble(param.discount)}"/>
    </c:if>
</c:if>
<c:if test="${not empty param.edit}">
    <c:set var="entity" value="${dao.find(param.edit)}"/>
</c:if>
<c:choose>
    <c:when test="${not empty entity.code and empty param.edit}">
        ${dao.save(entity)}
        <jsp:setProperty name="entity" property="id" value="0"/>
        <jsp:setProperty name="entity" property="code" value=""/>
        <jsp:setProperty name="entity" property="discount" value="0"/>
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
        <title>JAVAtacado | Ofertas</title>
        <link href="resources/css/site.min.css" type="text/css" rel="stylesheet">
        <link href="resources/css/fabric.min.css" type="text/css" rel="stylesheet">
    </head>
    <body class="ms-Fabric">
        <x:nav/>
        <div class="jsp-content-layout">
            <form>
                <h1>Ofertas</h1>
                <div>
                    <input id="entity-id" name="id" type="number" value="${entity.id}" hidden/>
                </div>
                <div>
                    <label for="entity-code">Código Promocional</label>
                    <input id="entity-code" name="code" type="text" value="${entity.code}"/>
                </div>           
                <div>
                    <label for="entity-discount">Desconto</label>
                    <input id="entity-discount" name="discount" type="number" step=".05" value="${entity.discount}"/>                    
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
                        <th>Código Promocional</th>
                        <th>Desconto</th>
                        <th>Unidades</th>
                        <th></th>
                    </tr>
                </thead>
                <c:forEach var="e" items="${dao.list()}">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.code}</td>                    
                        <td>${e.discount * 100}%</td>                    
                        <td>${e.units}</td>                    
                        <td>
                            <div>                                
                                <a id="edit" href="offers?edit=${e.id}">
                                    <i class="ms-Icon ms-Icon--SaveAs"></i>
                                </a>
                                <a id="delete" href="offers?delete=${e.id}">
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