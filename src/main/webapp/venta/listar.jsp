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
    <link rel="stylesheet" href="../estilos/general.css">
    <link rel="stylesheet" href="../estilos/tables.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Listar Venta</title>
</head>
<body>
<%
    List<venta> miLista = VentaDAO.listar();
    request.setAttribute("list", miLista);
%>
<main>
    <a class="saleRegisterButton registerButton" href="registrar.jsp">
        <i class="fa-solid fa-plus fa-xl" style="color: #ffffff;"></i>
        Agregar venta
    </a>
    <div class="tableContainer">
        <table>
            <thead class="saleTableHead">
            <tr>
<%--                <th>ID</th>--%>
                <th>Fecha</th>
                <th>Cliente</th>
                <th>Empleado</th>
                <th>Monto</th>
                <th class="tableHeader">Acciones</th>
            </tr>
            </thead>
            <tbody class="saleTableBody">
            <c:forEach var="vent" items="${list}">
                <tr>
<%--                    <td>${vent.getId()}</td>--%>
                    <td>${vent.getFechaVenta()}</td>
                    <td>${vent.getCliente()}</td>
                    <td>${vent.getApellidoEmpleado()}, ${vent.getNombreEmpleado()}</td>
                    <td>${vent.getMonto()}</td>
                    <td class="tableButtons">
                        <a href="listarDetallesVenta.jsp?idVenta=${vent.getId()}" class="edit-button"><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z"/></svg></a>
                        <a href="eliminar.jsp?id=${vent.getId()}" class="trash-button"><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M367.2 412.5L99.5 144.8C77.1 176.1 64 214.5 64 256c0 106 86 192 192 192c41.5 0 79.9-13.1 111.2-35.5zm45.3-45.3C434.9 335.9 448 297.5 448 256c0-106-86-192-192-192c-41.5 0-79.9 13.1-111.2 35.5L412.5 367.2zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256z"/></svg></a>
                    </td>
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
