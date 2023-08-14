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
    <link rel="stylesheet" href="../estilos/general.css">
    <link rel="stylesheet" href="../estilos/tables.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="../estilos/detalleVentaForm.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Agregar Detalle Venta</title>
</head>
<body>
<main>
    <div class="tableContainer">
        <table>
            <thead class="saleTableHead">
            <tr>
                <%--                <th>ID</th>--%>
                <th>SKU</th>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Precio Unitario</th>
                <th>Descuento Unitario</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody class="saleTableBody">
            <c:forEach var="detVenta" items="${detalleVentaList}">
                <tr>
                        <%--                    <td>${vent.getId()}</td>--%>
                    <td>${detVenta.getIdProducto()}</td>
                    <td>${detVenta.getNombreProducto()}</td>
                    <td>${detVenta.getCantidad()}</td>
                    <td>S/. ${detVenta.getPrecioUnitario()}</td>
                    <td>S/. ${detVenta.getDescuento()}</td>
                    <td>S/. ${detVenta.getTotal()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
