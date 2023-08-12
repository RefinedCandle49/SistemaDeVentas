<%--
  Created by IntelliJ IDEA.
  User: valde
  Date: 11/08/2023
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ page import="modelo.empleado, dao.EmpleadoDAO, conexion.*" %>
    <title>Eliminar</title>
    <%
        String id = request.getParameter("id");
        empleado prod = EmpleadoDAO.buscarPorId(Integer.parseInt(id));
    %>
</head>
<body>
<main>
    <%
        try {
            /* Enviar datos a la tabla */
            int i = EmpleadoDAO.desactivarEmpleado(Integer.parseInt(id));
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
