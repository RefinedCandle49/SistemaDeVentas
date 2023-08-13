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
    <title>Listar Venta</title>
</head>
<body>
<%
    List<venta> miLista = VentaDAO.listar();
    request.setAttribute("list", miLista);
%>
<main>
    <a href="registrar.jsp">Registrar venta</a>
    <div class="tableContainer">
        <table>
            <thead>
            <tr>
<%--                <th>ID</th>--%>
                <th>Fecha</th>
                <th>Cliente</th>
                <th>Empleado</th>
                <th>Monto</th>
                <th class="tableHeader" colspan="2">Acciones</th>
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
                    <td class="tableButtons"><a href="../detalleVenta/actualizarLista.jsp?idVenta=${vent.getId()}" class="edit-button"><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z"/></svg></a></td>
                    <td class="tableButtons"><a href="eliminar.jsp?id=${vent.getId()}" class="trash-button"><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16zM53.2 467a48 48 0 0 0 47.9 45h245.8a48 48 0 0 0 47.9-45L416 128H32z"/></svg></a></td>
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
