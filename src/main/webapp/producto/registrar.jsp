<%@ page import="dao.ProveedorDAO" %>
<%@ page import="modelo.proveedor" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.categoria, modelo.producto" %>
<%@ page import="dao.CategoriaDAO, dao.ProductoDAO" %><%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 6/08/2023
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="producto" class="modelo.producto"/>
<jsp:setProperty property="*" name="producto"/>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" href="../estilos/general.css">
    <title>Registrar producto</title>
</head>
<body>
<%
    List<proveedor> miListaProveedor = ProveedorDAO.listar();
    request.setAttribute("proveedorList", miListaProveedor);
    
    List<categoria> miListaCategoria = CategoriaDAO.listar();
    request.setAttribute("categoriaList", miListaCategoria);
%>
<main>
    <form action="registrar.jsp" method="post">
        <label>
            Producto:
            <input type="text" name="nombreProducto">
        </label>
        
        <label>
            Proveedor:
            <select name="idProveedor" required>
                <option value="" disabled selected class="invisible">Seleccionar opción</option>
                <c:forEach var="prov" items="${proveedorList}">
                    <option value="${prov.getId()}">${prov.getRazonSocial()}</option>
                </c:forEach>
            </select>
        </label>
        
        <label>
            Categoría:
            <select name="idCategoria" required>
                <option value="" disabled selected class="invisible">Seleccionar opción</option>
                <c:forEach var="cat" items="${categoriaList}">
                    <option value="${cat.getId()}">${cat.getNombreCategoria()}</option>
                </c:forEach>
            </select>
        </label>
        
        <label>
            Precio Unitario:
            <input type="number" name="precioUnitario" step=".01" min="0.00">
        </label>
        
        <label>
            Stock:
            <input type="number" name="unidadesStock" min="0">
        </label>
        
        <input type="submit" value="Registrar">
    </form>
    <a href="listar.jsp">Regresar</a>
</main>
<%
    try {
        /* Enviar datos a la tabla */
        int i = ProductoDAO.registrar(producto);
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
