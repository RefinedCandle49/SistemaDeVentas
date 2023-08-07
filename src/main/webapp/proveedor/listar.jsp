<%@ page import="modelo.proveedor, conexion.*, dao.ProveedorDAO, java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 5/08/2023
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>Lista de proveedores</title>
</head>
<body>
<%
  List<proveedor> miLista = ProveedorDAO.listar();
  request.setAttribute("list", miLista);
%>
<main>
  <a href="registrar.jsp">Registrar proveedor</a>
  <div>
    <table>
      <thead>
      <tr>
        <th>ID</th>
        <th>Razón social</th>
        <th>Representante</th>
        <th>Dirección</th>
        <th>Teléfono</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="prov" items="${list}">
        <tr>
          <td>${prov.getId()}</td>
          <td>${prov.getRazonSocial()}</td>
          <td>${prov.getRepresentante()}</td>
          <td>${prov.getDireccion()}</td>
          <td>${prov.getTelefono()}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</main>
</body>
</html>
