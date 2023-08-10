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
    <%@page import="conexion.*, java.util.*" %>
    <%@ page import="dao.ProductoDAO" %>
    <%@ page import="modelo.producto" %>
    <jsp:useBean id="prodActualizar" class="modelo.producto"/>
    <jsp:setProperty property="*" name="prodActualizar"/>
    <title>Editar producto</title>
    <%
        String id = request.getParameter("id");
        int idProducto = Integer.parseInt(id);
        producto prod = ProductoDAO.buscarPorId(idProducto);
    %>
</head>
<body>
<main>
    <form action="registrar.jsp" method="post">
        <label>
            Id:
            <input type="text" name="id" value="">
        </label>
        
        <label>
            Nombre:
            <input type="text" name="nombre" placeholder="" value="<%=prod.getNombreProducto()%>">
        </label>
    </form>
</main>
</body>
</html>
