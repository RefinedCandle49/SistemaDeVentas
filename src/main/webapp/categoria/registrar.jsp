<%@ page import="modelo.categoria,conexion.*, dao.CategoriaDAO, java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 6/08/2023
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="categoria" class="modelo.categoria"/>
<jsp:setProperty property="*" name="categoria"/>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>Registrar categoría</title>
</head>
<body>
<main>
    <form action="registrar.jsp" method="post">
        <label>
            Nombre:
            <input type="text" name="nombreCategoria" pattern="[^áéíóúÁÉÍÓÚ]+" title="No se permiten tildes">
        </label>
        
        <label>
            Descripción:
            <input type="text" name="descripcion" pattern="[^áéíóúÁÉÍÓÚ]+" title="No se permiten tildes">
        </label>
        
        <input type="submit" value="Registrar">
    </form>
    <a href="listar.jsp">Regresar</a>
</main>
<%
    try {
        /* Enviar datos a la tabla */
        int i = CategoriaDAO.registrar(categoria);
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
