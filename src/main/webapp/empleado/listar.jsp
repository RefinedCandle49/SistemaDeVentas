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
<main>
    <a href="registrar.jsp">Registrar empleado</a>
    <div>
        <table>
            <thead>
            <tr>
<%--                <th>ID</th>--%>
                <th>Apellido</th>
                <th>Nombre</th>
                <th>DNI</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="emp" items="${list}">
                <tr>
<%--                    <td>${emp.getId()}</td>--%>
                    <td>${emp.getApellido()}</td>
                    <td>${emp.getNombre()}</td>
                    <td>${emp.getDni()}</td>
                    <td><a href="editar.jsp?id=${emp.getId()}"><p>Editar</p></a></td>
                    <td><a href="editar.jsp?id=${emp.getId()}"><p>Eliminar</p></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
