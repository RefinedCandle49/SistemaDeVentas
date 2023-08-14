<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 9/08/2023
  Time: 09:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@page import="modelo.categoria, conexion.*, dao.CategoriaDAO, java.util.*" %>
    <jsp:useBean id="catActualizar" class="modelo.categoria"/>
    <jsp:setProperty property="*" name="catActualizar"/>
    <link rel="stylesheet" href="../estilos/general.css">
    <link rel="stylesheet" href="../estilos/register.css">
    <link rel="stylesheet" href="../estilos/buttons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Editar categoría</title>
    <%
        String id = request.getParameter("id");
        int idCategoria = Integer.parseInt(id);
        categoria cat = CategoriaDAO.buscarPorId(idCategoria);
    %>
</head>
<body>
<main>
    <a class="categoryRegisterButton returnButton" href="listar.jsp">
        <i class="fa-solid fa-rotate-left fa-xl" style="color: #ffffff;"></i>
        Regresar
    </a>
    <div class="registerContainer">
        <form class="categoryForm" action="editar.jsp" method="post">
            <h1>Editar categoría</h1>
            <label class="invisible">
                Id:
                <input type="text" name="id" value="<%=idCategoria%>">
            </label>
            <label>
                Nombre:
                <input type="text" name="nombreCategoria" value="<%=cat.getNombreCategoria()%>" pattern="[^áéíóúÁÉÍÓÚ]+" title="No se permiten tildes">
            </label>
            
            <label>
                Descripción:
<%--                <input type="text" name="descripcion" value="<%=cat.getDescripcion()%>" pattern="[^áéíóúÁÉÍÓÚ]+" title="No se permiten tildes">--%>
                <textarea name="descripcion" id="" cols="30" rows="10"><%=cat.getDescripcion()%></textarea>
            </label>
            
            <input class="categoryRegisterButton" type="submit" value="Guardar">
        </form>
    </div>
</main>
<%
    try {
        /* Enviar datos a la tabla */
        int i = CategoriaDAO.actualizar(catActualizar);
        if (i > 0){
            response.sendRedirect("listar.jsp");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
