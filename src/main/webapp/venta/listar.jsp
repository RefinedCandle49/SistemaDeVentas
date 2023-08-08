<%@ page import="modelo.venta, conexion.*, dao.VentaDAO, java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 6/08/2023
  Time: 08:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>Listar Venta</title>
</head>
<body>
<%
    List<venta> miLista = VentaDAO.listar();
    request.setAttribute("list", miLista);
%>
<main>
    <a href="registrar.jsp">Registrar venta</a>
    <div>
        <table>
            <thead>
            <tr>
<%--                <th>ID</th>--%>
                <th>Fecha</th>
                <th>Cliente</th>
                <th>Empleado</th>
                <th>Monto</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="vent" items="${list}">
                <tr>
<%--                    <td>${vent.getId()}</td>--%>
                    <td>${vent.getFechaVenta()}</td>
                    <td>${vent.getCliente()}</td>
                    <td>${vent.getApellidoEmpleado()}, ${vent.getNombreEmpleado()}</td>
                    <td>${vent.getMonto()}</td>
                    <td><a class="edit" href="../detalleVenta/listar-registrar.jsp?idVenta=${vent.getId()}"><p>Ver detalle</p></a></td>
                    <td><a class="delete" href="/detalleVenta/listar-registrar.jsp?idVenta=${vent.getId()}"><p>Eliminar</p></a>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
<%--VENTA NO PODRÁ SER EDITADA, SOLO ELIMINADA, DENTRO DE "VER DETALLE VENTA"
PODRÁS AGREGAR DETALLES DE LA VENTA Y EN LA PARTE INFERIOR UNA TABLA CON LOS DETALLES DE VENTA DE ESA VENTA--%>
</body>
</html>
