<%@ page import="modelo.venta, dao.VentaDAO, conexion.*, java.util.*" %>
<%@ page import="dao.ProductoDAO, modelo.producto" %>
<%@ page import="modelo.detalleVenta, dao.DetalleVentaDAO" %><%--
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
        String idVenta = request.getParameter("idVenta");
        String idProducto = request.getParameter("idProducto");
    %>
    
    <%
        producto prod= DetalleVentaDAO.buscarStock(Integer.parseInt(idProducto));
        /*int cantidad = prod.getUnidadesStock();*/
    %>
    
    <jsp:useBean id="detalleVenta" class="modelo.detalleVenta"/>
    <jsp:setProperty property="*" name="detalleVenta"/>
    <link rel="stylesheet" href="../estilos/general.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="../estilos/detalleVentaForm.css">
    <title>Agregar detalle venta</title>
</head>
<body>
<main>
    <form action="verificarCantidad.jsp" method="post">
        
        <label class="invisible">
            ID VENTA:
            <input type="text" name="idVenta" value="<%=idVenta%>">
        </label>
        
        <label class="invisible">
            ID PRODUCTO:
            <input type="text" name="idProducto" value="<%=idProducto%>">
        </label>
        
        <label>
            Cantidad:
            <input type="number" name="cantidad" min="0" max="<%=prod.getUnidadesStock()%>"  placeholder="Stock: <%=prod.getUnidadesStock()%>" required>
        </label>
        
        <label>
            Descuento:
            <input type="number" name="descuento" min="0" placeholder="S/.">
        </label>
        
        
        <input class="registerButton saleRegisterButton" type="submit" value="Enviar">
    </form>
</main>

<%
    try {
        /* Enviar datos a la tabla */
        int i = DetalleVentaDAO.registrar(detalleVenta);
        
            int idProductoActualizar = (Integer.parseInt(idProducto));
            String cantidad = request.getParameter("cantidad");
            int cantidadActualizar = (Integer.parseInt(cantidad));
            int montoActualizar = (Integer.parseInt(idVenta));
            DetalleVentaDAO.actualizarStock(prod.getUnidadesStock(), idProductoActualizar, cantidadActualizar);
            DetalleVentaDAO.actualizarMonto(montoActualizar);
        response.sendRedirect("refresh.jsp");
        
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
