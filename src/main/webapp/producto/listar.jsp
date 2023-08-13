<%@ page import="modelo.producto, conexion.*, dao.ProductoDAO, java.util.*" %>

<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 5/08/2023
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" href="../estilos/general.css">
    <link rel="stylesheet" href="../estilos/tables.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Lista de productos</title>
</head>
<body>
<%
    List<producto> miLista = ProductoDAO.listar();
    request.setAttribute("list", miLista);
%>
<main>
    <a class="productRegisterButton registerButton" href="registrar.jsp">
        <i class="fa-solid fa-plus fa-xl" style="color: #ffffff;"></i>
        Agregar producto
    </a>
    <div class="tableContainer">
        <table>
            <thead class="productTableHead">
            <tr>
<%--                <th>ID</th>--%>
                <th>SKU</th>
                <th>Producto</th>
                <th>Empresa</th>
                <th>Categoría</th>
                <th>Precio Unitario</th>
                <th>Stock</th>
                <th class="tableHeader">Acciones</th>
            </tr>
            </thead>
            <tbody class="productTableBody">
            <c:forEach var="prod" items="${list}">
                <tr>
<%--                    <td>${prod.getId()}</td>--%>
                    <td>${prod.getId()}</td>
                    <td>${prod.getNombreProducto()}</td>
                    <td>${prod.getRazonSocial()}</td>
                    <td>${prod.getNombreCategoria()}</td>
                    <td>${prod.getPrecioUnitario()}</td>
                    <td>${prod.getUnidadesStock()}</td>
                    <td class="tableButtons">
                        <a href="editar.jsp?id=${prod.getId()}" class="edit-button"><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"/></svg></a>
                        <a href="eliminar.jsp?id=${prod.getId()}" class="trash-button"><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16zM53.2 467a48 48 0 0 0 47.9 45h245.8a48 48 0 0 0 47.9-45L416 128H32z"/></svg></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
