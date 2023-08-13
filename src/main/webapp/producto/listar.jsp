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
    <link rel="stylesheet" href="../estilos/general.css">
    <title>Lista de productos</title>
</head>
<body>
<%
    List<producto> miLista = ProductoDAO.listar();
    request.setAttribute("list", miLista);
%>
<main>
    <a href="registrar.jsp">Registrar proveedor</a>
    <div>
        <table>
            <thead>
            <tr>
<%--                <th>ID</th>--%>
                <th>SKU</th>
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
<%--                    <td>${prod.getId()}</td>--%>
                    <td>${prod.getId()}</td>
                    <td>${prod.getNombreProducto()}</td>
                    <td>${prod.getRazonSocial()}</td>
                    <td>${prod.getNombreCategoria()}</td>
                    <td>${prod.getPrecioUnitario()}</td>
                    <td>${prod.getUnidadesStock()}</td>
                    <td><a href="editar.jsp?id=${prod.getId()}"><p>Editar</p></a></td>
                    <td><a href="eliminar.jsp?id=${prod.getId()}"><p>Eliminar</p></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
