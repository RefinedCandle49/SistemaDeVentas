<%@ page import="modelo.categoria, conexion.*, dao.CategoriaDAO, java.util.*" %>
<%--  Created by IntelliJ IDEA.
  User: valde
  Date: 4/08/2023
  Time: 21:23
  To change this template use File | Settings | File Templates.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>Lista de categorías</title>
</head>
<body>
<%
    List<categoria> miLista = CategoriaDAO.listar();
    request.setAttribute("list", miLista);
%>
<main>
    <a href="registrar.jsp">Registrar categoria</a>
    <div>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Categoría:</th>
                <th>Descripción</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cat" items="${list}">
                <tr>
                    <td>${cat.getId()}</td>
                    <td>${cat.getNombreCategoria()}</td>
                    <td>${cat.getDescripcion()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
