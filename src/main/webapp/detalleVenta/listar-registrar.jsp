<%@ page import="modelo.venta, dao.VentaDAO, conexion.*, java.util.*" %>
<%@ page import="dao.ProductoDAO, modelo.producto" %>
<%@ page import="modelo.detalleVenta, dao.DetalleVentaDAO" %><%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 7/08/2023
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
        String id = request.getParameter("idVenta");
        List<producto> miListaProducto = DetalleVentaDAO.listarProductosConStock();
        request.setAttribute("productoList", miListaProducto);
        
        int idVenta = Integer.parseInt(id);
        
        List<detalleVenta> miListaDetalleVenta = DetalleVentaDAO.listar(idVenta);
        request.setAttribute("detalleVentaList", miListaDetalleVenta);
    %>
    <jsp:useBean id="detalleVenta" class="modelo.detalleVenta"/>
    <jsp:setProperty property="*" name="detalleVenta"/>
    <link rel="stylesheet" href="../estilos/general.css">
    <title>Agregar detalle venta</title>
</head>
<body>
<main>
    <a href="../venta/listar.jsp">Regresar</a>
    <form action="actualizarLista.jsp" method="post" target="miIframe2">
        <label class="invisible">
            <select name="idVenta">
                <option value="<%=idVenta%>"><%=idVenta%></option>
            </select>
        </label>
        
        <iframe name="miIframe2"></iframe>
        <input type="submit" value="Actualizar">
    </form>
    
    <form action="verificarCantidad.jsp" method="post" target="miIframe">
        <label class="invisible">
            <select name="idVenta">
                <option value="<%=idVenta%>"><%=idVenta%></option>
            </select>
        </label>
        
        <label>
            Producto:
            <select name="idProducto" required>
                <option value="" disabled selected class="invisible">Seleccionar opción</option>
                <c:forEach var="prod" items="${productoList}">
                    <option value="${prod.getId()}">${prod.getNombreProducto()}</option>
                </c:forEach>
            </select>
        </label>
        
        <iframe name="miIframe"></iframe>
        
        <input type="submit" value="Seleccionar">
    </form>
</main>
</body>
</html>
