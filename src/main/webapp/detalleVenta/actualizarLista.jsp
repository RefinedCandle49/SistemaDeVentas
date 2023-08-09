<%@ page import="modelo.venta, dao.VentaDAO, conexion.*, java.util.*" %>
<%@ page import="dao.ProductoDAO, modelo.producto" %>
<%@ page import="modelo.detalleVenta, dao.DetalleVentaDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 8/08/2023
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
        String id = request.getParameter("idVenta");
        
        int idVenta = Integer.parseInt(id);
        
        List<detalleVenta> miListaDetalleVenta = DetalleVentaDAO.listar(idVenta);
        request.setAttribute("detalleVentaList", miListaDetalleVenta);
    %>
    <jsp:useBean id="detalleVenta" class="modelo.detalleVenta"/>
    <jsp:setProperty property="*" name="detalleVenta"/>
    <title>Agregar Detalle Venta</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <%--                <th>ID</th>--%>
        <th>Nombre</th>
        <th>Cantidad</th>
        <th>Descuento</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="detVenta" items="${detalleVentaList}">
        <tr>
                <%--                    <td>${vent.getId()}</td>--%>
            <td>${detVenta.getNombreProducto()}</td>
            <td>${detVenta.getCantidad()}</td>
            <td>${detVenta.getDescuento()}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
