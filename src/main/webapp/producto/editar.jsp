<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 10/08/2023
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="dao.ProveedorDAO, dao.CategoriaDAO, dao.ProductoDAO" %>
    <%@page import="conexion.*, java.util.*" %>
    <%@ page import="modelo.categoria, modelo.producto, modelo.proveedor" %>
    <jsp:useBean id="prodActualizar" class="modelo.producto"/>
    <jsp:setProperty property="*" name="prodActualizar"/>
    <link rel="stylesheet" href="../estilos/general.css">
    <title>Editar producto</title>
    <%
        String id = request.getParameter("id");
        int idProducto = Integer.parseInt(id);
        producto prod = ProductoDAO.buscarPorId(idProducto);
        
        List<proveedor> miListaProveedor = ProveedorDAO.listar();
        request.setAttribute("proveedorList", miListaProveedor);
        
        List<categoria> miListaCategoria = CategoriaDAO.listar();
        request.setAttribute("categoriaList", miListaCategoria);
        
    %>
</head>
<body>
<main>
    <form action="editar.jsp" method="post">
        <label class="invisible">
            Id:
            <input type="text" name="id" value="<%=idProducto%>">
        </label>
        
        <label>
            Nombre:
            <input type="text" name="nombreProducto" placeholder="" value="<%=prod.getNombreProducto()%>">
        </label>

        <label>
            Proveedor:
            <select name="idProveedor" required>
                <option value="<%=prod.getIdProveedor()%>" selected class="invisible"><%=prod.getRazonSocial()%></option>
                <c:forEach var="prov" items="${proveedorList}">
                    <option value="${prov.getId()}">${prov.getRazonSocial()}</option>
                </c:forEach>
            </select>
        </label>
        
        <label>
            Categoría:
            <select name="idCategoria" required>
                <option value="<%=prod.getIdCategoria()%>" selected class="invisible"><%=prod.getNombreCategoria()%></option>
                <c:forEach var="cat" items="${categoriaList}">
                    <option value="${cat.getId()}">${cat.getNombreCategoria()}</option>
                </c:forEach>
            </select>
        </label>
        
        <label>
            Precio Unitario:
            <input type="number" name="precioUnitario" step=".01" min="0.00" value="<%=prod.getPrecioUnitario()%>">
        </label>
        
        <label>
            Stock:
            <input type="number" name="unidadesStock" min="0" value="<%=prod.getUnidadesStock()%>">
        </label>
        
        <input type="submit" value="Guardar">
    </form>
    <a href="listar.jsp">Regresar</a>
</main>
<%
    try {
        /* Enviar datos a la tabla */
        int i = ProductoDAO.actualizar(prodActualizar);
        if (i > 0){
            response.sendRedirect("listar.jsp");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
