<%@ page import="modelo.empleado, conexion.*, dao.EmpleadoDAO, java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 5/08/2023
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>Lista de empleados</title>
</head>
<body>
<%
    List<empleado> miLista = EmpleadoDAO.listar();
    request.setAttribute("list", miLista);
%>
<div>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>DNI</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="emp" items="${list}">
            <tr>
                <td>${emp.getId()}</td>
                <td>${emp.getNombre()}</td>
                <td>${emp.getApellido()}</td>
                <td>${emp.getDni()}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
