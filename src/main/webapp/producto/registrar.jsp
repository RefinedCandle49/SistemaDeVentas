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
    <link rel="stylesheet" href="../estilos/register.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    <a class="supplierRegisterButton returnButton" href="listar.jsp">
        <i class="fa-solid fa-rotate-left fa-xl" style="color: #ffffff;"></i>
        Regresar
    </a>
    <div class="registerContainer">
        <form class="productForm" action="registrar.jsp" method="post">
            <h1>Registrar producto</h1>
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
            
            <input class="productRegisterButton" type="submit" value="Registrar">
        </form>
    </div>
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
