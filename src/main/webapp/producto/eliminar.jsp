<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 10/08/2023
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ page import="modelo.producto, dao.ProductoDAO, conexion.*" %>
<%--    <jsp:useBean id="prodDesactivar" class="modelo.producto"/>
    <jsp:setProperty property="idEstado" name="prodDesactivar"/>--%>
    <title>Eliminar</title>
    <%
        String id = request.getParameter("id");
        producto prod = ProductoDAO.buscarPorId(Integer.parseInt(id));
    %>
</head>
<body>
<main>
    Hola
    <%=id%>
    ${prod.getId()}
    <%
        try {
            /* Enviar datos a la tabla */
            int i = ProductoDAO.desactivarProducto(Integer.parseInt(id));
            if (i > 0){
                response.sendRedirect("listar.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    %>
</main>
</body>
</html>
