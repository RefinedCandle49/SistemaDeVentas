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
    <title>Editar categoría</title>
    <%
        String id = request.getParameter("id");
        int idCategoria = Integer.parseInt(id);
        categoria cat = CategoriaDAO.buscarPorId(idCategoria);
    %>
</head>
<body>
<main>
    <form action="editar.jsp" method="post">
        <label>
            Id:
            <input type="text" name="id" value="<%=idCategoria%>">
        </label>
        <label>
            Nombre:
            <input type="text" name="nombreCategoria" value="<%=cat.getNombreCategoria()%>" pattern="[^áéíóúÁÉÍÓÚ]+" title="No se permiten tildes">
        </label>
        
        <label>
            Descripción:
            <input type="text" name="descripcion" value="<%=cat.getDescripcion()%>" pattern="[^áéíóúÁÉÍÓÚ]+" title="No se permiten tildes">
        </label>
        
        <input type="submit" value="Guardar">
    </form>
    <a href="listar.jsp">Regresar</a>
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
