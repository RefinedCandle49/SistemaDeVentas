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
        List<producto> miListaProducto = ProductoDAO.listar();
        request.setAttribute("productoList", miListaProducto);
        
    %>
    
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
    <title>Agregar detalle venta</title>
</head>
<body>
<main>
    <form action="verificarCantidad.jsp" method="post">
        
        <label <%--style="display: none"--%>>
            ID VENTA:
            <input type="text" name="idVenta" value="<%=idVenta%>">
        </label>
        
        <label>
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
        
        
        <input type="submit" value="Enviar">
    </form>
</main>

<%
    //    if ((request.getParameter("nombre")!= null) && (request.getParameter("empresa")!= null) && (request.getParameter("web")!= null) && (request.getParameter("cargo")!= null) && (request.getParameter("email")!= null) && (request.getParameter("telefono")!= null) && (request.getParameter("leads")!= null)){
    try {
        /* Enviar datos a la tabla */
        int i = DetalleVentaDAO.registrar(detalleVenta);
        
            int idProductoActualizar = (Integer.parseInt(idProducto));
            String cantidad = request.getParameter("cantidad");
            int cantidadActualizar = (Integer.parseInt(cantidad));
            int o = DetalleVentaDAO.actualizarStock(prod.getUnidadesStock(), idProductoActualizar, cantidadActualizar);
        
        
        
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
