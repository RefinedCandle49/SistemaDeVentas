<%@ page import="modelo.producto, conexion.*, dao.ProductoDAO, java.util.*" %>

<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 5/08/2023
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>Lista de productos</title>
</head>
<body>
<%
    List<producto> miLista = ProductoDAO.listar();
    request.setAttribute("list", miLista);
%>
<div>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Producto</th>
            <th>Empresa</th>
            <th>Categoría</th>
            <th>Precio Unitario</th>
            <th>Stock</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="prod" items="${list}">
            <tr>
                <td>${prod.getId()}</td>
                <td>${prod.getNombreProducto()}</td>
                <td>${prod.getRazonSocial()}</td>
                <td>${prod.getNombreCategoria()}</td>
                <td>${prod.getPrecioUnitario()}</td>
                <td>${prod.getUnidadesStock()}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
