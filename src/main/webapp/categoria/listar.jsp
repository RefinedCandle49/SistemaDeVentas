<%@ page import="modelo.categoria, conexion.*, dao.CategoriaDAO, java.util.*" %>
<%--  Created by IntelliJ IDEA.
  User: valde
  Date: 4/08/2023
  Time: 21:23
  To change this template use File | Settings | File Templates.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" href="../estilos/general.css">
    <title>Lista de categorías</title>
</head>
<body>
<%
    List<categoria> miLista = CategoriaDAO.listar();
    request.setAttribute("list", miLista);
%>
<main>
    <a href="registrar.jsp">Registrar categoria</a>
    <div class="tableContainer">
        <table>
            <thead>
            <tr>
<%--                <th>ID</th>--%>
                <th>Categoría:</th>
                <th>Descripción</th>
                <th class="tableHeader" colspan="2">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cat" items="${list}">
                <tr>
<%--                    <td>${cat.getId()}</td>--%>
                    <td>${cat.getNombreCategoria()}</td>
                    <td>${cat.getDescripcion()}</td>
                    <td class="tableButtons"><a href="editar.jsp?id=${cat.getId()}" class="edit-button"><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"/></svg></a></td>
                    <td class="tableButtons"><a href="eliminar.jsp?id=${cat.getId()}" class="trash-button"><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16zM53.2 467a48 48 0 0 0 47.9 45h245.8a48 48 0 0 0 47.9-45L416 128H32z"/></svg></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
