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
        List<producto> miListaProducto = ProductoDAO.listar();
        request.setAttribute("productoList", miListaProducto);
        
        int idVenta = Integer.parseInt(id);
        
        List<detalleVenta> miListaDetalleVenta = DetalleVentaDAO.listar(idVenta);
        request.setAttribute("detalleVentaList", miListaDetalleVenta);
    %>
    <jsp:useBean id="detalleVenta" class="modelo.detalleVenta"/>
    <jsp:setProperty property="*" name="detalleVenta"/>
    <title>Agregar detalle venta</title>
</head>
<body>
<%=idVenta%>
<main>
    <a href="../venta/listar.jsp">Regresar</a>
    <form action="actualizarLista.jsp" method="post" target="miIframe2">
        <label style="display: none">
            <select name="idVenta">
                <option value="<%=idVenta%>"><%=idVenta%></option>
            </select>
        </label>
        
        <iframe name="miIframe2"></iframe>
        <input type="submit" value="Actualizar">
    </form>
<%--    <div>
        <table>
            <thead>
            <tr>
                &lt;%&ndash;                <th>ID</th>&ndash;%&gt;
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Descuento</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="detVenta" items="${detalleVentaList}">
                <tr>
                        &lt;%&ndash;                    <td>${vent.getId()}</td>&ndash;%&gt;
                    <td>${detVenta.getNombreProducto()}</td>
                    <td>${detVenta.getCantidad()}</td>
                    <td>${detVenta.getDescuento()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>--%>
    
    <form action="verificarCantidad.jsp" method="post" target="miIframe">
        <label style="display: none">
            <select name="idVenta">
                <option value="<%=idVenta%>"><%=idVenta%></option>
            </select>
        </label>
        
        <label>
            Producto:
            <select name="idProducto" required>
                <option value="" disabled selected style="display:none;">Seleccionar opción</option>
                <c:forEach var="prod" items="${productoList}">
                    <option value="${prod.getId()}">${prod.getNombreProducto()}</option>
                </c:forEach>
            </select>

        </label>
        <input type="submit" value="Seleccionar">
        <iframe name="miIframe"></iframe>
        
        <%--<label>
            Cantidad:
            <input type="number" min="0" name="cantidad" required>
        </label>
        
        <label>
            Descuento:
            <input type="number" min="0" placeholder="S/." name="descuento">
        </label>--%>
        
        
    </form>
</main>
<%--<%
    //    if ((request.getParameter("nombre")!= null) && (request.getParameter("empresa")!= null) && (request.getParameter("web")!= null) && (request.getParameter("cargo")!= null) && (request.getParameter("email")!= null) && (request.getParameter("telefono")!= null) && (request.getParameter("leads")!= null)){
    try {
        /* Enviar datos a la tabla */
        int i = DetalleVentaDAO.registrar(detalleVenta);
        
    } catch (Exception e) {
        System.out.println(e);
    }
%>--%>
</body>
</html>
